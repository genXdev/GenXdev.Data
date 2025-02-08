################################################################################
<#
.SYNOPSIS
Retrieves column data from a SQLite view.

.DESCRIPTION
This function retrieves data from a specified column in a SQLite view. It supports
connecting via connection string or database file path and allows limiting the
number of records returned.

.PARAMETER ConnectionString
The connection string to the SQLite database.

.PARAMETER DatabaseFilePath
The path to the SQLite database file.

.PARAMETER ViewName
The name of the view to query.

.PARAMETER ColumnName
The name of the column to retrieve data from.

.PARAMETER Count
The number of records to return. Default is 100. Use -1 to return all records.

.EXAMPLE
Get-SQLiteViewColumnData -DatabaseFilePath "C:\data\mydb.sqlite" `
    -ViewName "CustomerView" -ColumnName "Name" -Count 10

.EXAMPLE
Get-SQLiteViewColumnData "C:\data\mydb.sqlite" "CustomerView" "Name"
#>
function Get-SQLiteViewColumnData {

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
        [string]$DatabaseFilePath,

        ###############################################################################
        [Parameter(
            Position = 1,
            Mandatory = $true,
            HelpMessage = 'The name of the view.'
        )]
        [string]$ViewName,

        ###############################################################################
        [Parameter(
            Position = 2,
            Mandatory = $true,
            HelpMessage = 'The name of the column.'
        )]
        [string]$ColumnName,

        ###############################################################################
        [Parameter(
            Position = 3,
            Mandatory = $false,
            HelpMessage = 'The number of records to return. Default is 100. -1 for all.'
        )]
        [int]$Count = 100
    )

    begin {
        Write-Verbose "Starting Get-SQLiteViewColumnData for view '$ViewName'"
    }

    process {
        # construct the query based on count parameter
        if ($Count -eq -1) {
            $PSBoundParameters["Queries"] = "SELECT $ColumnName FROM $ViewName"
            Write-Verbose "Querying all records from view '$ViewName'"
        }
        else {
            $PSBoundParameters["Queries"] = "SELECT $ColumnName FROM $ViewName LIMIT $Count"
            Write-Verbose "Querying $Count records from view '$ViewName'"
        }

        # execute the query using Invoke-SQLiteQuery
        Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
        Write-Verbose "Completed Get-SQLiteViewColumnData for view '$ViewName'"
    }
}
################################################################################
