################################################################################
<#
.SYNOPSIS
Retrieves all key names for a given store.
.DESCRIPTION
Runs a SELECT on the KeyValueStore table filtered by storeName.
.PARAMETER StoreName
Name of the store whose keys should be retrieved.
.PARAMETER SynchronizationKey
Optional key to identify synchronization scope, defaults to "Local".
.EXAMPLE
Get-StoreKeys -StoreName "MyStore"
.EXAMPLE
storekeys MyStore
#>
function Get-StoreKeys {

    [CmdletBinding()]
    [Alias("getkeys")]

    param (
        [Parameter(Mandatory = $true, Position = 0, HelpMessage = "Name of the store whose keys should be retrieved")]
        [string]$StoreName,
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = "Key to identify synchronization scope, defaults to all"
        )]
        [string]$SynchronizationKey = "%"
    )

    # Path to your SQLite database
    $DatabaseFilePath = Expand-Path "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db" -CreateDirectory

    # Not found?
    if (-not (Test-Path $DatabaseFilePath)) {

        Initialize-KeyValueStores
    }

    # sync if not local
    if ($SynchronizationKey -ne "Local") {

        Sync-KeyValueStore -SynchronizationKey $SynchronizationKey
    }

    # Grab all key names for the specified store, excluding deleted records
    $sqlQuery = @"
SELECT keyName
FROM KeyValueStore
WHERE storeName = @storeName
AND synchronizationKey LIKE @syncKey
AND deletedDate IS NULL;
"@

    $params = @{
        'storeName' = $StoreName
        'syncKey' = $SynchronizationKey
    }

    Invoke-SQLiteQuery -DatabaseFilePath $DatabaseFilePath -Queries $sqlQuery -SqlParameters $params |
    ForEach-Object keyName
}
