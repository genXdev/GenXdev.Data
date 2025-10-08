<##############################################################################
Part of PowerShell module : GenXdev.Data.KeyValueStore
Original cmdlet filename  : Get-StoreKeys.ps1
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
<#
.SYNOPSIS
Retrieves all key names for a given key-value store.

.DESCRIPTION
Queries the KeyValueStore JSON file to retrieve all active (non-deleted)
keys for a specified store. Can optionally filter by synchronization scope.
Automatically initializes the directory structure if not found and handles
synchronization for non-local stores.

.PARAMETER StoreName
The name of the key-value store to query. This identifies the logical grouping
of keys and values in the database.

.PARAMETER SynchronizationKey
Optional scope identifier for synchronization. Use "Local" for local-only data.
Defaults to "%" which matches all scopes. Triggers sync for non-local scopes.

.PARAMETER DatabasePath
Directory path for keyvalue database files.

.EXAMPLE
Get-StoreKeys -StoreName "ApplicationSettings" -SynchronizationKey "Local"

.EXAMPLE
getkeys AppSettings
#>
function Get-StoreKeys {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [Alias('getkeys')]

    param (
        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            HelpMessage = 'Name of the store whose keys should be retrieved'
        )]
        [string]$StoreName,
        ###############################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = 'Key to identify synchronization scope, defaults to all'
        )]
        [string]$SynchronizationKey = '%',
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Database path for key-value store data files'
        )]
        [string]$DatabasePath
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

        # output verbose message for store directory path
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Using KeyValueStore directory: $basePath"
        )

        # output verbose message for store initialization
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Initializing Get-StoreKeys for store: $StoreName"
        )
    }

    process {

        # ensure store directory structure exists
        if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $basePath)) {

            # output verbose message for directory initialization
            Microsoft.PowerShell.Utility\Write-Verbose (
                'Store directory not found, initializing...'
            )

            # copy identical parameter values for Initialize-KeyValueStores
            $initParams = GenXdev.FileSystem\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Initialize-KeyValueStores' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # initialize the key-value stores directory
            $null = GenXdev.Data\Initialize-KeyValueStores @initParams
        }

        # synchronize non-local stores with remote if needed
        if ($SynchronizationKey -ne 'Local' -and $SynchronizationKey -ne '%') {

            # output verbose message for synchronization
            Microsoft.PowerShell.Utility\Write-Verbose (
                "Syncing non-local store with key: $SynchronizationKey"
            )

            # copy identical parameter values for Sync-KeyValueStore
            $syncParams = GenXdev.FileSystem\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Sync-KeyValueStore' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # assign specific parameters for synchronization
            $syncParams.SynchronizationKey = $SynchronizationKey

            # synchronize the key-value store for the given key
            $null = GenXdev.Data\Sync-KeyValueStore @syncParams
        }

        # handle wildcard synchronization key - search all matching files
        if ($SynchronizationKey -eq '%') {
            # sanitize store name for file pattern matching
            $safeStoreName = $StoreName -replace '[\\/:*?"<>|]', '_'
            $filePattern = "*_${safeStoreName}.json"

            # output verbose message for wildcard search
            Microsoft.PowerShell.Utility\Write-Verbose (
                "Searching for files matching pattern: $filePattern"
            )

            # collect unique keys from all matching store files
            $allKeys = @{}

            foreach ($file in (Microsoft.PowerShell.Management\Get-ChildItem `
                        -LiteralPath $basePath `
                        -Filter $filePattern `
                        -File `
                        -ErrorAction SilentlyContinue)) {

                # read store data from each matching file
                $storeData = GenXdev.FileSystem\ReadJsonWithRetry -FilePath $file.FullName

                # collect active (non-deleted) key names
                foreach ($keyName in $storeData.Keys) {
                    $entry = $storeData[$keyName]

                    # check if entry has metadata structure
                    if ($entry -is [hashtable] -and $entry.ContainsKey('deletedDate')) {
                        # entry has metadata, check if not deleted
                        if ($null -eq $entry['deletedDate']) {
                            $allKeys[$keyName] = $true
                        }
                    }
                    else {
                        # legacy format without metadata, add key name
                        $allKeys[$keyName] = $true
                    }
                }
            }

            # return unique keys
            $allKeys.Keys | Microsoft.PowerShell.Utility\Sort-Object
        }
        else {
            # specific synchronization key - get single file
            $storeFilePath = GenXdev.Data\GetStoreFilePath `
                -SynchronizationKey $SynchronizationKey `
                -StoreName $StoreName `
                -BasePath $basePath

            # output verbose message for querying keys
            Microsoft.PowerShell.Utility\Write-Verbose (
                "Querying keys from store file: $storeFilePath"
            )

            # read the JSON store data with retry logic
            $storeData = GenXdev.FileSystem\ReadJsonWithRetry -FilePath $storeFilePath

            # return active (non-deleted) key names
            foreach ($keyName in $storeData.Keys) {
                $entry = $storeData[$keyName]

                # check if entry has metadata structure
                if ($entry -is [hashtable] -and $entry.ContainsKey('deletedDate')) {
                    # entry has metadata, check if not deleted
                    if ($null -eq $entry['deletedDate']) {
                        $keyName
                    }
                }
                else {
                    # legacy format without metadata, return key name
                    $keyName
                }
            }
        }
    }

    end {
    }
}
