<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : Get-SQLiteTables.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.292.2025
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