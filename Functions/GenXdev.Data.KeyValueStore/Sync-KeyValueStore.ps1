################################################################################
<#
.SYNOPSIS
Synchronizes local and OneDrive shadow databases.

.DESCRIPTION
Performs two-way sync between local and shadow databases, with last-modified
winning strategy.

.PARAMETER SynchronizationKey
Optional key to identify sync scope, defaults to "Local".

.EXAMPLE
Sync-KeyValueStore
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

    # skip sync for local-only records
    if ($SynchronizationKey -eq "Local") {

        return
    }

    # get database paths
    $localDb = Expand-Path "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db"
    $shadowDb = Expand-Path "~\OneDrive\GenXdev.PowerShell.SyncObjects\KeyValueStores.sqllite.db"

    # ensure both databases exist
    if (-not ([System.IO.File]::Exists($localDb) -and [System.IO.File]::Exists($shadowDb))) {

        Initialize-KeyValueStores
    }

    # sync query to merge changes based on last modified timestamp
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

    $params = @{
        'shadowDb' = $shadowDb
        'syncKey' = $SynchronizationKey
    }

    Invoke-SqlLiteQuery -DatabaseFilePath $localDb -Queries $syncQuery -SqlParameters $params
}
