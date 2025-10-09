<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : Invoke-SSMS.ps1
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
Executes SQL Server database queries with support for parameters and transactions.

.DESCRIPTION
Provides a PowerShell interface for executing SQL Server queries with support for:
- Connection via connection string or database name with server
- Parameterized queries to prevent SQL injection
- Transaction isolation level control
- Multiple query execution in a single transaction
- Pipeline input for queries and parameters

.PARAMETER ConnectionString
The SQL Server connection string for connecting to the database.
Format: "Server=servername;Database=databasename;Integrated Security=true"

.PARAMETER DatabaseName
The name of the SQL Server database.

.PARAMETER Server
The SQL Server instance name. Defaults to 'localhost'.

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
Invoke-SSMS `
    -DatabaseName "users" -Server "localhost" `
    -Queries "SELECT * FROM Users WHERE active = @status" `
    -SqlParameters @{"status" = 1}

.EXAMPLE
"SELECT * FROM Users" | Invoke-SSMS -DatabaseName "users"
#>
function Invoke-SSMS {

    [CmdletBinding()]
    [Alias("ssms", "sqlservermanagementstudio")]
    param (
    )

    begin {

        EnsureSSMS
    }


    process {


    }

    end {
        $searchPath  = GenXdev.FileSystem\Find-Item `
             "${Env:ProgramFiles(x86)}\*SQL Server Management*\Ssms.exe",
             "${Env:ProgramFiles}\*SQL Server Management*\Ssms.exe" |
             Microsoft.PowerShell.Utility\Sort-Object LastWriteTime -Descending | Microsoft.PowerShell.Utility\Select-Object -First 1

        if (-not $searchPath) {
            Throw "SSMS not found after installation attempt."
        }

        & $searchPath
    }
}