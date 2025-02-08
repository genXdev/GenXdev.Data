################################################################################
<#
.SYNOPSIS
Initializes KeyValueStore databases locally and in OneDrive for synchronization.

.DESCRIPTION
Creates SQLite databases with required schema both locally and in OneDrive for
synchronization purposes if they don't exist.

.PARAMETER SynchronizationKey
Optional key to identify synchronization scope, defaults to "Local".

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

        # get paths for both local and shadow databases
        $databaseFilePath = Expand-Path "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db" `
            -CreateDirectory

        $shadowDbPath = Expand-Path "~\Onedrive\GenXdev.PowerShell.SyncObjects\KeyValueStores.sqllite.db" `
            -CreateDirectory

        $shadowPath = [System.IO.Path]::GetDirectoryName($shadowDbPath)

        # hide the onedrive sync folder
        $folder = [System.IO.DirectoryInfo]::new($shadowPath)
        $folder.Attributes = $folder.Attributes -bor [System.IO.FileAttributes]::Hidden
    }

    process {

        # create databases if they don't exist
        foreach ($dbPath in @($databaseFilePath, $shadowDbPath)) {

            if (-not (Test-Path $dbPath)) {

                Write-Verbose "Creating database at: $dbPath"
                New-SQLiteDatabase -DatabaseFilePath $dbPath

                # create table with sync support
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
