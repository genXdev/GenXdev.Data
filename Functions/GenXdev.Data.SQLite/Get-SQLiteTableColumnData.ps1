<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : Get-SQLiteTableColumnData.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.292.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
###############################################################################
<#
.SYNOPSIS
Retrieves data from a specific column in a SQLite database table.

.DESCRIPTION
This function provides a convenient way to extract data from a single column in a
SQLite database table. It supports two connection methods: direct database file
path or connection string. The function includes options to limit the number of
returned records and uses proper SQLite query construction for optimal
performance.

.PARAMETER ConnectionString
The connection string to connect to the SQLite database. This parameter is
mutually exclusive with DatabaseFilePath.

.PARAMETER DatabaseFilePath
The file path to the SQLite database file. This parameter is mutually exclusive
with ConnectionString.

.PARAMETER TableName
The name of the table from which to retrieve the column data.

.PARAMETER ColumnName
The name of the column whose data should be retrieved.

.PARAMETER Count
The maximum number of records to return. Default is 100. Use -1 to return all
records without limit.

.EXAMPLE
Get-SQLiteTableColumnData -DatabaseFilePath "C:\MyDb.sqlite" `
    -TableName "Employees" `
    -ColumnName "Email" `
    -Count 10

.EXAMPLE
Get-SQLiteTableColumnData "C:\MyDb.sqlite" "Employees" "Email"
#>
function Get-SQLiteTableColumnData {

    [CmdletBinding(DefaultParameterSetName = 'Default')]
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
            HelpMessage = 'The name of the table to query'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $TableName,
        ###############################################################################
        [Parameter(
            Position = 2,
            Mandatory = $true,
            HelpMessage = 'The name of the column to retrieve'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ColumnName,
        ###############################################################################
        [Parameter(
            Position = 3,
            Mandatory = $false,
            HelpMessage = 'Number of records to return. Default 100. Use -1 for all'
        )]
        [int] $Count = 100
    )

    begin {

        # log the start of the operation with table and column details
        Microsoft.PowerShell.Utility\Write-Verbose "Starting data retrieval for column '$ColumnName' from table '$TableName'"
    }


    process {

        # construct the appropriate SQL query based on whether a limit is needed
        $query = if ($Count -eq -1) {
            "SELECT $ColumnName FROM $TableName"
        }
        else {
            "SELECT $ColumnName FROM $TableName LIMIT $Count"
        }

        # log the constructed query for debugging
        Microsoft.PowerShell.Utility\Write-Verbose "Executing SQL query: $query"

        # prepare parameters for Invoke-SQLiteQuery and execute the query
        $PSBoundParameters['Queries'] = $query
        GenXdev.Data\Invoke-SQLiteQuery @PSBoundParameters
    }

    end {

        # log completion of the operation
        Microsoft.PowerShell.Utility\Write-Verbose 'Column data retrieval completed successfully'
    }
}