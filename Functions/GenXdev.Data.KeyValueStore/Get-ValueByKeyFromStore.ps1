################################################################################
<#
.SYNOPSIS
Retrieves a value by the specified key and store from the database.
.DESCRIPTION
Executes a SELECT statement to fetch the value for a given key in a given store.
.PARAMETER StoreName
Name of the store to retrieve the key from.
.PARAMETER KeyName
Key to retrieve from the specified store.
.PARAMETER SynchronizationKey
Optional key to identify synchronization scope, defaults to "Local".
.EXAMPLE
Get-ValueByKeyFromStore -StoreName "MyStore" -KeyName "MyKey"
.EXAMPLE
getvalue MyStore MyKey
.EXAMPLE
Get-ValueByKeyFromStore -StoreName "MyPreferences" -KeyName "MyKey" -DefaultValue "MyDefaultValue"
#>
function Get-ValueByKeyFromStore {

    [CmdletBinding()]
    [Alias("getvalue")]

    param (
        [Parameter(Mandatory = $true, Position = 0, HelpMessage = "Name of the store to retrieve the key from")]
        [string]$StoreName,
        [Parameter(Mandatory = $true, Position = 1, HelpMessage = "Key to retrieve from the specified store")]
        [string]$KeyName,
        [Parameter(Mandatory = $false, Position = 2, HelpMessage = "A optional default value")]
        [string]$DefaultValue = $null,
        [Parameter(Mandatory = $false, Position = 3, HelpMessage = "Key to identify synchronization scope")]
        [string]$SynchronizationKey = "Local"
    )

    # Path to your SQLite databases
    $databaseFilePath = Expand-Path "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db" -CreateDirectory

    # Not found?
    if (-not (Test-Path $DatabaseFilePath)) {

        Initialize-KeyValueStores
    }

    if ($SynchronizationKey -ne "Local") {

        Sync-KeyValueStore -SynchronizationKey $SynchronizationKey
    }

    # Build and execute the SELECT query
    $sqlQuery = @"
SELECT value
FROM KeyValueStore
WHERE storeName = @storeName
AND keyName = @keyName
AND synchronizationKey = @syncKey
AND deletedDate IS NULL;
"@

    $params = @{
        'storeName' = $StoreName
        'keyName' = $KeyName
        'syncKey' = $SynchronizationKey
    }

    $result = Invoke-SQLiteQuery -DatabaseFilePath $DatabaseFilePath -Queries $sqlQuery -SqlParameters $params

    if ($result) {

        return $result.value
    }
    else {

        return $DefaultValue
    }
}
