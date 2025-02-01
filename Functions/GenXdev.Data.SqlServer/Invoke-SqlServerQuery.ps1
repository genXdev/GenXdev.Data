#######################################################################################
<#
.SYNOPSIS
    Execute a query against a SqlServer database.

.DESCRIPTION
    Execute a query against a SqlServer database with support for parameters and with a
    configurable transaction isolation level.

    All queries are executed within the same transaction.
    If an error occurs, the transaction is rollbacked and the error is thrown.

.PARAMETER ConnectionString
    The connection string to the SqlServer database.

.PARAMETER FilePath
    The path to the SqlServer database file.

.PARAMETER Queries
    The query or queries to execute.
#>
function Invoke-SqlServerQuery {

    [CmdletBinding(DefaultParameterSetName = "Default")]

    param (

        ###############################################################################

        [Parameter(
            ParameterSetName = 'ConnectionString',
            Position = 0,
            Mandatory,
            HelpMessage = 'The connection string to the SqlServer database.'
        )]
        [string]$ConnectionString,

        ###############################################################################

        [Parameter(
            ParameterSetName = 'HostNameWithCredentials',
            Position = 0,
            Mandatory,
            HelpMessage = 'The hostName of SqlServer'
        )]
        [Parameter(
            ParameterSetName = 'HostNameWithUsernameAndPassword',
            Position = 0,
            Mandatory,
            HelpMessage = 'The hostName of SqlServer'
        )]
        [Parameter(
            ParameterSetName = 'HostnameOnly',
            Position = 0,
            Mandatory,
            HelpMessage = 'The hostName of SqlServer'
        )]
        [string]$HostName = ".",

        ###############################################################################

        [Parameter(
            ParameterSetName = 'HostNameWithUsernameAndPassword',
            Position = 1,
            Mandatory,
            HelpMessage = 'The username for SqlServer'
        )]
        [string]$User,

        ###############################################################################

        [Parameter(
            ParameterSetName = 'HostNameWithUsernameAndPassword',
            Position = 2,
            Mandatory,
            HelpMessage = 'The password for SqlServer'
        )]
        [string]$Password,

        ###############################################################################

        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            ParameterSetName = 'HostNameWithUsernameAndPassword',
            Mandatory,
            Position = 3,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'The query to execute.'
        )]
        [parameter(
            ParameterSetName = 'HostNameWithCredentials',
            Mandatory,
            Position = 2,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'The query to execute.'
        )]
        [parameter(
            ParameterSetName = 'ConnectionString',
            Mandatory,
            Position = 1,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'The query to execute.'
        )]
        [parameter(
            ParameterSetName = 'HostnameOnly',
            Mandatory,
            Position = 1,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'The query to execute.'
        )]
        [parameter(
            ParameterSetName = 'Default',
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'The query to execute.'
        )]
        [string[]] $Queries,

        ###############################################################################
        [parameter(
            ParameterSetName = 'HostNameWithUsernameAndPassword',
            Mandatory,
            Position = 4,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'Optional parameters for the query. like @{"Id" = 1; "Name" = "John"}'
        )]
        [parameter(
            ParameterSetName = 'HostNameWithCredentials',
            Mandatory,
            Position = 3,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'Optional parameters for the query. like @{"Id" = 1; "Name" = "John"}'
        )]
        [parameter(
            ParameterSetName = 'ConnectionString',
            Mandatory,
            Position = 2,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'Optional parameters for the query. like @{"Id" = 1; "Name" = "John"}'
        )]
        [parameter(
            ParameterSetName = 'HostnameOnly',
            Mandatory,
            Position = 2,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'Optional parameters for the query. like @{"Id" = 1; "Name" = "John"}'
        )]
        [parameter(
            ParameterSetName = 'Default',
            Mandatory,
            Position = 1,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'Optional parameters for the query. like @{"Id" = 1; "Name" = "John"}'
        )]
        [Alias("data", "parameters", "args")]
        [System.Collections.Hashtable[]] $SqlParameters,

        ###############################################################################

        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The isolation level to use. default is ReadCommitted.'
        )]
        [System.Data.IsolationLevel]$IsolationLevel = [System.Data.IsolationLevel]::ReadCommitted
    )

    try {

        $connection = New-Object System.Data.SqlServer.SqlServerConnection($connectionString)
        $connection.Open()
        $transaction = $connection.BeginTransaction($IsolationLevel);
        $SqlParameters = $SqlParameters || @()

        try {
            $idx = -1;
            $Queries | ForEach-Object {

                $idx++;

                # take none or the next or the last one supplied
                $data = $SqlParameters[[Math]::Min($idx, $SqlParameters.Count - 1)]

                $command = $connection.CreateCommand()
                $command.CommandText = $PSItem

                if ($null -ne $data) {

                    $data | ForEach-Object {

                        $command.Parameters.AddWithValue($PSItem.Key, $PSItem.Value)
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
            $reader.Close()
            $connection.Close()
        }
    }
    catch {
        throw $_
    }
}
