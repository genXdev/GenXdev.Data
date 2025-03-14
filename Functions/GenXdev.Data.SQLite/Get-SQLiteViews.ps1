################################################################################
<#
.SYNOPSIS
Retrieves a list of views from a SQLite database.

.DESCRIPTION
Gets all view names from the specified SQLite database file or connection string.
Returns an array of view names that can be used for further database operations.
The function supports two parameter sets for flexibility: providing either a
connection string or a direct path to the database file.

.PARAMETER ConnectionString
The connection string to connect to the SQLite database. Use this when you need
to specify custom connection parameters.

.PARAMETER DatabaseFilePath
The full path to the SQLite database file. Use this for simple file-based
connections.

.EXAMPLE
Get-SQLiteViews -DatabaseFilePath "C:\Databases\MyDatabase.sqlite"

.EXAMPLE
s -ConnectionString "Data Source=C:\Databases\MyDatabase.sqlite;Version=3;"
#>
function Get-SQLiteViews {

    [CmdletBinding(DefaultParameterSetName = "Default")]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
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
        [string]$DatabaseFilePath
    )

    begin {

        # log the start of the view retrieval process
        Write-Verbose "Preparing to retrieve SQLite views..."
    }

    process {

        # define the SQL query to retrieve all view names from sqlite_master
        $query = "SELECT name FROM sqlite_master WHERE type='view'"

        # log the query being executed for troubleshooting
        Write-Verbose "Executing query: $query"

        # execute the query using existing parameter set and store in $PSBoundParameters
        $PSBoundParameters["Queries"] = $query

        # invoke the query and return results using parameter splatting
        Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
    }
}
################################################################################