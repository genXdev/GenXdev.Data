################################################################################
<#
.SYNOPSIS
Retrieves the complete schema information from a SQLite database.

.DESCRIPTION
This function queries the sqlite_master table to obtain the complete schema
definition of a SQLite database, including tables, views, indexes and triggers.
It accepts either a connection string or a direct path to the database file.

.PARAMETER ConnectionString
The SQLite connection string that specifies the database location and any
additional connection parameters.

.PARAMETER DatabaseFilePath
The direct filesystem path to the SQLite database file.

.EXAMPLE
Get-SQLiteSchema -DatabaseFilePath "C:\Databases\inventory.db"

.EXAMPLE
Get-SQLiteSchema -ConnectionString "Data Source=C:\Databases\inventory.db;Version=3;"
#>
function Get-SQLiteSchema {

    [CmdletBinding(DefaultParameterSetName = "Default")]

    param (
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database.'
        )]
        [string]$ConnectionString,

        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file.'
        )]
        [string]$DatabaseFilePath
    )

    begin {

        # output verbose information about the selected parameter set
        Write-Verbose "Using parameter set: $($PSCmdlet.ParameterSetName)"
    }

    process {

        # prepare the query to retrieve the complete database schema
        $PSBoundParameters["Queries"] = "SELECT * FROM sqlite_master"

        # execute the schema query using the existing Invoke-SQLiteQuery function
        Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
    }
}
################################################################################
