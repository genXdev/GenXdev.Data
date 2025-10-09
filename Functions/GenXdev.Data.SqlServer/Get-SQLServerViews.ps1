<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : Get-SQLServerViews.ps1
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
Retrieves a list of views from a SQL Server database.

.DESCRIPTION
Gets all view names from the specified SQL Server database. Returns an array
of view names that can be used for further database operations. The function
supports two parameter sets for flexibility: providing either a connection string
or a database name with server.

.PARAMETER ConnectionString
The connection string to connect to the SQL Server database. Use this when you
need to specify custom connection parameters.

.PARAMETER DatabaseName
The name of the SQL Server database.

.PARAMETER Server
The SQL Server instance name. Defaults to 'localhost'.

.EXAMPLE
Get-SQLServerViews -DatabaseName "MyDatabase" -Server "localhost"

.EXAMPLE
Get-SQLServerViews -ConnectionString "Server=localhost;Database=MyDatabase;Integrated Security=true;"
#>
function Get-SQLServerViews {

    [CmdletBinding(DefaultParameterSetName = 'DatabaseName')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    param (
        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQL Server database.'
        )]
        [string]$ConnectionString,
        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The name of the SQL Server database.'
        )]
        [string]$DatabaseName,
        ###############################################################################
        [Parameter(
            Position = 1,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The SQL Server instance name.'
        )]
        [string]$Server = '.'
    )

    begin {

        # log the start of the view retrieval process
        Microsoft.PowerShell.Utility\Write-Verbose 'Preparing to retrieve SQL views...'
    }


    process {

        # define the SQL query to retrieve all view names from SQL Server system tables
        $query = "SELECT name FROM sys.views ORDER BY name"

        # log the query being executed for troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose "Executing query: $query"

        # execute the query using existing parameter set and store in $PSBoundParameters
        $PSBoundParameters['Queries'] = $query

        # invoke the query and return results using parameter splatting
        GenXdev.Data\Invoke-SQLServerQuery @PSBoundParameters
    }

    end {
    }
}