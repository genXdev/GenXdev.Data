<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : Get-SQLiteTables.ps1
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
Retrieves a list of table names from a SQLite database.

.DESCRIPTION
Queries the sqlite_master system table to retrieve all user-defined table names
from a SQLite database. Supports connecting via either a direct connection string
or a database file path. Returns the table names as a collection of strings.

.PARAMETER ConnectionString
The full connection string to connect to the SQLite database. Should include the
Data Source and Version parameters at minimum.

.PARAMETER DatabaseFilePath
The full filesystem path to the SQLite database file. The function will create
an appropriate connection string internally.

.EXAMPLE
Get-SQLiteTables -DatabaseFilePath "C:\Databases\Inventory.sqlite"
Returns all table names from the specified database file

.EXAMPLE
Get-SQLiteTables -ConnectionString "Data Source=C:\DB\Users.sqlite;Version=3;"
Returns all table names using a custom connection string
##############################################################################
#>

function Get-SQLiteTables {
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
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
        [string]$DatabaseFilePath
    )

    begin {

        # log the start of table retrieval operation
        Microsoft.PowerShell.Utility\Write-Verbose 'Starting SQLite table name retrieval operation'
    }


    process {

        # define the query to get all table names from sqlite_master
        $PSBoundParameters['Queries'] = 'SELECT name FROM sqlite_master ' +
        "WHERE type='table'"

        # execute query using the inherited connection parameters
        Microsoft.PowerShell.Utility\Write-Verbose 'Executing query to retrieve table names'
        GenXdev.Data\Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
    }
}