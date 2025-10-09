<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : Get-SQLServerTableData.ps1
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
Retrieves data from a SQL database table with optional record limiting.

.DESCRIPTION
This function queries data from a SQL database table using either a connection
string or database file path. It provides flexibility in connecting to the
database and controlling the amount of data retrieved through the Count parameter.

.PARAMETER ConnectionString
Specifies the SQL connection string in the format:
"Data Source=path_to_database_file"

.PARAMETER DatabaseFilePath
Specifies the full file system path to the SQL database file.

.PARAMETER TableName
Specifies the name of the table to query data from. The table must exist in the
database.

.PARAMETER Count
Specifies the maximum number of records to return. Default is 100.
Use -1 to return all records. Must be -1 or a positive integer.

.EXAMPLE
Get-SQLServerTableData -DatabaseFilePath "C:\data\users.db" -TableName "Employees" -Count 50

.EXAMPLE
Get-SQLServerTableData "C:\data\users.db" "Employees"
#>
function Get-SQLServerTableData {

    [CmdletBinding(DefaultParameterSetName = 'DatabaseName')]
    param (
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQL Server database.'
        )]
        [ValidateNotNullOrEmpty()]
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
            HelpMessage = 'The name of the table to query data from.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$TableName,

        ###########################################################################
        [Parameter(
            Position = 3,
            Mandatory = $false,
            HelpMessage = 'The maximum number of records to return. -1 for all.'
        )]
        [ValidateRange(-1, [int]::MaxValue)]
        [int]$Count = 100
    )

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Starting Get-SQLServerTableData for table: $TableName"
        Microsoft.PowerShell.Utility\Write-Verbose "Record limit set to: $(if($Count -eq -1){'unlimited'}else{$Count})"
    }


    process {

        # construct query based on whether we want all records or a limited set
        $query = if ($Count -eq -1) {
            "SELECT * FROM $TableName"
        }
        else {
            "SELECT * FROM $TableName LIMIT $Count"
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Executing query: $query"

        # add the constructed query to the parameter set for Invoke-SQLServerQuery
        $PSBoundParameters['Queries'] = $query

        # execute the query and return results through the SQL provider
        GenXdev.Data\Invoke-SQLServerQuery @PSBoundParameters
    }

    end {

        Microsoft.PowerShell.Utility\Write-Verbose "Completed querying table: $TableName"
    }
}