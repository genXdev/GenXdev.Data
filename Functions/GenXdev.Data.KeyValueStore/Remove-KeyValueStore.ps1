<##############################################################################
Part of PowerShell module : GenXdev.Data.KeyValueStore
Original cmdlet filename  : Remove-KeyValueStore.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.278.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
################################################################################
<#
.SYNOPSIS
Removes a key-value store from the database.

.DESCRIPTION
Removes all entries for a specified store from the database. For local stores,
performs a physical delete. For synchronized stores, marks entries as deleted
and triggers synchronization. This function supports both local and cloud-
synchronized stores with proper audit trail maintenance.

.PARAMETER StoreName
The name of the key-value store to remove.

.PARAMETER SynchronizationKey
The synchronization scope identifier. Defaults to "Local" for non-synchronized
stores.

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
Remove-KeyValueStore -StoreName "ConfigurationStore" -SynchronizationKey "Cloud"

.EXAMPLE
Remove-KeyValueStore "ConfigurationStore" "Cloud"
#>
################################################################################
function Remove-KeyValueStore {

    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        #######################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'Name of the store to delete'
        )]
        [string]$StoreName,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'Key to identify synchronization scope'
        )]
        [string]$SynchronizationKey = 'Local',
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Database path for key-value store data files')
        )]
        [string]$DatabasePath,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Use alternative settings stored in session for ' +
                'Data preferences like Language, Database paths, etc')
        )]
        [switch]$SessionOnly,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Clear the session setting (Global variable) ' +
                'before retrieving')
        )]
        [switch]$ClearSession,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Dont use alternative settings stored in session ' +
                'for Data preferences like Language, Database paths, etc')
        )]
        [Alias('FromPreferences')]
        [switch]$SkipSession
        #######################################################################
    )

    begin {

        # determine database file path using provided path or default location
        if ([string]::IsNullOrWhiteSpace($DatabasePath)) {

            # build default path to local application data folder
            $databaseFilePath = GenXdev.FileSystem\Expand-Path `
            ("$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\" +
                'KeyValueStores.sqlite.db') `
                -CreateDirectory
        }
        else {

            # use provided database path and ensure directory exists
            $databaseFilePath = GenXdev.FileSystem\Expand-Path $DatabasePath `
                -CreateDirectory
        }

        # output verbose information about database location
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using database at: $databaseFilePath"
    }

    process {

        # check if database file exists and initialize if necessary
        if (-not (Microsoft.PowerShell.Management\Test-Path `
                    -LiteralPath $databaseFilePath)) {

            # output verbose information about database initialization
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Database not found, initializing new database'

            # create new database with required schema
            $null = GenXdev.Data\Initialize-KeyValueStores
        }

        # construct audit trail identifier from computer and user names
        $lastModifiedBy = "$env:COMPUTERNAME\$env:USERNAME"

        # output verbose information about operation performer
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Operation performed by: $lastModifiedBy"

        # determine appropriate sql operation based on synchronization scope
        if ($SynchronizationKey -eq 'Local') {

            # prepare for physical deletion of local store entries
            $operation = 'Deleting local store'
            $sqlQuery = @'
DELETE FROM KeyValueStore
WHERE storeName = @storeName
AND synchronizationKey = @syncKey;
'@
        }
        else {

            # prepare for logical deletion with audit trail for sync stores
            $operation = 'Marking sync store as deleted'
            $sqlQuery = @'
UPDATE KeyValueStore
SET deletedDate = CURRENT_TIMESTAMP,
    lastModified = CURRENT_TIMESTAMP,
    lastModifiedBy = @modifiedBy
WHERE storeName = @storeName
AND synchronizationKey = @syncKey;
'@
        }

        # verify user consent for potentially destructive operation
        if ($PSCmdlet.ShouldProcess($StoreName, $operation)) {

            # construct parameter hashtable for sql query execution
            $params = @{
                'storeName'  = $StoreName
                'syncKey'    = $SynchronizationKey
                'modifiedBy' = $lastModifiedBy
            }

            # output verbose information about database operation
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Executing database operation for store: $StoreName"

            # transfer applicable parameters from current function to query function
            $queryParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Invoke-SQLiteQuery' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # configure specific parameters for database query execution
            $queryParams.DatabaseFilePath = $databaseFilePath
            $queryParams.Queries = $sqlQuery
            $queryParams.SqlParameters = $params

            # execute sql command against sqlite database
            $null = GenXdev.Data\Invoke-SQLiteQuery @queryParams

            # initiate synchronization process for cloud-synchronized stores
            if ($SynchronizationKey -ne 'Local') {

                # output verbose information about synchronization trigger
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Triggering synchronization for key: $SynchronizationKey"

                # transfer applicable parameters to synchronization function
                $syncParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                    -BoundParameters $PSBoundParameters `
                    -FunctionName 'GenXdev.Data\Sync-KeyValueStore' `
                    -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                        -Scope Local `
                        -ErrorAction SilentlyContinue)

                # configure synchronization key for cloud sync operation
                $syncParams.SynchronizationKey = $SynchronizationKey

                # execute synchronization to propagate changes to cloud
                $null = GenXdev.Data\Sync-KeyValueStore @syncParams
            }
        }
    }

    end {
    }
}
################################################################################