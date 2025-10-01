<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : Get-SQLiteTableSchema.ps1
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
Retrieves the schema information for a specified SQLite table.

.DESCRIPTION
This function queries the SQLite database to get detailed schema information for
a specified table. It uses the SQLite PRAGMA table_info command to return column
definitions including names, types, nullable status, and default values.

.PARAMETER ConnectionString
Specifies the SQLite connection string in the format:
"Data Source=path_to_database_file"

.PARAMETER DatabaseFilePath
Specifies the direct file path to the SQLite database file. This is converted
internally to a connection string.

.PARAMETER TableName
Specifies the name of the table for which to retrieve schema information.

.EXAMPLE
Get-SQLiteTableSchema -DatabaseFilePath "C:\Databases\mydb.sqlite" `
    -TableName "Users"

.EXAMPLE
Get-SQLiteTableSchema -ConnectionString "Data Source=C:\Databases\mydb.sqlite" `
    -TableName "Products"
#>
function Get-SQLiteTableSchema {

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    param (
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ConnectionString,

        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('dbpath', 'indexpath')]
        [string]$DatabaseFilePath,

        ###########################################################################
        [Parameter(
            Position = 1,
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

        # construct the PRAGMA query to get detailed table column information
        $PSBoundParameters['Queries'] = "PRAGMA table_info($TableName)"

        # log the execution of the schema query
        Microsoft.PowerShell.Utility\Write-Verbose 'Executing schema query against SQLite database'

        # execute the query and return results using existing Invoke-SQLiteQuery
        GenXdev.Data\Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
    }
}