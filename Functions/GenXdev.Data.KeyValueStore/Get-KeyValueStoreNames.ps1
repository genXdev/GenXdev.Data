<##############################################################################
Part of PowerShell module : GenXdev.Data.KeyValueStore
Original cmdlet filename  : Get-KeyValueStoreNames.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.284.2025
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
###############################################################################
<#
.SYNOPSIS
Retrieves a list of all available key-value store names from the database.

.DESCRIPTION
Queries the SQLite database to get unique store names based on the provided
synchronization key. The function handles database initialization if needed and
performs synchronization for non-local scopes. Returns store names that are
not marked as deleted and match the specified synchronization scope.

.PARAMETER SynchronizationKey
Key to identify synchronization scope. Use '%' for all stores, 'Local' for
local stores only. Synchronization occurs for non-local scopes. Supports SQL
LIKE pattern matching for flexible store filtering.

.PARAMETER DatabasePath
Directory path for preferences database files. When specified, overrides the
default database location for storing key-value store configurations.

.PARAMETER SessionOnly
Use alternative settings stored in session for Data preferences like Language,
Database paths, etc. When enabled, retrieves settings from session variables
instead of persistent storage.

.PARAMETER ClearSession
Clear the session setting (Global variable) before retrieving. Forces a fresh
retrieval of settings by clearing any cached session data before processing.

.PARAMETER SkipSession
Dont use alternative settings stored in session for Data preferences like
Language, Database paths, etc. Forces retrieval from persistent storage,
bypassing any session-cached settings.

.EXAMPLE
Get-KeyValueStoreNames -SynchronizationKey "Local" -DatabasePath "C:\Data"

.EXAMPLE
getstorenames "%"
#>
###############################################################################
function Get-KeyValueStoreNames {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [Alias('getstorenames')]

    param(
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = 'Key to identify synchronization scope, defaults to all'
        )]
        [string] $SynchronizationKey = '%',
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Database path for key-value store data files'
        )]
        [string] $DatabasePath,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use alternative settings stored in session for Data preferences like Language, Database paths, etc'
        )]
        [switch] $SessionOnly,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Clear the session setting (Global variable) before retrieving'
        )]
        [switch] $ClearSession,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc'
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

        # output verbose message for database file path
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Using database at: $databaseFilePath"
        )
    }

    process {

        # check if database file exists and create if needed
        if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $databaseFilePath)) {

            # output verbose information about database initialization
            Microsoft.PowerShell.Utility\Write-Verbose (
                'Database not found, initializing...'
            )

            # copy identical parameter values for Initialize-KeyValueStores
            $initParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Initialize-KeyValueStores' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # initialize the key value stores database
                GenXdev.Data\Initialize-KeyValueStores @initParams
        }

        # perform synchronization for non-local stores
        if ($SynchronizationKey -ne 'Local') {

            # output verbose information about synchronization
            Microsoft.PowerShell.Utility\Write-Verbose (
                "Synchronizing non-local store: $SynchronizationKey"
            )

            # copy identical parameter values for Sync-KeyValueStore
            $syncParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Sync-KeyValueStore' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # assign specific parameters for synchronization
            $syncParams.SynchronizationKey = $SynchronizationKey

            # synchronize the key value store with remote sources
                GenXdev.Data\Sync-KeyValueStore @syncParams
        }

        # construct sql query to get unique store names
        $sqlQuery = @'
SELECT DISTINCT storeName
FROM KeyValueStore
WHERE synchronizationKey LIKE @syncKey
AND deletedDate IS NULL;
'@

        # create parameters hashtable for the sql query
        $params = @{
            'syncKey' = $SynchronizationKey
        }

        # output verbose information about the query parameters
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Querying stores with sync key: $SynchronizationKey"
        )

        # execute the sql query and extract store names from results
            GenXdev.Data\Invoke-SQLiteQuery `
                -DatabaseFilePath $databaseFilePath `
                -Queries $sqlQuery `
                -SqlParameters $params |
                Microsoft.PowerShell.Core\ForEach-Object storeName
    }

    end {
    }
}
###############################################################################