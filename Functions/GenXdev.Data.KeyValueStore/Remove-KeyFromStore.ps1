################################################################################
<#
.SYNOPSIS
Deletes a key from the specified store.
.DESCRIPTION
Executes a DELETE statement targeting the given store and key.
.PARAMETER StoreName
Name of the store.
.PARAMETER KeyName
Key to be deleted.
.PARAMETER SynchronizationKey
Optional key to identify synchronization scope, defaults to "Local".
.EXAMPLE
Remove-KeyFromStore -StoreName "MyStore" -KeyName "MyKey"
.EXAMPLE
removekey MyStore MyKey
#>
function Remove-KeyFromStore {

    [CmdletBinding()]
    [Alias("removekey")]

    param (
        [Parameter(Mandatory = $true, Position = 0, HelpMessage = "Name of the store")]
        [string]$StoreName,
        [Parameter(Mandatory = $true, Position = 1, HelpMessage = "Key to be deleted")]
        [string]$KeyName,
        [Parameter(Mandatory = $false, Position = 2, HelpMessage = "Key to identify synchronization scope")]
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
AND keyName = @keyName
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
AND keyName = @keyName
AND synchronizationKey = @syncKey;
"@
    }

    $params = @{
        'storeName' = $StoreName
        'keyName' = $KeyName
        'syncKey' = $SynchronizationKey
        'modifiedBy' = $lastModifiedBy
    }

    Invoke-SqlLiteQuery -DatabaseFilePath $DatabaseFilePath -Queries $sqlQuery -SqlParameters $params

    # sync if not local
    if ($SynchronizationKey -ne "Local") {

        Sync-KeyValueStore -SynchronizationKey $SynchronizationKey
    }
}
