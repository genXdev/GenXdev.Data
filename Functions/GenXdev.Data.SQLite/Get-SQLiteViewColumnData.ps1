<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : Get-SQLiteViewColumnData.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.290.2025
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
Retrieves column data from a SQLite view with optional record limiting.

.DESCRIPTION
Executes a SELECT query against a specified SQLite view to retrieve data from a
single column. Supports connecting via either a connection string or database file
path. Allows limiting the number of returned records or retrieving all records.

.PARAMETER ConnectionString
The SQLite database connection string. This parameter is mutually exclusive with
DatabaseFilePath.

.PARAMETER DatabaseFilePath
The full path to the SQLite database file. This parameter is mutually exclusive
with ConnectionString.

.PARAMETER ViewName
The name of the SQLite view to query data from.

.PARAMETER ColumnName
The name of the column within the view to retrieve data from.

.PARAMETER Count
The maximum number of records to return. Use -1 to return all records. Defaults
to 100 if not specified.

.EXAMPLE
Get-SQLiteViewColumnData -DatabaseFilePath "C:\MyDB.sqlite" `
    -ViewName "CustomersView" `
    -ColumnName "Email" `
    -Count 50

.EXAMPLE
Get-SQLiteViewColumnData "C:\MyDB.sqlite" "CustomersView" "Email"
#>
function Get-SQLiteViewColumnData {

    [CmdletBinding(DefaultParameterSetName = 'Default')]
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
        [Alias('dbpath', 'indexpath')]
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

        # log the start of the operation
        Microsoft.PowerShell.Utility\Write-Verbose "Starting Get-SQLiteViewColumnData for view '$ViewName'"
    }


    process {

        # determine if we need to limit the results or get all records
        if ($Count -eq -1) {
            # construct query to get all records
            $PSBoundParameters['Queries'] = "SELECT $ColumnName FROM $ViewName"
            Microsoft.PowerShell.Utility\Write-Verbose "Querying all records from view '$ViewName'"
        }
        else {
            # construct query with LIMIT clause
            $PSBoundParameters['Queries'] = "SELECT $ColumnName FROM $ViewName LIMIT $Count"
            Microsoft.PowerShell.Utility\Write-Verbose "Querying $Count records from view '$ViewName'"
        }

        # execute the query using the existing Invoke-SQLiteQuery cmdlet
        GenXdev.Data\Invoke-SQLiteQuery @PSBoundParameters
    }

    end {

        # log completion of the operation
        Microsoft.PowerShell.Utility\Write-Verbose "Completed Get-SQLiteViewColumnData for view '$ViewName'"
    }
}