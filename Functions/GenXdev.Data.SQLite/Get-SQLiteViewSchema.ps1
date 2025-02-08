################################################################################
<#
.SYNOPSIS
Retrieves the SQL schema definition for a SQLite view.

.DESCRIPTION
This function queries the SQLite system tables to retrieve the SQL definition of
a specified view. It accepts either a connection string or database file path.

.PARAMETER ConnectionString
The connection string to the SQLite database.

.PARAMETER DatabaseFilePath
The path to the SQLite database file.

.PARAMETER ViewName
The name of the view to retrieve the schema for.

.EXAMPLE
Get-SQLiteViewSchema -DatabaseFilePath "C:\MyDb.sqlite" -ViewName "MyView"

.EXAMPLE
Get-SQLiteViewSchema "Server=mydb.sqlite" "MyView"
#>
function Get-SQLiteViewSchema {

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
        [string]$DatabaseFilePath,

        ###########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $true,
            HelpMessage = 'The name of the view.'
        )]
        [string]$ViewName
    )

    begin {
        Write-Verbose "Retrieving schema for view: $ViewName"
    }

    process {
        # construct the query to get view definition
        $query = "SELECT sql FROM sqlite_master WHERE name = '$ViewName'"
        Write-Verbose "Executing query: $query"

        # set the Queries parameter and invoke the query
        $PSBoundParameters["Queries"] = $query
        Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
    }
}
################################################################################
