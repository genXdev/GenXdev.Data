###############################################################################
<#
.SYNOPSIS
Retrieves a value from a JSON-based key-value store.

.DESCRIPTION
Retrieves a value for a specified key from a JSON file-based key-value store.
The function supports optional default values and synchronization across
different scopes. It can use session-based settings or direct file access and
provides automatic directory initialization and synchronization capabilities.

.PARAMETER StoreName
The name of the key-value store to query.

.PARAMETER KeyName
The key whose value should be retrieved.

.PARAMETER DefaultValue
Optional default value to return if the key is not found.

.PARAMETER SynchronizationKey
Optional key to identify synchronization scope. Defaults to "Local".

.PARAMETER DatabasePath
Database path for key-value store data files.

.EXAMPLE
Get-ValueByKeyFromStore -StoreName "AppSettings" -KeyName "Theme" `
    -DefaultValue "Dark"

.EXAMPLE
getvalue AppSettings Theme
#>
function Get-ValueByKeyFromStore {

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    [OutputType([System.String])]
    [Alias('getvalue')]

    param (
        ###############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = 'Default',
            HelpMessage = 'Name of the store to retrieve the key from'
        )]
        [string]$StoreName,
        ###############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            ParameterSetName = 'Default',
            HelpMessage = 'Key to retrieve from the specified store'
        )]
        [string]$KeyName,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            ParameterSetName = 'Default',
            HelpMessage = 'A optional default value'
        )]
        [string]$DefaultValue = $null,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 3,
            ParameterSetName = 'Default',
            HelpMessage = 'Key to identify synchronization scope'
        )]
        [string]$SynchronizationKey = 'Local',
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Database path for key-value store data files'
        )]
        [string]$DatabasePath
        ###############################################################################
    )

    begin {

        # check if custom base path was provided
        if ([string]::IsNullOrWhiteSpace($DatabasePath)) {

            # use default base path in local app data folder
            $basePath = "$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\KeyValueStore"
        }
        else {

            # use provided base path
            $basePath = $DatabasePath
        }

        # output base directory location for debugging purposes
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using KeyValueStore directory: $basePath"
    }


    process {

        # ensure store directory structure exists
        if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $basePath)) {

            # log directory initialization activity
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Store directory not found, initializing...'

            # copy identical parameter values for initialize function
            $initParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Initialize-KeyValueStores' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # initialize the key-value store directory structure
            GenXdev.Data\Initialize-KeyValueStores @initParams
        }

        # synchronize with external store when not using local scope
        if ($SynchronizationKey -ne 'Local') {

            # log synchronization activity
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Syncing store with key: $SynchronizationKey"

            # copy identical parameter values for sync function
            $syncParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Sync-KeyValueStore' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # assign synchronization key for external store sync
            $syncParams.SynchronizationKey = $SynchronizationKey

            # execute synchronization to align with external store
            GenXdev.Data\Sync-KeyValueStore @syncParams
        }

        # get JSON file path for this store
        $storeFilePath = GenXdev.Data\GetStoreFilePath `
            -SynchronizationKey $SynchronizationKey `
            -StoreName $StoreName `
            -BasePath $basePath

        # log the query operation details
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Querying store '$StoreName' for key '$KeyName' at: $storeFilePath"

        # read the JSON store data with retry logic
        $storeData = GenXdev.FileSystem\ReadJsonWithRetry -FilePath $storeFilePath

        # check if key exists and is not deleted
        if ($storeData.ContainsKey($KeyName)) {
            $entry = $storeData[$KeyName]

            # check if entry has metadata structure
            if ($entry -is [hashtable] -and $entry.ContainsKey('deletedDate')) {
                # entry has metadata, check if deleted
                if ($null -eq $entry['deletedDate']) {
                    # log successful value retrieval
                    Microsoft.PowerShell.Utility\Write-Verbose 'Value found'

                    # return the value from the entry
                    return $entry['value']
                }
            }
            else {
                # legacy format without metadata, return directly
                Microsoft.PowerShell.Utility\Write-Verbose `
                    'Value found (legacy format)'

                return $entry
            }
        }

        # log fallback to default value
        Microsoft.PowerShell.Utility\Write-Verbose `
            'No value found, returning default'

        # return the specified default value
        return $DefaultValue
    }    end {
    }
}
