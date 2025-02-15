################################################################################
<#
.SYNOPSIS
Retrieves a list of all available key-value store names from the database.

.DESCRIPTION
Queries the SQLite database to get unique store names based on the provided
synchronization key. The function handles database initialization if needed and
performs synchronization for non-local scopes.

.PARAMETER SynchronizationKey
Filters stores by synchronization scope. Use '%' for all stores, 'Local' for
local stores only. Synchronization occurs for non-local scopes.

.EXAMPLE
Get-KeyValueStoreNames -SynchronizationKey "Local"

.EXAMPLE
getstorenames "%"
#>
function Get-KeyValueStoreNames {

    [CmdletBinding()]
    [Alias("getstorenames")]

    param(
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = "Key to identify synchronization scope, defaults to all"
        )]
        [string]$SynchronizationKey = "%"
        ########################################################################
    )

    begin {

        # construct the path to the sqlite database file
        $databaseFilePath = Expand-Path `
            "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db" `
            -CreateDirectory

        Write-Verbose "Using database: $databaseFilePath"
    }

    process {

        # initialize database if it doesn't exist
        if (-not (Test-Path $databaseFilePath)) {

            Write-Verbose "Database not found, initializing..."
            Initialize-KeyValueStores
        }

        # perform synchronization for non-local scopes
        if ($SynchronizationKey -ne "Local") {

            Write-Verbose "Synchronizing non-local store: $SynchronizationKey"
            Sync-KeyValueStore -SynchronizationKey $SynchronizationKey
        }

        # prepare sql query to get distinct store names
        $sqlQuery = @"
SELECT DISTINCT storeName
FROM KeyValueStore
WHERE synchronizationKey LIKE @syncKey
AND deletedDate IS NULL;
"@

        # set up query parameters
        $params = @{
            'syncKey' = $SynchronizationKey
        }

        Write-Verbose "Querying stores with sync key: $SynchronizationKey"

        # execute query and return store names
        Invoke-SQLiteQuery -DatabaseFilePath $databaseFilePath `
            -Queries $sqlQuery `
            -SqlParameters $params |
        ForEach-Object storeName
    }

    end {
    }
}
################################################################################
