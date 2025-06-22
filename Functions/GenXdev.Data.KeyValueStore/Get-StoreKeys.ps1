################################################################################
<#
.SYNOPSIS
Retrieves all key names for a given key-value store.

.DESCRIPTION
Queries the KeyValueStore SQLite database to retrieve all active (non-deleted)
keys for a specified store. Can optionally filter by synchronization scope.
Automatically initializes the database if not found and handles synchronization
for non-local stores.

.PARAMETER StoreName
The name of the key-value store to query. This identifies the logical grouping
of keys and values in the database.

.PARAMETER SynchronizationKey
Optional scope identifier for synchronization. Use "Local" for local-only data.
Defaults to "%" which matches all scopes. Triggers sync for non-local scopes.

.EXAMPLE
Get-StoreKeys -StoreName "ApplicationSettings" -SynchronizationKey "Local"

.EXAMPLE
getkeys AppSettings
#>
function Get-StoreKeys {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    [Alias("getkeys")]

    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "Name of the store whose keys should be retrieved"
        )]
        [string]$StoreName,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = "Key to identify synchronization scope, defaults to all"
        )]
        [string]$SynchronizationKey = "%"
        ########################################################################
    )

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Initializing Get-StoreKeys for store: $StoreName"

        # resolve the full path to the sqlite database file
        $databaseFilePath = GenXdev.FileSystem\Expand-Path "$($Env:APPDATA)\GenXdev\KeyValueStores.sqllite.db" `
            -CreateDirectory

        Microsoft.PowerShell.Utility\Write-Verbose "Using database at: $databaseFilePath"
    }


process {

        # ensure database exists by initializing if not found
        if (-not (Microsoft.PowerShell.Management\Test-Path $databaseFilePath)) {

            Microsoft.PowerShell.Utility\Write-Verbose "Database not found, initializing..."
            GenXdev.Data\Initialize-KeyValueStores
        }

        # synchronize non-local stores with remote
        if ($SynchronizationKey -ne "Local") {

            Microsoft.PowerShell.Utility\Write-Verbose "Syncing non-local store with key: $SynchronizationKey"
            GenXdev.Data\Sync-KeyValueStore -SynchronizationKey $SynchronizationKey
        }

        # query to get all active keys for the store
        $sqlQuery = @"
SELECT keyName
FROM KeyValueStore
WHERE storeName = @storeName
AND synchronizationKey LIKE @syncKey
AND deletedDate IS NULL;
"@

        # parameters for the sql query
        $params = @{
            'storeName' = $StoreName
            'syncKey'   = $SynchronizationKey
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Querying keys from store: $StoreName"

        # execute query and return key names
        GenXdev.Data\Invoke-SQLiteQuery `
            -DatabaseFilePath $databaseFilePath `
            -Queries $sqlQuery `
            -SqlParameters $params |
        Microsoft.PowerShell.Core\ForEach-Object keyName
    }

    end {
    }
}
################################################################################