<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : Get-SQLiteViews.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.290.2025
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
Retrieves a list of views from a SQLite database.

.DESCRIPTION
Gets all view names from the specified SQLite database file or connection string.
Returns an array of view names that can be used for further database operations.
The function supports two parameter sets for flexibility: providing either a
connection string or a direct path to the database file.

.PARAMETER ConnectionString
The connection string to connect to the SQLite database. Use this when you need
to specify custom connection parameters.

.PARAMETER DatabaseFilePath
The full path to the SQLite database file. Use this for simple file-based
connections.

.EXAMPLE
Get-SQLiteViews -DatabaseFilePath "C:\Databases\MyDatabase.sqlite"

.EXAMPLE
s -ConnectionString "Data Source=C:\Databases\MyDatabase.sqlite;Version=3;"
#>
function Get-SQLiteViews {

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    param (
        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database.'
        )]
        [string]$ConnectionString,
        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file.'
        )]
        [string]$DatabaseFilePath
    )

    begin {

        # log the start of the view retrieval process
        Microsoft.PowerShell.Utility\Write-Verbose 'Preparing to retrieve SQLite views...'
    }


    process {

        # define the SQL query to retrieve all view names from sqlite_master
        $query = "SELECT name FROM sqlite_master WHERE type='view'"

        # log the query being executed for troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose "Executing query: $query"

        # execute the query using existing parameter set and store in $PSBoundParameters
        $PSBoundParameters['Queries'] = $query

        # invoke the query and return results using parameter splatting
        GenXdev.Data\Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
    }
}