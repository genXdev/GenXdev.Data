<##############################################################################
Part of PowerShell module : GenXdev.Data.KeyValueStore
Original cmdlet filename  : Remove-KeyFromStore.ps1
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
###############################################################################
function Remove-KeyFromStore {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('removekey')]

    param (
        ###############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'Name of the store'
        )]
        [string] $StoreName,
        ###############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = 'Key to be deleted'
        )]
        [string] $KeyName,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = 'Key to identify synchronization scope'
        )]
        [string] $SynchronizationKey = 'Local',
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Database path for key-value store data files'
        )]
        [string] $DatabasePath
        ###############################################################################
    )

    begin {

        # use provided base path or default to local app data
        if ([string]::IsNullOrWhiteSpace($DatabasePath)) {

            $basePath = "$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\KeyValueStore"
        }
        else {

            $basePath = $DatabasePath
        }

        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using KeyValueStore directory: $basePath"

        Microsoft.PowerShell.Utility\Write-Verbose `
            "Preparing to remove key '$KeyName' from store '$StoreName'"

        # ensure store directory structure exists
        if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $basePath)) {

            Microsoft.PowerShell.Utility\Write-Verbose `
                'Store directory not found, initializing...'

            # copy identical parameter values for Initialize-KeyValueStores
            $initParams = GenXdev.FileSystem\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Initialize-KeyValueStores' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            $null = GenXdev.Data\Initialize-KeyValueStores @initParams
        }

        # get current user info for audit trail
        $lastModifiedBy = "$env:COMPUTERNAME\$env:USERNAME"
    }


    process {

        Microsoft.PowerShell.Utility\Write-Verbose `
            "Processing delete operation with sync key: $SynchronizationKey"

        # determine operation type based on synchronization key
        if ($SynchronizationKey -eq 'Local') {
            $operation = 'Permanently delete'
        }
        else {
            $operation = 'Mark as deleted'
        }

        # check if user wants to proceed with deletion
        if ($PSCmdlet.ShouldProcess(
                "Key '$KeyName' in store '$StoreName'",
                $operation)) {

            # get JSON file path for this store
            $storeFilePath = GenXdev.Data\GetStoreFilePath `
                -SynchronizationKey $SynchronizationKey `
                -StoreName $StoreName `
                -BasePath $basePath

            # read existing store data with retry logic
            $storeData = GenXdev.FileSystem\ReadJsonWithRetry -FilePath $storeFilePath

            # check if key exists
            if ($storeData.ContainsKey($KeyName)) {

                if ($SynchronizationKey -eq 'Local') {
                    # permanent deletion for local stores
                    Microsoft.PowerShell.Utility\Write-Verbose `
                        'Permanently removing key from local store'

                    $storeData.Remove($KeyName)
                }
                else {
                    # mark as deleted for synchronized stores
                    Microsoft.PowerShell.Utility\Write-Verbose `
                        'Marking key as deleted in synchronized store'

                    if ($storeData[$KeyName] -is [hashtable]) {
                        $storeData[$KeyName]['deletedDate'] = (Microsoft.PowerShell.Utility\Get-Date).ToString('o')
                        $storeData[$KeyName]['lastModified'] = (Microsoft.PowerShell.Utility\Get-Date).ToString('o')
                        $storeData[$KeyName]['lastModifiedBy'] = $lastModifiedBy
                    }
                    else {
                        # legacy format, convert to new format with deletion
                        $storeData[$KeyName] = @{
                            value          = $storeData[$KeyName]
                            lastModified   = (Microsoft.PowerShell.Utility\Get-Date).ToString('o')
                            lastModifiedBy = $lastModifiedBy
                            deletedDate    = (Microsoft.PowerShell.Utility\Get-Date).ToString('o')
                        }
                    }
                }

                # write updated store data atomically with retry logic
                GenXdev.FileSystem\WriteJsonAtomic -FilePath $storeFilePath -Data $storeData

                # trigger synchronization for non-local operations
                if ($SynchronizationKey -ne 'Local') {

                    Microsoft.PowerShell.Utility\Write-Verbose `
                        'Triggering synchronization...'

                    # copy identical parameter values for Sync-KeyValueStore
                    $syncParams = GenXdev.FileSystem\Copy-IdenticalParamValues `
                        -BoundParameters $PSBoundParameters `
                        -FunctionName 'GenXdev.Data\Sync-KeyValueStore' `
                        -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                            -Scope Local `
                            -ErrorAction SilentlyContinue)

                    # assign specific parameters for synchronization
                    $syncParams.SynchronizationKey = $SynchronizationKey

                    # trigger the synchronization process
                    $null = GenXdev.Data\Sync-KeyValueStore @syncParams
                }
            }
            else {
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Key '$KeyName' not found in store '$StoreName'"
            }
        }
    }

    end {
    }
}
