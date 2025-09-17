<##############################################################################
Part of PowerShell module : GenXdev.Data.KeyValueStore
Original cmdlet filename  : Get-StoreKeys.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.274.2025
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
Retrieves all key names for a given key-value store.

.DESCRIPTION
Queries the KeyValueStore SQLite database to retrieve all active (non-deleted)
keys for a specified store. Can optionally filter by synchronization scope.
Automatically initializes the database if not found and handles synchronization
for non-local stores.

.PARAMETER StoreName
The name of the key-value store to query. This identifies the logical grouping
of keys and values in the database.

.PARAMETER SynchronizationKey
Optional scope identifier for synchronization. Use "Local" for local-only data.
Defaults to "%" which matches all scopes. Triggers sync for non-local scopes.

.PARAMETER DatabasePath
Directory path for keyvalue database files.

.PARAMETER SessionOnly
Use alternative settings stored in session for Data preferences like Language,
Database paths, etc.

.PARAMETER ClearSession
Clear the session setting (Global variable) before retrieving.

.PARAMETER SkipSession
Do not use alternative settings stored in session for Data preferences like
Language, Database paths, etc.

.EXAMPLE
Get-StoreKeys -StoreName "ApplicationSettings" -SynchronizationKey "Local"

.EXAMPLE
getkeys AppSettings
#>
function Get-StoreKeys {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [Alias('getkeys')]

    param (
        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            HelpMessage = 'Name of the store whose keys should be retrieved'
        )]
        [string]$StoreName,
        ###############################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = 'Key to identify synchronization scope, defaults to all'
        )]
        [string]$SynchronizationKey = '%',
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Database path for key-value store data files'
        )]
        [string]$DatabasePath,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use alternative settings stored in session for Data preferences like Language, Database paths, etc'
        )]
        [switch]$SessionOnly,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Clear the session setting (Global variable) before retrieving'
        )]
        [switch]$ClearSession,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc'
        )]
        [Alias('FromPreferences')]
        [switch]$SkipSession
        ###############################################################################
    )

    begin {

        # use provided database path or default to local app data
        if ([string]::IsNullOrWhiteSpace($DatabasePath)) {

            $databaseFilePath = GenXdev.FileSystem\Expand-Path `
                "$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\KeyValueStores.sqlite.db" `
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

        # output verbose message for store initialization
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Initializing Get-StoreKeys for store: $StoreName"
        )
    }

    process {

        # check if the database file exists, initialize if not found
        if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $databaseFilePath)) {

            # output verbose message for database initialization
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

            # initialize the key-value stores database
            $null = GenXdev.Data\Initialize-KeyValueStores @initParams
        }

        # synchronize non-local stores with remote if needed
        if ($SynchronizationKey -ne 'Local') {

            # output verbose message for synchronization
            Microsoft.PowerShell.Utility\Write-Verbose (
                "Syncing non-local store with key: $SynchronizationKey"
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

            # synchronize the key-value store for the given key
            $null = GenXdev.Data\Sync-KeyValueStore @syncParams
        }

        # build the SQL query to get all active keys for the store
        $sqlQuery = @'
SELECT keyName
FROM KeyValueStore
WHERE storeName = @storeName
AND synchronizationKey LIKE @syncKey
AND deletedDate IS NULL;
'@

        # build the parameters for the SQL query
        $params = @{
            'storeName' = $StoreName
            'syncKey'   = $SynchronizationKey
        }

        # output verbose message for querying keys
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Querying keys from store: $StoreName"
        )

        # execute the query and return key names
        GenXdev.Data\Invoke-SQLiteQuery `
            -DatabaseFilePath $databaseFilePath `
            -Queries $sqlQuery `
            -SqlParameters $params |
            Microsoft.PowerShell.Core\ForEach-Object keyName
    }

    end {
    }
}
###############################################################################