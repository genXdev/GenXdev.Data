<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : Get-SQLServerSchema.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.296.2025
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