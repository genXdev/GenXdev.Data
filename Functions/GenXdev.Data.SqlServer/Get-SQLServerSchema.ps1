<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : Get-SQLServerSchema.ps1
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
Retrieves the complete schema information from a SQL Server database.

.DESCRIPTION
This function queries SQL Server system tables and information schema to obtain
the complete schema definition of a SQL Server database, including tables, views,
indexes, stored procedures and other database objects. It accepts either a
connection string or database name with server parameters.

.PARAMETER ConnectionString
The SQL Server connection string that specifies the database location and any
additional connection parameters.

.PARAMETER DatabaseName
The name of the SQL Server database.

.PARAMETER Server
The SQL Server instance name. Defaults to 'localhost'.

.EXAMPLE
Get-SQLServerSchema -DatabaseName "inventory" -Server "localhost"

.EXAMPLE
Get-SQLServerSchema -ConnectionString "Server=localhost;Database=inventory;Integrated Security=true;"
#>
function Get-SQLServerSchema {

    [CmdletBinding(DefaultParameterSetName = 'DatabaseName')]

    param (
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQL Server database.'
        )]
        [string]$ConnectionString,

        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The name of the SQL Server database.'
        )]
        [string]$DatabaseName,

        ########################################################################
        [Parameter(
            Position = 1,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The SQL Server instance name.'
        )]
        [string]$Server = 'localhost'
    )

    begin {

        # output verbose information about the selected parameter set
        Microsoft.PowerShell.Utility\Write-Verbose "Using parameter set: $($PSCmdlet.ParameterSetName)"
    }


    process {

        # prepare comprehensive schema queries for SQL Server
        $schemaQueries = @(
            "SELECT 'TABLE' as object_type, name, schema_id, object_id FROM sys.tables ORDER BY name",
            "SELECT 'VIEW' as object_type, name, schema_id, object_id FROM sys.views ORDER BY name",
            "SELECT 'PROCEDURE' as object_type, name, schema_id, object_id FROM sys.procedures ORDER BY name",
            "SELECT 'FUNCTION' as object_type, name, schema_id, object_id FROM sys.objects WHERE type IN ('FN','IF','TF') ORDER BY name"
        )

        $PSBoundParameters['Queries'] = $schemaQueries

        # execute the schema queries using the existing Invoke-SQLServerQuery function
        GenXdev.Data\Invoke-SQLServerQuery @PSBoundParameters
    }

    end {
    }
}