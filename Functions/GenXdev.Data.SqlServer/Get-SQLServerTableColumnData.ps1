<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : Get-SQLServerTableColumnData.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
################################################################################>
###############################################################################
<#
.SYNOPSIS
Retrieves data from a specific column in a SQL database table.

.DESCRIPTION
This function provides a convenient way to extract data from a single column in a
SQL database table. It supports two connection methods: direct database file
path or connection string. The function includes options to limit the number of
returned records and uses proper SQL query construction for optimal
performance.

.PARAMETER ConnectionString
The connection string to connect to the SQL database. This parameter is
mutually exclusive with DatabaseFilePath.

.PARAMETER DatabaseFilePath
The file path to the SQL database file. This parameter is mutually exclusive
with ConnectionString.

.PARAMETER TableName
The name of the table from which to retrieve the column data.

.PARAMETER ColumnName
The name of the column whose data should be retrieved.

.PARAMETER Count
The maximum number of records to return. Default is 100. Use -1 to return all
records without limit.

.EXAMPLE
Get-SQLServerTableColumnData -DatabaseFilePath "C:\MyDb.sqlite" `
    -TableName "Employees" `
    -ColumnName "Email" `
    -Count 10

.EXAMPLE
Get-SQLServerTableColumnData "C:\MyDb.sqlite" "Employees" "Email"
#>
function Get-SQLServerTableColumnData {

    [CmdletBinding(DefaultParameterSetName = 'DatabaseName')]
    param (
        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQL Server database'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ConnectionString,
        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The name of the SQL Server database'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $DatabaseName,
        ###############################################################################
        [Parameter(
            Position = 1,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The SQL Server instance name'
        )]
        [string] $Server = 'localhost',
        ###############################################################################
        [Parameter(
            Position = 2,
            Mandatory = $true,
            HelpMessage = 'The name of the table to query'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $TableName,
        ###############################################################################
        [Parameter(
            Position = 3,
            Mandatory = $true,
            HelpMessage = 'The name of the column to retrieve'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ColumnName,
        ###############################################################################
        [Parameter(
            Position = 4,
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

        # prepare parameters for Invoke-SQLServerQuery and execute the query
        $PSBoundParameters['Queries'] = $query
        GenXdev.Data\Invoke-SQLServerQuery @PSBoundParameters
    }

    end {

        # log completion of the operation
        Microsoft.PowerShell.Utility\Write-Verbose 'Column data retrieval completed successfully'
    }
}