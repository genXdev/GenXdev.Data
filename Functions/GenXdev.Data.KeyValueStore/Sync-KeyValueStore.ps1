################################################################################
<#
.SYNOPSIS
Synchronizes local and OneDrive key-value store databases.

.DESCRIPTION
Performs two-way synchronization between local and OneDrive shadow databases using
a last-modified timestamp strategy. Records are merged based on their last
modification time, with newer versions taking precedence.

.PARAMETER SynchronizationKey
Identifies the synchronization scope for the operation. Using "Local" will skip
synchronization as it indicates local-only records.

.EXAMPLE
# Synchronize using default local scope
Sync-KeyValueStore

.EXAMPLE
# Synchronize specific scope
Sync-KeyValueStore -SynchronizationKey "UserSettings"
#>
function Sync-KeyValueStore {

    [CmdletBinding()]
    param(
        #######################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = "Key to identify synchronization scope"
        )]
        [string]$SynchronizationKey = "Local"
        #######################################################################
    )

    begin {

        Write-Verbose "Starting key-value store sync with key: $SynchronizationKey"
    }

    process {

        # skip synchronization for local-only records
        if ($SynchronizationKey -eq "Local") {

            Write-Verbose "Skipping sync for local-only key"
            return
        }

        # resolve database file paths for local and shadow copies
        $localDb = Expand-Path "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db"
        $shadowDb = Expand-Path "~\OneDrive\GenXdev.PowerShell.SyncObjects\KeyValueStores.sqllite.db"

        Write-Verbose "Local DB: $localDb"
        Write-Verbose "Shadow DB: $shadowDb"

        # ensure database files exist by initializing if needed
        if (-not ([System.IO.File]::Exists($localDb) -and
                [System.IO.File]::Exists($shadowDb))) {

            Write-Verbose "Initializing missing database files"
            Initialize-KeyValueStores
        }

        # sql query to perform bidirectional sync based on last modified timestamp
        $syncQuery = @"
ATTACH DATABASE @shadowDb AS shadow;

-- sync from shadow to local
INSERT OR REPLACE INTO main.KeyValueStore
SELECT * FROM shadow.KeyValueStore s
WHERE s.synchronizationKey = @syncKey
AND (
    NOT EXISTS (
        SELECT 1 FROM main.KeyValueStore m
        WHERE m.synchronizationKey = s.synchronizationKey
        AND m.storeName = s.storeName
        AND m.keyName = s.keyName
        AND m.lastModified >= s.lastModified
    )
);

-- sync from local to shadow
INSERT OR REPLACE INTO shadow.KeyValueStore
SELECT * FROM main.KeyValueStore m
WHERE m.synchronizationKey = @syncKey
AND (
    NOT EXISTS (
        SELECT 1 FROM shadow.KeyValueStore s
        WHERE s.synchronizationKey = m.synchronizationKey
        AND s.storeName = m.storeName
        AND s.keyName = m.keyName
        AND s.lastModified > m.lastModified
    )
);
"@

        # prepare parameters for sql query execution
        $params = @{
            'shadowDb' = $shadowDb
            'syncKey'  = $SynchronizationKey
        }

        Write-Verbose "Executing sync query with parameters"
        Invoke-SQLiteQuery -DatabaseFilePath $localDb -Queries $syncQuery -SqlParameters $params
    }

    end {

        Write-Verbose "Sync operation completed"
    }
}
################################################################################
