<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : Get-SQLServerTableSchema.ps1
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
Retrieves the schema information for a specified SQL Server table.

.DESCRIPTION
This function queries the SQL Server database to get detailed schema information for
a specified table. It uses the SQL Server INFORMATION_SCHEMA.COLUMNS view to return
column definitions including names, types, nullable status, and default values.

.PARAMETER ConnectionString
Specifies the SQL Server connection string in the format:
"Server=servername;Database=databasename;Integrated Security=true"

.PARAMETER DatabaseName
Specifies the name of the SQL Server database.

.PARAMETER Server
Specifies the SQL Server instance name. Defaults to 'localhost'.

.PARAMETER TableName
Specifies the name of the table for which to retrieve schema information.

.EXAMPLE
Get-SQLServerTableSchema -DatabaseName "mydb" -Server "localhost" `
    -TableName "Users"

.EXAMPLE
Get-SQLServerTableSchema -ConnectionString "Server=localhost;Database=mydb;Integrated Security=true" `
    -TableName "Products"
#>
function Get-SQLServerTableSchema {

    [CmdletBinding(DefaultParameterSetName = 'DatabaseName')]
    param (
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQL Server database'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ConnectionString,

        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The name of the SQL Server database'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$DatabaseName,

        ###########################################################################
        [Parameter(
            Position = 1,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The SQL Server instance name'
        )]
        [string]$Server = '.',

        ###########################################################################
        [Parameter(
            Position = 2,
            Mandatory = $true,
            HelpMessage = 'The name of the table'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$TableName
    )

    begin {

        # log the start of schema retrieval operation
        Microsoft.PowerShell.Utility\Write-Verbose "Preparing to retrieve schema for table '$TableName'"
    }


    process {

        # construct the INFORMATION_SCHEMA query to get detailed table column information
        $PSBoundParameters['Queries'] = @"
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE,
    ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = '$TableName'
ORDER BY ORDINAL_POSITION
"@

        # log the execution of the schema query
        Microsoft.PowerShell.Utility\Write-Verbose 'Executing schema query against SQL Server database'

        # execute the query and return results using existing Invoke-SQLServerQuery
        GenXdev.Data\Invoke-SQLServerQuery @PSBoundParameters
    }

    end {
    }
}