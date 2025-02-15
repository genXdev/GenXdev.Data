################################################################################
<#
.SYNOPSIS
Initializes and synchronizes KeyValueStore databases between local and OneDrive.

.DESCRIPTION
    Creates SQLite databases with required schema in two locations if they don't exist:
1. Local machine for immediate access
2. OneDrive folder for cloud synchronization
The function ensures both databases have identical schema with synchronization
support.

.PARAMETER SynchronizationKey
Specifies the synchronization scope identifier. Used to partition data for
different synchronization contexts.

.EXAMPLE
Initialize-KeyValueStores -SynchronizationKey "ProjectA"

.EXAMPLE
Initialize-KeyValueStores
#>
function Initialize-KeyValueStores {

    [CmdletBinding()]
    param(
        #######################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = "Key to identify synchronization scope"
        )]
        [string]$SynchronizationKey = "Local"
        #######################################################################
    )

    begin {

        # determine the path for local database storage
        $databaseFilePath = Expand-Path `
            "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db" `
            -CreateDirectory

        # determine the path for onedrive synchronized database
        $shadowDbPath = Expand-Path `
            "~\Onedrive\GenXdev.PowerShell.SyncObjects\KeyValueStores.sqllite.db" `
            -CreateDirectory

        # extract the directory path for the shadow database
        $shadowPath = [System.IO.Path]::GetDirectoryName($shadowDbPath)

        # make the onedrive sync folder hidden to prevent user interference
        $folder = [System.IO.DirectoryInfo]::new($shadowPath)
        $folder.Attributes = $folder.Attributes -bor [System.IO.FileAttributes]::Hidden
    }

    process {

        # iterate through both database paths to ensure they exist
        foreach ($dbPath in @($databaseFilePath, $shadowDbPath)) {

            # create database if it doesn't exist
            if (-not (Test-Path $dbPath)) {

                Write-Verbose "Creating KeyValueStore database at: $dbPath"
                New-SQLiteDatabase -DatabaseFilePath $dbPath

                # create table schema with synchronization support columns
                $sqlCreateTable = @"
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
"@
                Invoke-SQLiteQuery -DatabaseFilePath $dbPath -Queries $sqlCreateTable
            }
        }
    }

    end {
    }
}
################################################################################
