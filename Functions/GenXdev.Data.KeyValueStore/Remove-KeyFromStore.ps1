###############################################################################
<#
.SYNOPSIS
Deletes a key from the specified key-value store.

.DESCRIPTION
Removes a key-value pair from the SQLite database store. For local stores,
performs a hard delete removing the record permanently. For synchronized stores,
marks the record as deleted with a timestamp and triggers synchronization to
propagate the deletion across all synchronized instances.

.PARAMETER StoreName
The name of the key-value store to delete from.

.PARAMETER KeyName
The key to be deleted from the store.

.PARAMETER SynchronizationKey
Optional synchronization scope identifier. Defaults to "Local". When not "Local",
triggers synchronization after marking record as deleted.

.PARAMETER SessionOnly
Use alternative settings stored in session for Data preferences like Language,
Database paths, etc.

.PARAMETER ClearSession
Clear the session setting (Global variable) before retrieving.

.PARAMETER DatabasePath
Database path for key-value store data files.

.PARAMETER SkipSession
Dont use alternative settings stored in session for Data preferences like
Language, Database paths, etc.

.EXAMPLE
Remove-KeyFromStore -StoreName "ConfigStore" -KeyName "ApiKey"

.EXAMPLE
removekey ConfigStore ApiKey
#>
###############################################################################
function Remove-KeyFromStore {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('removekey')]

    param (
        ###############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'Name of the store'
        )]
        [string] $StoreName,
        ###############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = 'Key to be deleted'
        )]
        [string] $KeyName,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = 'Key to identify synchronization scope'
        )]
        [string] $SynchronizationKey = 'Local',
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Use alternative settings stored in session for Data ' +
                'preferences like Language, Database paths, etc')
        )]
        [switch] $SessionOnly,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Clear the session setting (Global variable) before ' +
                'retrieving')
        )]
        [switch] $ClearSession,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Database path for key-value store data files'
        )]
        [string] $DatabasePath,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Dont use alternative settings stored in session for ' +
                'Data preferences like Language, Database paths, etc')
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession
        ###############################################################################
    )

    begin {

        # use provided database path or default to local app data
        if ([string]::IsNullOrWhiteSpace($DatabasePath)) {

            $databaseFilePath = GenXdev.FileSystem\Expand-Path `
            ("$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\" +
                'KeyValueStores.sqlite.db') `
                -CreateDirectory
        }
        else {

            $databaseFilePath = GenXdev.FileSystem\Expand-Path $DatabasePath `
                -CreateDirectory
        }

        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using database at: $databaseFilePath"

        Microsoft.PowerShell.Utility\Write-Verbose `
        ("Preparing to remove key '$KeyName' from store '$StoreName'")

        # initialize database if it doesn't exist
        if (-not (Microsoft.PowerShell.Management\Test-Path `
                    -LiteralPath $databaseFilePath)) {

            Microsoft.PowerShell.Utility\Write-Verbose `
                'Database not found, initializing...'

            # copy identical parameter values for Initialize-KeyValueStores
            $initParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Initialize-KeyValueStores' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            $null = GenXdev.Data\Initialize-KeyValueStores @initParams
        }

        # get current user info for audit trail
        $lastModifiedBy = "$env:COMPUTERNAME\$env:USERNAME"
    }


    process {

        Microsoft.PowerShell.Utility\Write-Verbose `
            "Processing delete operation with sync key: $SynchronizationKey"

        # determine SQL operation based on synchronization key
        if ($SynchronizationKey -eq 'Local') {

            $operation = 'Permanently delete'
            $sqlQuery = @'
DELETE FROM KeyValueStore
WHERE storeName = @storeName
AND keyName = @keyName
AND synchronizationKey = @syncKey;
'@
        }
        else {

            $operation = 'Mark as deleted'
            $sqlQuery = @'
UPDATE KeyValueStore
SET deletedDate = CURRENT_TIMESTAMP,
    lastModified = CURRENT_TIMESTAMP,
    lastModifiedBy = @modifiedBy
WHERE storeName = @storeName
AND keyName = @keyName
AND synchronizationKey = @syncKey;
'@
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
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Executing database operation...'

            # copy identical parameter values for Invoke-SQLiteQuery
            $queryParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Invoke-SQLiteQuery' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # assign specific parameters for the database operation
            $queryParams.DatabaseFilePath = $databaseFilePath
            $queryParams.Queries = $sqlQuery
            $queryParams.SqlParameters = $params

            # execute the database operation
            $null = GenXdev.Data\Invoke-SQLiteQuery @queryParams

            # trigger synchronization for non-local operations
            if ($SynchronizationKey -ne 'Local') {

                Microsoft.PowerShell.Utility\Write-Verbose `
                    'Triggering synchronization...'

                # copy identical parameter values for Sync-KeyValueStore
                $syncParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                    -BoundParameters $PSBoundParameters `
                    -FunctionName 'GenXdev.Data\Sync-KeyValueStore' `
                    -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                        -Scope Local `
                        -ErrorAction SilentlyContinue)

                # assign specific parameters for synchronization
                $syncParams.SynchronizationKey = $SynchronizationKey

                # trigger the synchronization process
                $null = GenXdev.Data\Sync-KeyValueStore @syncParams
            }
        }
    }

    end {
    }
}
###############################################################################