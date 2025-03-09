################################################################################
<#
.SYNOPSIS
Executes one or more SQL queries against a SQLite database with transaction support.

.DESCRIPTION
Executes SQL queries against a SQLite database with parameter support and
configurable transaction isolation. All queries run in a single transaction that
rolls back on error. Supports both connection strings and database file paths.

.PARAMETER ConnectionString
The SQLite connection string for database access.

.PARAMETER DatabaseFilePath
The file path to the SQLite database. Will be converted to a connection string.

.PARAMETER Queries
One or more SQL queries to execute. Can be passed via pipeline.

.PARAMETER SqlParameters
Optional parameters for the queries as hashtables. Format: @{"param"="value"}

.PARAMETER IsolationLevel
Transaction isolation level. Defaults to ReadCommitted.

.EXAMPLE
Invoke-SQLiteQuery -DatabaseFilePath "C:\data.db" -Queries "SELECT * FROM Users"

.EXAMPLE
"SELECT * FROM Users" | isql "C:\data.db" @{"UserId"=1}
#>
function Invoke-SQLiteQuery {

    [CmdletBinding(DefaultParameterSetName = "Default")]

    param (
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database.'
        )]
        [string]$ConnectionString,

        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file.'
        )]
        [string]$DatabaseFilePath,

        ###########################################################################
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory,
            Position = 1,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'The query or queries to execute.'
        )]
        [string[]]$Queries,

        ###########################################################################
        [Alias("data", "parameters", "args")]
        [parameter(
            Position = 1,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'Query parameters as hashtables.'
        )]
        [System.Collections.Hashtable[]]$SqlParameters = @(),

        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Transaction isolation level.'
        )]
        [System.Data.IsolationLevel]$IsolationLevel = [System.Data.IsolationLevel]::ReadCommitted
    )

    begin {
        # initialize connection string from file path if provided
        $connString = [String]::IsNullOrWhiteSpace($DatabaseFilePath) `
            ? $ConnectionString `
            : "Data Source=$((GenXdev.FileSystem\Expand-Path $DatabaseFilePath))"

        Write-Verbose "Opening SQLite connection..."
    }

    process {

        try {
            # establish database connection
            $connection = New-Object System.Data.SQLite.SQLiteConnection($connString)
            $connection.Open()

            # begin transaction with specified isolation
            $transaction = $connection.BeginTransaction($IsolationLevel)
            Write-Verbose "Started transaction with $IsolationLevel isolation"

            # ensure parameters array exists
            $SqlParameters = if ($SqlParameters) { $SqlParameters } else { @() }

            try {
                $idx = -1

                # process each query
                $Queries | ForEach-Object {

                    $idx++
                    Write-Verbose "Executing query $($idx + 1) of $($Queries.Count)"

                    # get parameter set for current query
                    $data = if ($SqlParameters.Length -gt 0) {
                        $SqlParameters[[Math]::Min($idx, $SqlParameters.Count - 1)]
                    }
                    else {
                        $null
                    }

                    # prepare command
                    $command = $connection.CreateCommand()
                    $command.CommandText = $PSItem

                    # add parameters if provided
                    if ($null -ne $data) {
                        $data.GetEnumerator() | ForEach-Object {
                            $null = $command.Parameters.AddWithValue(
                                "@" + $PSItem.Key,
                                $PSItem.Value
                            )
                        }
                    }

                    # execute and read results
                    $reader = $command.ExecuteReader()

                    while ($reader.Read()) {
                        $record = @{}
                        for ($i = 0; $i -lt $reader.FieldCount; $i++) {
                            $record[$reader.GetName($i)] = $reader.GetValue($i)
                        }
                        Write-Output $record
                    }
                }

                # commit if successful
                $transaction.Commit()
                Write-Verbose "Transaction committed successfully"
            }
            catch {
                # rollback on error
                $transaction.Rollback()
                Write-Verbose "Transaction rolled back due to error"
                throw $_
            }
            finally {
                if ($null -ne $reader) { $reader.Close() }
                $connection.Close()
                Write-Verbose "Connection closed"
            }
        }
        catch {
            throw $_
        }
    }

    end {
    }
}
################################################################################
