################################################################################
<#
.SYNOPSIS
Inserts or updates a key-value pair in the database.
.DESCRIPTION
Uses an INSERT with ON CONFLICT to set or overwrite the value.
.PARAMETER StoreName
Store name for the key-value pair.
.PARAMETER KeyName
Name of the key to set or update.
.PARAMETER Value
Value to be stored.
.PARAMETER SynchronizationKey
Optional key to identify synchronization scope, defaults to "Local".
.EXAMPLE
Set-ValueByKeyInStore -StoreName "MyStore" -KeyName "MyKey" -Value "SomeValue"
.EXAMPLE
setvalue MyStore MyKey SomeValue
#>
function Set-ValueByKeyInStore {

    [CmdletBinding()]
    [Alias("setvalue")]

    param (
        [Parameter(Mandatory = $true, Position = 0, HelpMessage = "Store name for the key-value pair")]
        [string]$StoreName,
        [Parameter(Mandatory = $true, Position = 1, HelpMessage = "Name of the key to set or update")]
        [string]$KeyName,
        [Parameter(Mandatory = $false, Position = 2, HelpMessage = "Value to be stored")]
        [string]$Value,
        [Parameter(Mandatory = $false, Position = 3, HelpMessage = "Key to identify synchronization scope")]
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

    # Insert or update the key-value pair
    $sqlQuery = @"
INSERT INTO KeyValueStore (
    synchronizationKey,
    storeName,
    keyName,
    value,
    lastModified,
    lastModifiedBy,
    deletedDate
)
VALUES (
    @syncKey,
    @storeName,
    @keyName,
    @value,
    CURRENT_TIMESTAMP,
    @modifiedBy,
    NULL
)
ON CONFLICT(synchronizationKey, storeName, keyName)
DO UPDATE SET
    value = excluded.value,
    lastModified = CURRENT_TIMESTAMP,
    lastModifiedBy = excluded.lastModifiedBy,
    deletedDate = NULL;
"@

    $params = @{
        'syncKey' = $SynchronizationKey
        'storeName' = $StoreName
        'keyName' = $KeyName
        'value' = $Value
        'modifiedBy' = $lastModifiedBy
    }

    Invoke-SqlLiteQuery -DatabaseFilePath $DatabaseFilePath -Queries $sqlQuery -SqlParameters $params

    # sync if not local
    if ($SynchronizationKey -ne "Local") {

        Sync-KeyValueStore -SynchronizationKey $SynchronizationKey
    }
}
