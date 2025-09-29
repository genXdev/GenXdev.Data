<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : Invoke-SQLiteQuery.ps1
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
Executes one or more SQL queries against a SQLite database with transaction support.

.DESCRIPTION
Executes SQL queries against a SQLite database with parameter support and
configurable transaction isolation. Can use an external transaction for batch
operations or create its own internal transaction. When using an external
transaction, the caller is responsible for committing/rolling back.
Connection priority: Transaction > ConnectionString > DatabaseFilePath.

.PARAMETER ConnectionString
The SQLite connection string for database access. Used if no Transaction is provided.

.PARAMETER DatabaseFilePath
The file path to the SQLite database. Will be converted to a connection string.
Used if no Transaction or ConnectionString is provided.

.PARAMETER Transaction
An existing SQLite transaction to use. When provided, the function will not
commit or rollback the transaction - that's the caller's responsibility.
Takes priority over ConnectionString and DatabaseFilePath.

.PARAMETER Queries
One or more SQL queries to execute. Can be passed via pipeline.

.PARAMETER SqlParameters
Optional parameters for the queries as hashtables. Format: @{"param"="value"}

.PARAMETER IsolationLevel
Transaction isolation level. Defaults to ReadCommitted. Only used when creating
an internal transaction.

.EXAMPLE
Invoke-SQLiteQuery -DatabaseFilePath "C:\data.db" -Queries "SELECT * FROM Users"

.EXAMPLE
"SELECT * FROM Users" | isql "C:\data.db" @{"UserId"=1}

.EXAMPLE
Batch operations using external transaction
$tx = Get-SQLiteTransaction -DatabaseFilePath "C:\data.db"
try {
    Invoke-SQLiteQuery -Transaction $tx -Queries "INSERT INTO Users VALUES (@name)" -SqlParameters @{"name"="John"}
    Invoke-SQLiteQuery -Transaction $tx -Queries "UPDATE Users SET active=1 WHERE name=@name" -SqlParameters @{"name"="John"}
    $tx.Commit()
} catch {
    $tx.Rollback()
    throw
} finally {
    $tx.Connection.Close()
}
#>
function Invoke-SQLiteQuery {

    [CmdletBinding()]

    param (
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            HelpMessage = 'The connection string to the SQLite database.'
        )]
        [string]$ConnectionString,

        ###########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = 'The path to the SQLite database file.'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('dbpath', 'indexpath')]
        [string]$DatabaseFilePath,

        ###########################################################################
        [Parameter(
            Position = 2,
            Mandatory = $false,
            HelpMessage = 'An existing SQLite transaction to use for the queries.'
        )]
        [ValidateScript({
                if ($null -eq $_) { return $true }
                try {
                    return $_.GetType().FullName -eq 'System.Data.Sqlite.SQLiteTransaction'
                }
                catch {
                    # Assembly may not be loaded yet during module import
                    return $true
                }
            })]
        [object]$Transaction,

        ###########################################################################
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory,
            Position = 3,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'The query or queries to execute.'
        )]
        [string[]]$Queries,

        ###########################################################################
        [Alias('data', 'parameters', 'args')]
        [parameter(
            Position = 4,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'Query parameters as hashtables.'
        )]
        [System.Collections.Hashtable[]]$SqlParameters = @(),

        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The isolation level to use. default is ReadCommitted.'
        )]
        [ValidateSet('ReadCommitted', 'ReadUncommitted', 'RepeatableRead', 'Serializable', 'Snapshot', 'Chaos')]
        [string]$IsolationLevel = "ReadCommitted"
    )

    begin {
        # load SQLite client assembly
        GenXdev.Helpers\EnsureNuGetAssembly -PackageKey 'System.Data.Sqlite'

        # determine connection source priority: Transaction > ConnectionString > DatabaseFilePath
        if ($null -ne $Transaction) {
            $connection = $Transaction.Connection
            $transaction = $Transaction
            $isExternalTransaction = $true
            Microsoft.PowerShell.Utility\Write-Verbose 'Using external transaction'
        }
        elseif (-not [String]::IsNullOrWhiteSpace($ConnectionString)) {
            $connString = $ConnectionString
            $isExternalTransaction = $false
            Microsoft.PowerShell.Utility\Write-Verbose "Will create internal transaction with connection string: $connString"
        }
        elseif (-not [String]::IsNullOrWhiteSpace($DatabaseFilePath)) {
            $connString = "Data Source=$((GenXdev.FileSystem\Expand-Path $DatabaseFilePath))"
            $isExternalTransaction = $false
            Microsoft.PowerShell.Utility\Write-Verbose "Will create internal transaction with database file: $DatabaseFilePath"
        }
        else {
            throw 'You must provide either a Transaction, ConnectionString, or DatabaseFilePath parameter.'
        }
    }

    process {
        try {
            # establish database connection and transaction if not using external
            if (-not $isExternalTransaction) {
                $connection = Microsoft.PowerShell.Utility\New-Object System.Data.Sqlite.SQLiteConnection($connString)
                $connection.Open()

                # begin transaction with specified isolation
                $transaction = $connection.BeginTransaction($IsolationLevel)
                Microsoft.PowerShell.Utility\Write-Verbose "Started internal transaction with $IsolationLevel isolation"
            }

            # ensure parameters array exists
            $SqlParameters = if ($SqlParameters) { $SqlParameters } else { @() }

            try {
                $idx = -1

                # process each query
                $Queries | Microsoft.PowerShell.Core\ForEach-Object {

                    $idx++
                    Microsoft.PowerShell.Utility\Write-Verbose "Executing query $($idx + 1) of $($Queries.Count)"

                    # get parameter set for current query
                    [System.Collections.Hashtable] $data = if ($SqlParameters.Length -gt $idx) {
                        $SqlParameters[[Math]::Min($idx, $SqlParameters.Count - 1)]
                    }
                    else {
                        $null
                    }

                    # prepare command
                    $command = $connection.CreateCommand()
                    $command.CommandText = $PSItem
                    $command.Transaction = $transaction

                    # add parameters if provided
                    if ($null -ne $data) {
                        $data.GetEnumerator() | Microsoft.PowerShell.Core\ForEach-Object {
                            $value = $PSItem.Value

                            $null = $command.Parameters.AddWithValue(
                                '@' + $PSItem.Key,
                                $value
                            )
                        }
                    }

                    # execute and read results
                    $reader = $command.ExecuteReader()

                    while ($reader.Read()) {
                        $record = @{}
                        for ($i = 0; $i -lt $reader.FieldCount; $i++) {
                            $name = $reader.GetName($i)
                            $value = $reader.GetValue($i)
                            $record[$name] = $value
                        }
                        Microsoft.PowerShell.Utility\Write-Output $record
                    }

                    $reader.Close()
                }

                # only commit if we created the transaction internally
                if (-not $isExternalTransaction) {
                    $transaction.Commit()
                    Microsoft.PowerShell.Utility\Write-Verbose 'Internal transaction committed successfully'
                }
            }
            catch {
                # only rollback if we created the transaction internally
                if (-not $isExternalTransaction) {
                    $transaction.Rollback()
                    Microsoft.PowerShell.Utility\Write-Verbose 'Internal transaction rolled back due to error'
                }
                throw $_
            }
            finally {
                if ($null -ne $reader) { $reader.Close() }

                # only close connection if we created it internally
                if (-not $isExternalTransaction) {
                    $connection.Close()
                    Microsoft.PowerShell.Utility\Write-Verbose 'Internal connection closed'
                }
            }
        }
        catch {
            throw $_
        }
    }

    end {
    }
}