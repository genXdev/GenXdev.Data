<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : Get-SQLServerTables.ps1
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
Retrieves a list of table names from a SQL Server database.

.DESCRIPTION
Queries the SQL Server system tables to retrieve all user-defined table names
from a SQL Server database. Supports connecting via either a direct connection
string or a database name with server parameters. Returns the table names as a
collection of strings.

.PARAMETER ConnectionString
The full connection string to connect to the SQL Server database. Should include
the Server and Database parameters at minimum.

.PARAMETER DatabaseName
The name of the SQL Server database.

.PARAMETER Server
The SQL Server instance name. Defaults to 'localhost'.

.EXAMPLE
Get-SQLServerTables -DatabaseName "Inventory" -Server "localhost"
Returns all table names from the specified database

.EXAMPLE
Get-SQLServerTables -ConnectionString "Server=localhost;Database=Users;Integrated Security=true;"
Returns all table names using a custom connection string
##############################################################################
#>

function Get-SQLServerTables {
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
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
        [string]$Server = '.'
    )

    begin {

        # log the start of table retrieval operation
        Microsoft.PowerShell.Utility\Write-Verbose 'Starting SQL table name retrieval operation'
    }


    process {

        # define the query to get all table names from SQL Server system tables
        $PSBoundParameters['Queries'] = 'SELECT name FROM sys.tables ORDER BY name'

        # execute query using the inherited connection parameters
        Microsoft.PowerShell.Utility\Write-Verbose 'Executing query to retrieve table names'
        GenXdev.Data\Invoke-SQLServerQuery @PSBoundParameters
    }

    end {
    }
}