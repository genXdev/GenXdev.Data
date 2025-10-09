<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : Invoke-SQLiteStudio.ps1
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