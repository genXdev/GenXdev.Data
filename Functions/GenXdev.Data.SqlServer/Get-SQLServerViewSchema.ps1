<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : Get-SQLServerViewSchema.ps1
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
Retrieves the SQL schema definition for a SQL Server view.

.DESCRIPTION
This function queries the SQL Server database's system tables to extract the SQL
definition of a specified view. It supports connecting via either a connection
string or database name with server parameters and returns the complete SQL schema
that defines the requested view.

.PARAMETER ConnectionString
The connection string used to connect to the SQL Server database. This parameter is
mutually exclusive with DatabaseName.

.PARAMETER DatabaseName
The name of the SQL Server database. This parameter is mutually exclusive with
ConnectionString.

.PARAMETER Server
The SQL Server instance name. Defaults to 'localhost'.

.PARAMETER ViewName
The name of the view whose schema definition should be retrieved.

.EXAMPLE
Get-SQLServerViewSchema -DatabaseFilePath "C:\Databases\MyApp.sqlite" `
                    -ViewName "CustomerOrders"

#>
function Get-SQLServerViewSchema {

    [CmdletBinding(DefaultParameterSetName = 'DatabaseName')]
    param (
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQL Server database.'
        )]
        [string]$ConnectionString,
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The name of the SQL Server database.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$DatabaseName,
        ###########################################################################
        [Parameter(
            Position = 1,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The SQL Server instance name.'
        )]
        [string]$Server = 'localhost',
        ###########################################################################
        [Parameter(
            Position = 2,
            Mandatory = $true,
            HelpMessage = 'The name of the view.'
        )]
        [string]$ViewName
    )

    begin {

        # log the start of view schema retrieval
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving schema for view: $ViewName"
    }


    process {

        # construct query to fetch the view definition from SQL Server system views
        $query = "SELECT OBJECT_DEFINITION(OBJECT_ID('$ViewName')) AS view_definition"

        # log the query being executed
        Microsoft.PowerShell.Utility\Write-Verbose "Executing query: $query"

        # add the query to parameters and execute it using Invoke-SQLServerQuery
        $PSBoundParameters['Queries'] = $query
        GenXdev.Data\Invoke-SQLServerQuery @PSBoundParameters
    }

    end {
    }
}