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

    [CmdletBinding(SupportsShouldProcess = $true)]
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

        Microsoft.PowerShell.Utility\Write-Verbose "Preparing to remove key '$KeyName' from store '$StoreName'"

        # expand the database path and ensure directory exists
        $databaseFilePath = GenXdev.FileSystem\Expand-Path `
            "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db" `
            -CreateDirectory

        # initialize database if it doesn't exist
        if (-not (Microsoft.PowerShell.Management\Test-Path $databaseFilePath)) {

            Microsoft.PowerShell.Utility\Write-Verbose "Database not found, initializing..."
            GenXdev.Data\Initialize-KeyValueStores
        }

        # get current user info for audit trail
        $lastModifiedBy = "$env:COMPUTERNAME\$env:USERNAME"
    }


process {

        Microsoft.PowerShell.Utility\Write-Verbose "Processing delete operation with sync key: $SynchronizationKey"

        # determine SQL operation based on synchronization key
        if ($SynchronizationKey -eq "Local") {

            $operation = "Permanently delete"
            $sqlQuery = @"
DELETE FROM KeyValueStore
WHERE storeName = @storeName
AND keyName = @keyName
AND synchronizationKey = @syncKey;
"@
        }
        else {

            $operation = "Mark as deleted"
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

        # check if user wants to proceed with deletion
        if ($PSCmdlet.ShouldProcess(
                "Key '$KeyName' in store '$StoreName'",
                $operation)) {

            # prepare query parameters
            $params = @{
                'storeName'  = $StoreName
                'keyName'    = $KeyName
                'syncKey'    = $SynchronizationKey
                'modifiedBy' = $lastModifiedBy
            }

            # execute the database operation
            Microsoft.PowerShell.Utility\Write-Verbose "Executing database operation..."
            GenXdev.Data\Invoke-SQLiteQuery -DatabaseFilePath $databaseFilePath `
                -Queries $sqlQuery `
                -SqlParameters $params

            # trigger synchronization for non-local operations
            if ($SynchronizationKey -ne "Local") {

                Microsoft.PowerShell.Utility\Write-Verbose "Triggering synchronization..."
                GenXdev.Data\Sync-KeyValueStore -SynchronizationKey $SynchronizationKey
            }
        }
    }

    end {
    }
}
################################################################################