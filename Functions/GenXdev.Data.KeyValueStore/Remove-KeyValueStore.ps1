<##############################################################################
Part of PowerShell module : GenXdev.Data.KeyValueStore
Original cmdlet filename  : Remove-KeyValueStore.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.298.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
################################################################################
function Remove-KeyValueStore {

    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        #######################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'Name of the store to delete'
        )]
        [string]$StoreName,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'Key to identify synchronization scope'
        )]
        [string]$SynchronizationKey = 'Local',
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Database path for key-value store data files')
        )]
        [string]$DatabasePath
        #######################################################################
    )

    begin {

        # determine base directory path using provided path or default location
        if ([string]::IsNullOrWhiteSpace($DatabasePath)) {

            # build default path to local application data folder
            $basePath = "$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\KeyValueStore"
        }
        else {

            # use provided base path
            $basePath = $DatabasePath
        }

        # output verbose information about store directory location
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using KeyValueStore directory: $basePath"
    }

    process {

        # ensure store directory structure exists
        if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $basePath)) {

            # output verbose information about directory initialization
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Store directory not found, initializing'

            # create directory structure
            $null = GenXdev.Data\Initialize-KeyValueStores
        }

        # construct audit trail identifier from computer and user names
        $lastModifiedBy = "$env:COMPUTERNAME\$env:USERNAME"

        # output verbose information about operation performer
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Operation performed by: $lastModifiedBy"

        # determine appropriate operation based on synchronization scope
        if ($SynchronizationKey -eq 'Local') {
            $operation = 'Deleting local store file'
        }
        else {
            $operation = 'Marking all keys in sync store as deleted'
        }

        # verify user consent for potentially destructive operation
        if ($PSCmdlet.ShouldProcess($StoreName, $operation)) {

            # get JSON file path for this store
            $storeFilePath = GenXdev.Data\GetStoreFilePath `
                -SynchronizationKey $SynchronizationKey `
                -StoreName $StoreName `
                -BasePath $basePath

            # output verbose information about file operation
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Processing store file: $storeFilePath"

            if ($SynchronizationKey -eq 'Local') {
                # physical deletion for local stores
                if (Microsoft.PowerShell.Management\Test-Path -LiteralPath $storeFilePath) {
                    Microsoft.PowerShell.Utility\Write-Verbose `
                        'Deleting local store file'

                    Microsoft.PowerShell.Management\Remove-Item `
                        -LiteralPath $storeFilePath `
                        -Force `
                        -ErrorAction Stop
                }
                else {
                    Microsoft.PowerShell.Utility\Write-Verbose `
                        'Store file does not exist'
                }
            }
            else {
                # mark all keys as deleted for synchronized stores
                Microsoft.PowerShell.Utility\Write-Verbose `
                    'Marking all keys as deleted in synchronized store'

                # read existing store data with retry logic
                $storeData = GenXdev.FileSystem\ReadJsonWithRetry -FilePath $storeFilePath

                # mark all keys as deleted
                $currentTime = (Microsoft.PowerShell.Utility\Get-Date).ToString('o')
                foreach ($key in $storeData.Keys) {
                    if ($storeData[$key] -is [hashtable]) {
                        $storeData[$key]['deletedDate'] = $currentTime
                        $storeData[$key]['lastModified'] = $currentTime
                        $storeData[$key]['lastModifiedBy'] = $lastModifiedBy
                    }
                    else {
                        # legacy format, convert to new format with deletion
                        $storeData[$key] = @{
                            value          = $storeData[$key]
                            lastModified   = $currentTime
                            lastModifiedBy = $lastModifiedBy
                            deletedDate    = $currentTime
                        }
                    }
                }

                # write updated store data atomically with retry logic
                GenXdev.FileSystem\WriteJsonAtomic -FilePath $storeFilePath -Data $storeData

                # initiate synchronization process for cloud-synchronized stores
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Triggering synchronization for key: $SynchronizationKey"

                # transfer applicable parameters to synchronization function
                $syncParams = GenXdev.FileSystem\Copy-IdenticalParamValues `
                    -BoundParameters $PSBoundParameters `
                    -FunctionName 'GenXdev.Data\Sync-KeyValueStore' `
                    -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                        -Scope Local `
                        -ErrorAction SilentlyContinue)

                # configure synchronization key for cloud sync operation
                $syncParams.SynchronizationKey = $SynchronizationKey

                # execute synchronization to propagate changes to cloud
                $null = GenXdev.Data\Sync-KeyValueStore @syncParams
            }
        }
    }

    end {
    }
}
