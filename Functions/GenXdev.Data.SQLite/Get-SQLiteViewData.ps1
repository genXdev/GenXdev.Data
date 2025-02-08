################################################################################
<#
.SYNOPSIS
Retrieves data from a SQLite database view.

.DESCRIPTION
Gets records from a specified view in a SQLite database, either using a connection
string or database file path. Allows limiting the number of records returned.

.PARAMETER ConnectionString
The connection string to connect to the SQLite database.

.PARAMETER DatabaseFilePath
The file path to the SQLite database file.

.PARAMETER ViewName
The name of the view to query data from.

.PARAMETER Count
The maximum number of records to return. Use -1 to return all records.
Default is 100.

.EXAMPLE
Get-SQLiteViewData -DatabaseFilePath "C:\data\mydb.sqlite" -ViewName "UserView"
-Count 10

.EXAMPLE
Get-SQLiteViewData "C:\data\mydb.sqlite" "UserView"
#>
function Get-SQLiteViewData {

    [CmdletBinding(DefaultParameterSetName = "DatabaseFilePath")]
    param (
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ConnectionString,

        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$DatabaseFilePath,

        ###########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $true,
            HelpMessage = 'The name of the view.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ViewName,

        ###########################################################################
        [Parameter(
            Position = 2,
            Mandatory = $false,
            HelpMessage = 'Number of records to return. -1 for all records.'
        )]
        [ValidateRange(-1, [int]::MaxValue)]
        [int]$Count = 100
    )

    begin {
        Write-Verbose "Starting Get-SQLiteViewData for view: $ViewName"
    }

    process {
        # construct the query based on count parameter
        $query = if ($Count -eq -1) {
            "SELECT * FROM $ViewName"
        }
        else {
            "SELECT * FROM $ViewName LIMIT $Count"
        }

        Write-Verbose "Executing query: $query"

        # set the query parameter
        $PSBoundParameters["Queries"] = $query

        # execute the query using invoke-sqlitequery
        Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
        Write-Verbose "Completed querying view: $ViewName"
    }
}
################################################################################
