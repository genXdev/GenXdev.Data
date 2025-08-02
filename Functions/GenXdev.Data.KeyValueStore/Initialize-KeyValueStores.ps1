###############################################################################
<#
.SYNOPSIS
Initializes and synchronizes KeyValueStore databases between local and OneDrive.

.DESCRIPTION
Creates SQLite databases with required schema in two locations if they don't
exist:
1. Local machine for immediate access
2. OneDrive folder for cloud synchronization
The function ensures both databases have identical schema with synchronization
support.

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
Initialize-KeyValueStores -SessionOnly -ClearSession -DatabasePath "C:\MyDb.db"

.EXAMPLE
Initialize-KeyValueStores -SkipSession
#>
function Initialize-KeyValueStores {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]

    param(
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
            HelpMessage = 'Database path for key-value store data files'
        )]
        [string] $DatabasePath,
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

        # output verbose message showing selected database path
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using database at: $databaseFilePath"

        # determine the path for onedrive synchronized database
        $shadowDbPath = GenXdev.FileSystem\Expand-Path `
        ('~\Onedrive\GenXdev.PowerShell.SyncObjects\' +
            'KeyValueStores.sqlite.db') `
            -CreateDirectory

        # extract the directory path for the shadow database
        $shadowPath = [System.IO.Path]::GetDirectoryName($shadowDbPath)

        # make the onedrive sync folder hidden to prevent user interference
        $folder = [System.IO.DirectoryInfo]::new($shadowPath)

        $folder.Attributes = $folder.Attributes -bor `
            [System.IO.FileAttributes]::Hidden
    }


    process {

        # iterate through both database paths to ensure they exist
        foreach ($dbPath in @($databaseFilePath, $shadowDbPath)) {

            # create database if it doesn't exist
            if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $dbPath)) {

                # output verbose message about database creation
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Creating KeyValueStore database at: $dbPath"

                # create new sqlite database file
                $null = GenXdev.Data\New-SQLiteDatabase -DatabaseFilePath $dbPath

                # create table schema with synchronization support columns
                $sqlCreateTable = @'
CREATE TABLE IF NOT EXISTS KeyValueStore (
    synchronizationKey TEXT NOT NULL DEFAULT 'Local',
    storeName TEXT NOT NULL,
    keyName TEXT NOT NULL,
    value TEXT,
    lastModified DATETIME DEFAULT CURRENT_TIMESTAMP,
    deletedDate DATETIME,
    lastModifiedBy TEXT,
    PRIMARY KEY (synchronizationKey, storeName, keyName)
);
CREATE UNIQUE INDEX IF NOT EXISTS idx_KeyValueStore
    ON KeyValueStore (synchronizationKey, storeName, keyName);
'@

                # execute table creation sql against the database
                $null = GenXdev.Data\Invoke-SQLiteQuery `
                    -DatabaseFilePath $dbPath `
                    -Queries $sqlCreateTable
            }
        }
    }

    end {
    }
}
###############################################################################