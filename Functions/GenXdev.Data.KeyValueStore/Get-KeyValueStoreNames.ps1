################################################################################
<#
.SYNOPSIS
Gets a list of all store names.
.DESCRIPTION
SELECT DISTINCT ensures only unique store names are returned.
.PARAMETER SynchronizationKey
Optional key to identify synchronization scope, defaults to "Local".
.EXAMPLE
Get-KeyValueStoreNames
.EXAMPLE
allstores
#>
function Get-KeyValueStoreNames {

    [CmdletBinding()]
    [Alias("getstorenames")]

    param(
        [Parameter(
            Mandatory = $false,
            Position = 0,
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

    # Return a list of distinct store names, using LIKE for wildcard matching
    $sqlQuery = @"
SELECT DISTINCT storeName
FROM KeyValueStore
WHERE synchronizationKey LIKE @syncKey
AND deletedDate IS NULL;
"@

    $params = @{
        'syncKey' = $SynchronizationKey
    }

    Invoke-SQLiteQuery -DatabaseFilePath $DatabaseFilePath -Queries $sqlQuery -SqlParameters $params |
    ForEach-Object storeName
}
