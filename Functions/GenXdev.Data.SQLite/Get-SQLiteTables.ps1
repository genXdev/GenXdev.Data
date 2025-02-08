################################################################################
<#
.SYNOPSIS
Retrieves a list of table names from a SQLite database.

.DESCRIPTION
This function queries a SQLite database to return all table names defined in the
sqlite_master table. It supports connecting via either a connection string or a
database file path.

.PARAMETER ConnectionString
The connection string to the SQLite database.

.PARAMETER DatabaseFilePath
The path to the SQLite database file.

.EXAMPLE
Get-SQLiteTables -DatabaseFilePath "C:\MyDB.sqlite"

.EXAMPLE
Get-SQLiteTables -ConnectionString "Data Source=C:\MyDB.sqlite;Version=3;"
#>
function Get-SQLiteTables {

    [CmdletBinding(DefaultParameterSetName = "Default")]
    param (
        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database.'
        )]
        [string]$ConnectionString,

        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$DatabaseFilePath
    )

    begin {
        Write-Verbose "Preparing to retrieve table names from SQLite database"
    }

    process {
        # set the query to retrieve all table names
        $PSBoundParameters["Queries"] = "SELECT name FROM sqlite_master WHERE type='table'"

        # execute the query and return results
        Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
    }
}
################################################################################
