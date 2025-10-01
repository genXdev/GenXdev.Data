<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : Get-SQLServerViewData.ps1
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
Retrieves data from a SQL database view with optional record limiting.

.DESCRIPTION
Queries a SQL database view using either a connection string or database file
path. The function supports limiting the number of returned records and provides
verbose output for tracking query execution.

.PARAMETER ConnectionString
The connection string to connect to the SQL database. This parameter is
mutually exclusive with DatabaseFilePath.

.PARAMETER DatabaseFilePath
The file path to the SQL database file. This parameter is mutually exclusive
with ConnectionString.

.PARAMETER ViewName
The name of the view from which to retrieve data.

.PARAMETER Count
The maximum number of records to return. Use -1 to return all records.
Defaults to 100 if not specified.

.EXAMPLE
Get-SQLServerViewData -DatabaseFilePath "C:\MyDb.sqlite" `
    -ViewName "CustomerView" `
    -Count 50

.EXAMPLE
Get-SQLServerViewData "C:\MyDb.sqlite" "CustomerView"
#>
function Get-SQLServerViewData {

    [CmdletBinding(DefaultParameterSetName = 'DatabaseName')]
    param (
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQL Server database.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ConnectionString,

        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The name of the SQL Server database.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$DatabaseName,

        ########################################################################
        [Parameter(
            Position = 1,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The SQL Server instance name.'
        )]
        [string]$Server = 'localhost',

        ########################################################################
        [Parameter(
            Position = 2,
            Mandatory = $true,
            HelpMessage = 'The name of the view to query.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ViewName,

        ########################################################################
        [Parameter(
            Position = 3,
            Mandatory = $false,
            HelpMessage = 'Number of records to return. -1 for all records.'
        )]
        [ValidateRange(-1, [int]::MaxValue)]
        [int]$Count = 100
    )

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Starting Get-SQLServerViewData for view: $ViewName"
    }


    process {

        # construct query with optional record limit
        $query = if ($Count -eq -1) {
            "SELECT * FROM $ViewName"
        }
        else {
            "SELECT * FROM $ViewName LIMIT $Count"
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Executing query: $query"

        # prepare parameters for Invoke-SQLServerQuery
        $PSBoundParameters['Queries'] = $query

        # execute query and return results
        GenXdev.Data\Invoke-SQLServerQuery @PSBoundParameters
    }

    end {

        Microsoft.PowerShell.Utility\Write-Verbose "Completed querying view: $ViewName"
    }
}