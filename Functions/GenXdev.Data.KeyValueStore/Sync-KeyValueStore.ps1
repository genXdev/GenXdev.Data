<##############################################################################
Part of PowerShell module : GenXdev.Data.KeyValueStore
Original cmdlet filename  : Sync-KeyValueStore.ps1
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
###############################################################################
<#
.SYNOPSIS
Synchronizes local and OneDrive key-value store databases.

.DESCRIPTION
Performs two-way synchronization between local and OneDrive shadow databases using
a last-modified timestamp strategy. Records are merged based on their last
modification time, with newer versions taking precedence.

.PARAMETER SynchronizationKey
Identifies the synchronization scope for the operation. Using "Local" will skip
synchronization as it indicates local-only records.

.PARAMETER DatabasePath
Database path for key-value store data files.

.PARAMETER SessionOnly
Use alternative settings stored in session for Data preferences like Language,
Database paths, etc.

.PARAMETER ClearSession
Clear the session setting (Global variable) before retrieving.

.PARAMETER SkipSession
Dont use alternative settings stored in session for Data preferences like
Language, Database paths, etc.

.EXAMPLE
Sync-KeyValueStore

.EXAMPLE
Sync-KeyValueStore -SynchronizationKey "UserSettings"
#>
function Sync-KeyValueStore {

    [CmdletBinding()]
    param(
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = 'Key to identify synchronization scope'
        )]
        [string] $SynchronizationKey = 'Local',
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Database path for key-value store data files'
        )]
        [string] $DatabasePath,
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
            HelpMessage = ('Clear the session setting (Global variable) ' +
                'before retrieving')
        )]
        [switch] $ClearSession,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Dont use alternative settings stored in session ' +
                'for Data preferences like Language, Database ' +
                'paths, etc')
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession
        ###############################################################################
    )

    begin {

        # check if custom database path was provided or use default location
        if ([string]::IsNullOrWhiteSpace($DatabasePath)) {

            # construct default database path in local app data folder
            $databaseFilePath = GenXdev.FileSystem\Expand-Path `
            ("$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\" +
                'KeyValueStores.sqlite.db') `
                -CreateDirectory
        }
        else {

            # use the provided database path and ensure directory exists
            $databaseFilePath = GenXdev.FileSystem\Expand-Path $DatabasePath `
                -CreateDirectory
        }

        # log the beginning of sync operation for troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Starting key-value store sync with key: $SynchronizationKey"
    }

    process {

        # skip synchronization for local-only records to avoid unnecessary work
        if ($SynchronizationKey -eq 'Local') {

            # inform user that local-only sync is being skipped
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Skipping sync for local-only key'
            return
        }

        # assign local database path for clarity in sync operations
        $localDb = $databaseFilePath

        # construct path to onedrive shadow database for synchronization
        $shadowDb = GenXdev.FileSystem\Expand-Path `
        ('~\OneDrive\GenXdev.PowerShell.SyncObjects\' +
            'KeyValueStores.sqlite.db')

        # log database paths for debugging and verification purposes
        Microsoft.PowerShell.Utility\Write-Verbose "Local DB: $localDb"

        Microsoft.PowerShell.Utility\Write-Verbose "Shadow DB: $shadowDb"

        # verify both database files exist before attempting synchronization
        if (-not ([System.IO.File]::Exists($localDb) -and
                [System.IO.File]::Exists($shadowDb))) {

            # inform user that missing database files are being initialized
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Initializing missing database files'

            # copy compatible parameters for the initialization function call
            $params = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Initialize-KeyValueStores' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # initialize the key-value store databases if they don't exist
                GenXdev.Data\Initialize-KeyValueStores @params
        }

        # define sql query for bidirectional synchronization between databases
        $syncQuery = @'
ATTACH DATABASE @shadowDb AS shadow;

-- sync from shadow to local
INSERT OR REPLACE INTO main.KeyValueStore
SELECT * FROM shadow.KeyValueStore s
WHERE s.synchronizationKey = @syncKey
AND (
    NOT EXISTS (
        SELECT 1 FROM main.KeyValueStore m
        WHERE m.synchronizationKey = s.synchronizationKey
        AND m.storeName = s.storeName
        AND m.keyName = s.keyName
        AND m.lastModified >= s.lastModified
    )
);

-- sync from local to shadow
INSERT OR REPLACE INTO shadow.KeyValueStore
SELECT * FROM main.KeyValueStore m
WHERE m.synchronizationKey = @syncKey
AND (
    NOT EXISTS (
        SELECT 1 FROM shadow.KeyValueStore s
        WHERE s.synchronizationKey = m.synchronizationKey
        AND s.storeName = m.storeName
        AND s.keyName = m.keyName
        AND s.lastModified > m.lastModified
    )
);
'@

        # create parameter hashtable for sql query parameter substitution
        $params = @{
            'shadowDb' = $shadowDb
            'syncKey'  = $SynchronizationKey
        }

        # log query execution for debugging and performance monitoring
        Microsoft.PowerShell.Utility\Write-Verbose `
            'Executing sync query with parameters'

        # execute the synchronization query with prepared parameters
            GenXdev.Data\Invoke-SQLiteQuery `
                -DatabaseFilePath $localDb `
                -Queries $syncQuery `
                -SqlParameters $params
    }

    end {

        # log completion of sync operation for audit and troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose 'Sync operation completed'
    }
}
###############################################################################