################################################################################
<#
.SYNOPSIS
Removes an entire store from the database.
.DESCRIPTION
Executes a DELETE statement to remove all entries for the given store.
.PARAMETER StoreName
Name of the store to delete.
.PARAMETER SynchronizationKey
Optional key to identify synchronization scope, defaults to "Local".
.EXAMPLE
Remove-KeyValueStore -StoreName "YourStoreName"
.EXAMPLE
Remove-KeyValueStore YourStoreName
#>
function Remove-KeyValueStore {

    [CmdletBinding()]

    param (
        [Parameter(Mandatory = $true, Position = 0, HelpMessage = "Name of the store to delete")]
        [string]$StoreName,
        [Parameter(Mandatory = $false, Position = 1, HelpMessage = "Key to identify synchronization scope")]
        [string]$SynchronizationKey = "Local"
    )

    # Path to your SQLite database
    $DatabaseFilePath = Expand-Path "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db" -CreateDirectory

    # Not found?
    if (-not (Test-Path $DatabaseFilePath)) {

        Initialize-KeyValueStores
    }

    # get current user info for lastModifiedBy
    $lastModifiedBy = "$env:COMPUTERNAME\$env:USERNAME"

    # for Local records, perform actual delete
    if ($SynchronizationKey -eq "Local") {

        $sqlQuery = @"
DELETE FROM KeyValueStore
WHERE storeName = @storeName
AND synchronizationKey = @syncKey;
"@
    }
    else {
        # for sync records, set deletedDate and lastModifiedBy
        $sqlQuery = @"
UPDATE KeyValueStore
SET deletedDate = CURRENT_TIMESTAMP,
    lastModified = CURRENT_TIMESTAMP,
    lastModifiedBy = @modifiedBy
WHERE storeName = @storeName
AND synchronizationKey = @syncKey;
"@
    }

    $params = @{
        'storeName' = $StoreName
        'syncKey' = $SynchronizationKey
        'modifiedBy' = $lastModifiedBy
    }

    Invoke-SqlLiteQuery -DatabaseFilePath $DatabaseFilePath -Queries $sqlQuery -SqlParameters $params

    # sync if not local
    if ($SynchronizationKey -ne "Local") {

        Sync-KeyValueStore -SynchronizationKey $SynchronizationKey
    }
}
