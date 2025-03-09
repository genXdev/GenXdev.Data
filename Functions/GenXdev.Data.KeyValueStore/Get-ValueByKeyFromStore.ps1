################################################################################
<#
.SYNOPSIS
Retrieves a value from a key-value store database.

.DESCRIPTION
Retrieves a value for a specified key from a SQLite-based key-value store. The
function supports optional default values and synchronization across different
scopes.

.PARAMETER StoreName
The name of the key-value store to query.

.PARAMETER KeyName
The key whose value should be retrieved.

.PARAMETER DefaultValue
Optional default value to return if the key is not found.

.PARAMETER SynchronizationKey
Optional key to identify synchronization scope. Defaults to "Local".

.EXAMPLE
Get-ValueByKeyFromStore -StoreName "AppSettings" -KeyName "Theme" -DefaultValue "Dark"

.EXAMPLE
getvalue AppSettings Theme
#>
function Get-ValueByKeyFromStore {

    [CmdletBinding(DefaultParameterSetName = "Default")]
    [OutputType([System.String])]
    [Alias("getvalue")]

    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = "Default",
            HelpMessage = "Name of the store to retrieve the key from"
        )]
        [string]$StoreName,
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            ParameterSetName = "Default",
            HelpMessage = "Key to retrieve from the specified store"
        )]
        [string]$KeyName,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            ParameterSetName = "Default",
            HelpMessage = "A optional default value"
        )]
        [string]$DefaultValue = $null,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 3,
            ParameterSetName = "Default",
            HelpMessage = "Key to identify synchronization scope"
        )]
        [string]$SynchronizationKey = "Local"
        ########################################################################
    )

    begin {

        # construct the path to the sqlite database file
        $databaseFilePath = GenXdev.FileSystem\Expand-Path `
            "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db" `
            -CreateDirectory

        Write-Verbose "Database path: $databaseFilePath"
    }

    process {

        # initialize database if it doesn't exist
        if (-not (Test-Path $databaseFilePath)) {
            Write-Verbose "Database not found, initializing..."
            Initialize-KeyValueStores
        }

        # sync with external store if not using local scope
        if ($SynchronizationKey -ne "Local") {
            Write-Verbose "Syncing store with key: $SynchronizationKey"
            Sync-KeyValueStore -SynchronizationKey $SynchronizationKey
        }

        # prepare sql query to retrieve value
        $sqlQuery = @"
SELECT value
FROM KeyValueStore
WHERE storeName = @storeName
AND keyName = @keyName
AND synchronizationKey = @syncKey
AND deletedDate IS NULL;
"@

        # set up query parameters
        $params = @{
            'storeName' = $StoreName
            'keyName'   = $KeyName
            'syncKey'   = $SynchronizationKey
        }

        Write-Verbose "Querying store '$StoreName' for key '$KeyName'"

        # execute query and get result
        $result = Invoke-SQLiteQuery `
            -DatabaseFilePath $databaseFilePath `
            -Queries $sqlQuery `
            -SqlParameters $params

        # return result or default value
        if ($result) {
            Write-Verbose "Value found"
            return $result.value
        }
        else {
            Write-Verbose "No value found, returning default"
            return $DefaultValue
        }
    }

    end {
    }
}
################################################################################
