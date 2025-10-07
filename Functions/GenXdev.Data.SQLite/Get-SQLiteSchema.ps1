<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : Get-SQLiteSchema.ps1
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