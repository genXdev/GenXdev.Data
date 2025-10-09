<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : Get-SQLiteViewSchema.ps1
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
Retrieves the SQL schema definition for a SQLite view.

.DESCRIPTION
This function queries the SQLite database's system tables to extract the SQL
definition of a specified view. It supports connecting via either a connection
string or direct database file path and returns the complete SQL schema that
defines the requested view.

.PARAMETER ConnectionString
The connection string used to connect to the SQLite database. This parameter is
mutually exclusive with DatabaseFilePath.

.PARAMETER DatabaseFilePath
The full path to the SQLite database file. This parameter is mutually exclusive
with ConnectionString.

.PARAMETER ViewName
The name of the view whose schema definition should be retrieved.

.EXAMPLE
Get-SQLiteViewSchema -DatabaseFilePath "C:\Databases\MyApp.sqlite" `
                    -ViewName "CustomerOrders"

#>
function Get-SQLiteViewSchema {

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    param (
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database.'
        )]
        [string]$ConnectionString,
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file.'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('dbpath', 'indexpath')]
        [string]$DatabaseFilePath,
        ###########################################################################
        [Parameter(
            Position = 1,
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

        # construct query to fetch the view definition from sqlite_master table
        $query = "SELECT sql FROM sqlite_master WHERE name = '$ViewName'"

        # log the query being executed
        Microsoft.PowerShell.Utility\Write-Verbose "Executing query: $query"

        # add the query to parameters and execute it using Invoke-SQLiteQuery
        $PSBoundParameters['Queries'] = $query
        GenXdev.Data\Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
    }
}