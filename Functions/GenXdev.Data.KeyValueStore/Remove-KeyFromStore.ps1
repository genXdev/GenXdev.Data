################################################################################
<#
.SYNOPSIS
Deletes a key from the specified key-value store.

.DESCRIPTION
Removes a key-value pair from the SQLite database store. For local stores,
performs a hard delete. For synchronized stores, marks the record as deleted and
triggers synchronization.

.PARAMETER StoreName
The name of the key-value store to delete from.

.PARAMETER KeyName
The key to be deleted from the store.

.PARAMETER SynchronizationKey
Optional synchronization scope identifier. Defaults to "Local". When not "Local",
triggers synchronization after marking record as deleted.

.EXAMPLE
Remove-KeyFromStore -StoreName "ConfigStore" -KeyName "ApiKey"

.EXAMPLE
removekey ConfigStore ApiKey
#>
function Remove-KeyFromStore {

    [CmdletBinding()]
    [Alias("removekey")]

    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "Name of the store"
        )]
        [string]$StoreName,
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = "Key to be deleted"
        )]
        [string]$KeyName,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = "Key to identify synchronization scope"
        )]
        [string]$SynchronizationKey = "Local"
        ########################################################################
    )

    begin {

        Write-Verbose "Preparing to remove key '$KeyName' from store '$StoreName'"

        # expand the database path and ensure directory exists
        $databaseFilePath = Expand-Path `
            "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db" `
            -CreateDirectory

        # initialize database if it doesn't exist
        if (-not (Test-Path $databaseFilePath)) {

            Write-Verbose "Database not found, initializing..."
            Initialize-KeyValueStores
        }

        # get current user info for audit trail
        $lastModifiedBy = "$env:COMPUTERNAME\$env:USERNAME"
    }

    process {

        Write-Verbose "Processing delete operation with sync key: $SynchronizationKey"

        # determine SQL operation based on synchronization key
        if ($SynchronizationKey -eq "Local") {

            # for local records, perform hard delete
            $sqlQuery = @"
DELETE FROM KeyValueStore
WHERE storeName = @storeName
AND keyName = @keyName
AND synchronizationKey = @syncKey;
"@
        }
        else {

            # for sync records, soft delete by setting deletion flags
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

        # prepare query parameters
        $params = @{
            'storeName'  = $StoreName
            'keyName'    = $KeyName
            'syncKey'    = $SynchronizationKey
            'modifiedBy' = $lastModifiedBy
        }

        # execute the database operation
        Write-Verbose "Executing database operation..."
        Invoke-SQLiteQuery -DatabaseFilePath $databaseFilePath `
            -Queries $sqlQuery `
            -SqlParameters $params

        # trigger synchronization for non-local operations
        if ($SynchronizationKey -ne "Local") {

            Write-Verbose "Triggering synchronization..."
            Sync-KeyValueStore -SynchronizationKey $SynchronizationKey
        }
    }

    end {
    }
}
################################################################################
