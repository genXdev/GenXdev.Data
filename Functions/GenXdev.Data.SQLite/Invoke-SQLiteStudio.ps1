<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : Invoke-SQLiteStudio.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.288.2025
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
Executes SQLite database queries with support for parameters and transactions.

.DESCRIPTION
Provides a PowerShell interface for executing SQLite queries with support for:
- Connection via connection string or database file path
- Parameterized queries to prevent SQL injection
- Transaction isolation level control
- Multiple query execution in a single transaction
- Pipeline input for queries and parameters

.PARAMETER ConnectionString
The SQLite connection string for connecting to the database.
Format: "Data Source=mydb.sqlite"

.PARAMETER DatabaseFilePath
The direct file system path to the SQLite database file.

.PARAMETER Queries
One or more SQL queries to execute. Can be provided via pipeline.
Each query can be parameterized using @parameter notation.

.PARAMETER SqlParameters
Hashtable of parameters to use in queries. Format: @{"param" = "value"}
Multiple parameter sets can be provided for multiple queries.

.PARAMETER IsolationLevel
Controls the transaction isolation. Default is ReadCommitted.
Available levels: ReadUncommitted, ReadCommitted, RepeatableRead, Serializable

.EXAMPLE
Invoke-SQLiteStudio `
    -DatabaseFilePath "C:\data\users.sqlite" `
    -Queries "SELECT * FROM Users WHERE active = @status" `
    -SqlParameters @{"status" = 1}

.EXAMPLE
"SELECT * FROM Users" | isql -DatabaseFilePath "C:\data\users.sqlite"
#>
function Invoke-SQLiteStudio {

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
        [Alias('q', 'Name', 'Text', 'Query')]
        [Parameter(
            Mandatory = $true,
            Position = 1,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The query to execute.'
        )]
        [string[]]$Queries,

        ###########################################################################
        [Alias('parameters')]
        [Parameter(
            Mandatory = $false,
            Position = 2,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'Optional parameters for the query.'
        )]
        [System.Collections.Hashtable[]]$SqlParameters,

        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The isolation level to use. Default is ReadCommitted.'
        )]
        [ValidateSet('ReadCommitted', 'ReadUncommitted', 'RepeatableRead', 'Serializable', 'Snapshot', 'Chaos')]
        [string]$IsolationLevel = "ReadCommitted"
    )

    begin {
        # log initialization of sqlite connection handling
        Microsoft.PowerShell.Utility\Write-Verbose 'Initializing SQLite query execution environment'
    }


    process {

        # log the start of query processing
        Microsoft.PowerShell.Utility\Write-Verbose "Processing $($Queries.Count) queries with isolation level: $IsolationLevel"
    }

    end {
    }
}