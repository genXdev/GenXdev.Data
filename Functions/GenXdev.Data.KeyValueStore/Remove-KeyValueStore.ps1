################################################################################
<#
.SYNOPSIS
Removes a key-value store from the database.

.DESCRIPTION
Removes all entries for a specified store from the database. For local stores,
performs a physical delete. For synchronized stores, marks entries as deleted and
triggers synchronization.

.PARAMETER StoreName
The name of the key-value store to remove.

.PARAMETER SynchronizationKey
The synchronization scope identifier. Defaults to "Local" for non-synchronized
stores.

.EXAMPLE
Remove-KeyValueStore -StoreName "ConfigurationStore" -SynchronizationKey "Cloud"
#>
function Remove-KeyValueStore {

    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "Name of the store to delete"
        )]
        [string]$StoreName,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = "Key to identify synchronization scope"
        )]
        [string]$SynchronizationKey = "Local"
        ########################################################################
    )

    begin {

        # get the full path to the sqlite database file
        $databaseFilePath = GenXdev.FileSystem\Expand-Path `
            "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db" `
            -CreateDirectory

        Write-Verbose "Using database at: $databaseFilePath"
    }

    process {

        # ensure database exists, create if not
        if (-not (Test-Path $databaseFilePath)) {

            Write-Verbose "Database not found, initializing new database"
            Initialize-KeyValueStores
        }

        # get current user identity for audit trail
        $lastModifiedBy = "$env:COMPUTERNAME\$env:USERNAME"
        Write-Verbose "Operation performed by: $lastModifiedBy"

        # determine sql operation based on synchronization mode
        if ($SynchronizationKey -eq "Local") {

            $operation = "Deleting local store"
            $sqlQuery = @"
DELETE FROM KeyValueStore
WHERE storeName = @storeName
AND synchronizationKey = @syncKey;
"@
        }
        else {

            $operation = "Marking sync store as deleted"
            $sqlQuery = @"
UPDATE KeyValueStore
SET deletedDate = CURRENT_TIMESTAMP,
    lastModified = CURRENT_TIMESTAMP,
    lastModifiedBy = @modifiedBy
WHERE storeName = @storeName
AND synchronizationKey = @syncKey;
"@
        }

        # check if user wants to proceed with the operation
        if ($PSCmdlet.ShouldProcess($StoreName, $operation)) {

            # prepare parameters for sql query
            $params = @{
                'storeName'  = $StoreName
                'syncKey'    = $SynchronizationKey
                'modifiedBy' = $lastModifiedBy
            }

            # execute the database operation
            Write-Verbose "Executing database operation for store: $StoreName"
            Invoke-SQLiteQuery `
                -DatabaseFilePath $databaseFilePath `
                -Queries $sqlQuery `
                -SqlParameters $params

            # trigger synchronization for non-local stores
            if ($SynchronizationKey -ne "Local") {

                Write-Verbose "Triggering synchronization for key: $SynchronizationKey"
                Sync-KeyValueStore -SynchronizationKey $SynchronizationKey
            }
        }
    }

    end {
    }
}
################################################################################