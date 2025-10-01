###############################################################################
<#
.SYNOPSIS
Synchronizes local and OneDrive key-value store JSON files.

.DESCRIPTION
Performs two-way synchronization between local and OneDrive shadow JSON files using
a last-modified timestamp strategy. Records are merged based on their last
modification time, with newer versions taking precedence.

.PARAMETER SynchronizationKey
Identifies the synchronization scope for the operation. Using "Local" will skip
synchronization as it indicates local-only records.

.PARAMETER DatabasePath
Database path for key-value store data files.

.EXAMPLE
Sync-KeyValueStore

.EXAMPLE
Sync-KeyValueStore -SynchronizationKey "UserSettings"
#>
function Sync-KeyValueStore {

    [CmdletBinding()]
    param(
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
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

        # check if custom base path was provided or use default location
        if ([string]::IsNullOrWhiteSpace($DatabasePath)) {

            # construct default base path in local app data folder
            $basePath = "$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\KeyValueStore"
        }
        else {

            # use the provided base path
            $basePath = $DatabasePath
        }

        # construct path to onedrive shadow directory for synchronization
        $shadowPath = GenXdev.FileSystem\Expand-Path `
            "~\OneDrive\GenXdev.PowerShell.SyncObjects\KeyValueStore"

        # log the beginning of sync operation for troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Starting key-value store sync with key: $SynchronizationKey"
    }

    process {

        # skip synchronization for local-only records to avoid unnecessary work
        if ($SynchronizationKey -eq 'Local') {

            # inform user that local-only sync is being skipped
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Skipping sync for local-only key'
            return
        }

        # log store directory paths for debugging and verification purposes
        Microsoft.PowerShell.Utility\Write-Verbose "Local path: $basePath"
        Microsoft.PowerShell.Utility\Write-Verbose "Shadow path: $shadowPath"

        # verify both directories exist before attempting synchronization
        if (-not ([System.IO.Directory]::Exists($basePath) -and
                [System.IO.Directory]::Exists($shadowPath))) {

            # inform user that missing directories are being initialized
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Initializing missing store directories'

            # copy compatible parameters for the initialization function call
            $params = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Initialize-KeyValueStores' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # initialize the key-value store directories if they don't exist
            GenXdev.Data\Initialize-KeyValueStores @params
        }

        # get all JSON files from both directories matching the sync key pattern
        $safeSyncKey = $SynchronizationKey -replace '[\\/:*?"<>|]', '_'
        $filePattern = "${safeSyncKey}_*.json"

        Microsoft.PowerShell.Utility\Write-Verbose `
            "Syncing files matching pattern: $filePattern"

        # collect all matching store files from both locations
        $localFiles = @{}
        $shadowFiles = @{}

        foreach ($file in (Microsoft.PowerShell.Management\Get-ChildItem `
                    -LiteralPath $basePath `
                    -Filter $filePattern `
                    -File `
                    -ErrorAction SilentlyContinue)) {
            $localFiles[$file.Name] = $file.FullName
        }

        foreach ($file in (Microsoft.PowerShell.Management\Get-ChildItem `
                    -LiteralPath $shadowPath `
                    -Filter $filePattern `
                    -File `
                    -ErrorAction SilentlyContinue)) {
            $shadowFiles[$file.Name] = $file.FullName
        }

        # get union of all filenames
        $allFilenames = $localFiles.Keys + $shadowFiles.Keys | `
            Microsoft.PowerShell.Utility\Select-Object -Unique

        # sync each store file
        foreach ($filename in $allFilenames) {
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Syncing store file: $filename"

            $localFilePath = [System.IO.Path]::Combine($basePath, $filename)
            $shadowFilePath = [System.IO.Path]::Combine($shadowPath, $filename)

            # read both store versions
            $localData = GenXdev.FileSystem\ReadJsonWithRetry -FilePath $localFilePath
            $shadowData = GenXdev.FileSystem\ReadJsonWithRetry -FilePath $shadowFilePath

            # merge stores based on last modified timestamps
            $mergedData = @{}

            # add all local keys
            foreach ($key in $localData.Keys) {
                $mergedData[$key] = $localData[$key]
            }

            # merge shadow keys, keeping newer versions
            foreach ($key in $shadowData.Keys) {
                $shadowEntry = $shadowData[$key]

                if ($mergedData.ContainsKey($key)) {
                    $localEntry = $mergedData[$key]

                    # compare timestamps if both have metadata
                    if ($localEntry -is [hashtable] -and
                        $shadowEntry -is [hashtable] -and
                        $localEntry.ContainsKey('lastModified') -and
                        $shadowEntry.ContainsKey('lastModified')) {

                        $localTime = [DateTime]::Parse($localEntry['lastModified'])
                        $shadowTime = [DateTime]::Parse($shadowEntry['lastModified'])

                        # keep newer version
                        if ($shadowTime -gt $localTime) {
                            $mergedData[$key] = $shadowEntry
                        }
                    }
                    else {
                        # no metadata, keep shadow version
                        $mergedData[$key] = $shadowEntry
                    }
                }
                else {
                    # key only exists in shadow, add it
                    $mergedData[$key] = $shadowEntry
                }
            }

            # write merged data to both locations
            GenXdev.FileSystem\WriteJsonAtomic -FilePath $localFilePath -Data $mergedData
            GenXdev.FileSystem\WriteJsonAtomic -FilePath $shadowFilePath -Data $mergedData
        }
    }

    end {

        # log completion of sync operation for audit and troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose 'Sync operation completed'
    }
}
