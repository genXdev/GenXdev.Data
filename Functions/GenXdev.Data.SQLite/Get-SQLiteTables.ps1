################################################################################
<#
.SYNOPSIS
Retrieves a list of table names from a SQLite database.

.DESCRIPTION
Queries the sqlite_master system table to retrieve all user-defined table names
from a SQLite database. Supports connecting via either a direct connection string
or a database file path. Returns the table names as a collection of strings.

.PARAMETER ConnectionString
The full connection string to connect to the SQLite database. Should include the
Data Source and Version parameters at minimum.

.PARAMETER DatabaseFilePath
The full filesystem path to the SQLite database file. The function will create
an appropriate connection string internally.

.EXAMPLE
Get-SQLiteTables -DatabaseFilePath "C:\Databases\Inventory.sqlite"
# Returns all table names from the specified database file

.EXAMPLE
Get-SQLiteTables -ConnectionString "Data Source=C:\DB\Users.sqlite;Version=3;"
# Returns all table names using a custom connection string
#>
function Get-SQLiteTables {

    [CmdletBinding(DefaultParameterSetName = "Default")]
    param (
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database.'
        )]
        [string]$ConnectionString,

        ###########################################################################
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

        # log the start of table retrieval operation
        Write-Verbose "Starting SQLite table name retrieval operation"
    }

    process {

        # define the query to get all table names from sqlite_master
        $PSBoundParameters["Queries"] = "SELECT name FROM sqlite_master " +
            "WHERE type='table'"

        # execute query using the inherited connection parameters
        Write-Verbose "Executing query to retrieve table names"
        Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
    }
}
################################################################################
