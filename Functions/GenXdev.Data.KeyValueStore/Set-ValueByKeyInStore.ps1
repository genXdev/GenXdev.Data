################################################################################
<#
.SYNOPSIS
Manages key-value pairs in a SQLite database store.

.DESCRIPTION
Provides persistent storage for key-value pairs using SQLite. Handles both
insertion of new entries and updates to existing ones. Supports optional
synchronization for non-local stores.

.PARAMETER StoreName
The name of the store where the key-value pair will be saved.

.PARAMETER KeyName
The unique identifier for the value within the specified store.

.PARAMETER Value
The data to be stored, associated with the specified key.

.PARAMETER SynchronizationKey
Identifies the synchronization scope. Use "Local" for local-only storage.
Defaults to "Local". Non-local values trigger store synchronization.

.EXAMPLE
Set-ValueByKeyInStore -StoreName "ConfigStore" -KeyName "ApiEndpoint" `
    -Value "https://api.example.com"

.EXAMPLE
setvalue ConfigStore ApiEndpoint "https://api.example.com"
#>
function Set-ValueByKeyInStore {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("setvalue")]

    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "Store name for the key-value pair"
        )]
        [string]$StoreName,
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = "Name of the key to set or update"
        )]
        [string]$KeyName,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = "Value to be stored"
        )]
        [string]$Value,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 3,
            HelpMessage = "Key to identify synchronization scope"
        )]
        [string]$SynchronizationKey = "Local"
        ########################################################################
    )

    begin {

        # construct path to sqlite database file
        $databaseFilePath = GenXdev.FileSystem\Expand-Path `
            "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db" `
            -CreateDirectory

        Microsoft.PowerShell.Utility\Write-Verbose "Using database at: $databaseFilePath"
    }

    process {

        # ensure database exists
        if (-not (Microsoft.PowerShell.Management\Test-Path $databaseFilePath)) {

            Microsoft.PowerShell.Utility\Write-Verbose "Database not found. Initializing..."
            GenXdev.Data\Initialize-KeyValueStores
        }

        # get current user identity for audit trail
        $lastModifiedBy = "$env:COMPUTERNAME\$env:USERNAME"
        Microsoft.PowerShell.Utility\Write-Verbose "Setting value as user: $lastModifiedBy"

        # prepare sql query for upsert operation
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

        # prepare parameters for sql query
        $params = @{
            'syncKey'    = $SynchronizationKey
            'storeName'  = $StoreName
            'keyName'    = $KeyName
            'value'      = $Value
            'modifiedBy' = $lastModifiedBy
        }

        # only proceed if user confirms or -WhatIf is not used
        if ($PSCmdlet.ShouldProcess(
                "Store: $StoreName, Key: $KeyName",
                "Set value to: $Value")) {

            Microsoft.PowerShell.Utility\Write-Verbose "Executing upsert for key '$KeyName' in store '$StoreName'"
            GenXdev.Data\Invoke-SQLiteQuery -DatabaseFilePath $databaseFilePath `
                -Queries $sqlQuery `
                -SqlParameters $params

            # handle synchronization for non-local stores
            if ($SynchronizationKey -ne "Local") {

                Microsoft.PowerShell.Utility\Write-Verbose "Synchronizing non-local store: $SynchronizationKey"
                GenXdev.Data\Sync-KeyValueStore -SynchronizationKey $SynchronizationKey
            }
        }
    }

    end {
    }
}
################################################################################