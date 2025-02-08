################################################################################
<#
.SYNOPSIS
Retrieves data from a specific column in a SQLite database table.

.DESCRIPTION
This function queries a SQLite database and returns the values from a specified
column in a table. It supports connecting via connection string or database file
path and allows limiting the number of returned records.

.PARAMETER ConnectionString
The connection string to the SQLite database.

.PARAMETER DatabaseFilePath
The path to the SQLite database file.

.PARAMETER TableName
The name of the table to query.

.PARAMETER ColumnName
The name of the column to retrieve data from.

.PARAMETER Count
The number of records to return. Default is 100. Use -1 to return all records.

.EXAMPLE
Get-SQLiteTableColumnData -DatabaseFilePath "C:\data.db" -TableName "Users" `
    -ColumnName "Name" -Count 10

.EXAMPLE
Get-SQLiteTableColumnData "C:\data.db" "Users" "Name"
#>
function Get-SQLiteTableColumnData {

    [CmdletBinding(DefaultParameterSetName = "Default")]
    param (
        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ConnectionString,

        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $DatabaseFilePath,

        ###############################################################################
        [Parameter(
            Position = 1,
            Mandatory = $true,
            HelpMessage = 'The name of the table'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $TableName,

        ###############################################################################
        [Parameter(
            Position = 2,
            Mandatory = $true,
            HelpMessage = 'The name of the column'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ColumnName,

        ###############################################################################
        [Parameter(
            Position = 3,
            Mandatory = $false,
            HelpMessage = 'The number of records to return. Default is 100. -1 for all'
        )]
        [int] $Count = 100
    )

    begin {
        Write-Verbose "Starting query for column '$ColumnName' in table '$TableName'"
    }

    process {
        # construct the query based on the count parameter
        $query = if ($Count -eq -1) {
            "SELECT $ColumnName FROM $TableName"
        }
        else {
            "SELECT $ColumnName FROM $TableName LIMIT $Count"
        }

        Write-Verbose "Executing query: $query"

        # set the query parameter and execute
        $PSBoundParameters["Queries"] = $query
        Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
        Write-Verbose "Query execution completed"
    }
}
################################################################################
