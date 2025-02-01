#######################################################################################
<#
.SYNOPSIS
    Execute a query against a SQLite database.

.DESCRIPTION
    Execute a query against a SQLite database with support for parameters and with a
    configurable transaction isolation level.

    All queries are executed within the same transaction.
    If an error occurs, the transaction is rollbacked and the error is thrown.

.PARAMETER ConnectionString
    The connection string to the SQLite database.

.PARAMETER DatabaseFilePath
    The path to the SQLite database file.

.PARAMETER Queries
    The query or queries to execute.
#>
function Invoke-SqlLiteQuery {

    [CmdletBinding(DefaultParameterSetName = "Default")]

    param (

        ###############################################################################

        [Parameter(
            Position = 0,
            Mandatory,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database.'
        )]
        [string]$ConnectionString,

        ###############################################################################

        [Parameter(
            Position = 0,
            Mandatory,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file.'
        )]
        [string]$DatabaseFilePath,

        ###############################################################################

        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory,
            Position = 1,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'The query to execute.'
        )]
        [string[]] $Queries,

        ###############################################################################

        [Alias("data", "parameters", "args")]
        [parameter(
            Position = 1,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'Optional parameters for the query. like @{"Id" = 1; "Name" = "John"}'
        )]
        [System.Collections.Hashtable[]] $SqlParameters = @(),

        ###############################################################################

        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The isolation level to use. default is ReadCommitted.'
        )]
        [System.Data.IsolationLevel]$IsolationLevel = [System.Data.IsolationLevel]::ReadCommitted
    )

    try {

        $ConnectionString = [String]::IsNullOrWhiteSpace($DatabaseFilePath) ? $ConnectionString : "Data Source=$((Expand-Path $DatabaseFilePath))"
        $connection = New-Object System.Data.SQLite.SQLiteConnection($connectionString)
        $connection.Open()
        $transaction = $connection.BeginTransaction($IsolationLevel);
        $SqlParameters = if ($SqlParameters) { $SqlParameters } else { @() }

        try {
            $idx = -1;
            $Queries | ForEach-Object {

                $idx++;

                # take none or the next or the last one supplied
                $data = if ($SqlParameters.Length -gt 0) { $SqlParameters[[Math]::Min($idx, $SqlParameters.Count - 1)] } else { $null }

                $command = $connection.CreateCommand()
                $command.CommandText = $PSItem

                if ($null -ne $data) {

                    $data.GetEnumerator() | ForEach-Object {

                        $command.Parameters.AddWithValue("@" + $PSItem.Key, $PSItem.Value) | Out-Null
                    }
                }

                $reader = $command.ExecuteReader()

                while ($reader.Read()) {

                    $record = @{}

                    for ($i = 0; $i -lt $reader.FieldCount; $i++) {

                        $record[$reader.GetName($i)] = $reader.GetValue($i)
                    }

                    Write-Output $record
                }
            }

            $transaction.Commit();
        }
        catch {
            $transaction.Rollback()
            throw $_
        }
        finally {
            if ($null -ne $reader) { $reader.Close() }
            $connection.Close()
        }
    }
    catch {
        throw $_
    }
}
