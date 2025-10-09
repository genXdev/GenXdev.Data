<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : Get-SQLiteSchema.ps1
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
Retrieves the complete schema information from a SQLite database.

.DESCRIPTION
This function queries the sqlite_master table to obtain the complete schema
definition of a SQLite database, including tables, views, indexes and triggers.
It accepts either a connection string or a direct path to the database file.

.PARAMETER ConnectionString
The SQLite connection string that specifies the database location and any
additional connection parameters.

.PARAMETER DatabaseFilePath
The direct filesystem path to the SQLite database file.

.EXAMPLE
Get-SQLiteSchema -DatabaseFilePath "C:\Databases\inventory.db"

.EXAMPLE
Get-SQLiteSchema -ConnectionString "Data Source=C:\Databases\inventory.db;Version=3;"
#>
function Get-SQLiteSchema {

    [CmdletBinding(DefaultParameterSetName = 'Default')]

    param (
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database.'
        )]
        [string]$ConnectionString,

        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file.'
        )]
        [string]$DatabaseFilePath
    )

    begin {

        # output verbose information about the selected parameter set
        Microsoft.PowerShell.Utility\Write-Verbose "Using parameter set: $($PSCmdlet.ParameterSetName)"
    }


    process {

        # prepare the query to retrieve the complete database schema
        $PSBoundParameters['Queries'] = 'SELECT * FROM sqlite_master'

        # execute the schema query using the existing Invoke-SQLiteQuery function
        GenXdev.Data\Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
    }
}