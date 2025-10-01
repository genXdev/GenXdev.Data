###############################################################################
function Get-KeyValueStoreNames {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [Alias('getstorenames')]

    param(
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = 'Key to identify synchronization scope, defaults to all'
        )]
        [string] $SynchronizationKey = '%',
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

        # output verbose message for store directory path
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Using KeyValueStore directory: $basePath"
        )
    }

    process {

        # ensure store directory structure exists
        if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $basePath)) {

            # output verbose information about directory initialization
            Microsoft.PowerShell.Utility\Write-Verbose (
                'Store directory not found, initializing...'
            )

            # copy identical parameter values for Initialize-KeyValueStores
            $initParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Initialize-KeyValueStores' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # initialize the key value stores directory
            GenXdev.Data\Initialize-KeyValueStores @initParams
        }

        # perform synchronization for non-local stores
        if ($SynchronizationKey -ne 'Local' -and $SynchronizationKey -ne '%') {

            # output verbose information about synchronization
            Microsoft.PowerShell.Utility\Write-Verbose (
                "Synchronizing non-local store: $SynchronizationKey"
            )

            # copy identical parameter values for Sync-KeyValueStore
            $syncParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Sync-KeyValueStore' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # assign specific parameters for synchronization
            $syncParams.SynchronizationKey = $SynchronizationKey

            # synchronize the key value store with remote sources
            GenXdev.Data\Sync-KeyValueStore @syncParams
        }

        # output verbose information about the scan operation
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Scanning for stores with sync key pattern: $SynchronizationKey"
        )

        # get all JSON files in the store directory
        $jsonFiles = Microsoft.PowerShell.Management\Get-ChildItem `
            -LiteralPath $basePath `
            -Filter '*.json' `
            -File `
            -ErrorAction SilentlyContinue

        # create hashtable to collect unique store names
        $storeNames = @{}

        # parse filenames to extract store names
        foreach ($file in $jsonFiles) {
            # filename format: SyncKey_StoreName.json
            if ($file.Name -match '^(.+?)_(.+?)\.json$') {
                $fileSyncKey = $matches[1]
                $fileStoreName = $matches[2]

                # check if synchronization key matches pattern
                if ($SynchronizationKey -eq '%' -or
                    $fileSyncKey -like $SynchronizationKey) {

                    # add to unique store names collection
                    if (-not $storeNames.ContainsKey($fileStoreName)) {
                        $storeNames[$fileStoreName] = $true
                    }
                }
            }
        }

        # return sorted unique store names
        $storeNames.Keys | Microsoft.PowerShell.Utility\Sort-Object
    }

    end {
    }
}
