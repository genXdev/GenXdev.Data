################################################################################
<#
.SYNOPSIS
Executes SQL queries against a SQL Server database with transaction support.

.DESCRIPTION
Executes one or more SQL queries against a SQL Server database, supporting
parameters and configurable transaction isolation levels. All queries execute
within a single transaction that rolls back on error.

.PARAMETER ConnectionString
The complete connection string for connecting to the SQL Server database.

.PARAMETER HostName
The SQL Server host name or IP address. Defaults to "." (local server).

.PARAMETER User
The username for SQL Server authentication.

.PARAMETER Password
The password for SQL Server authentication.

.PARAMETER Queries
One or more SQL queries to execute. Accepts pipeline input.

.PARAMETER SqlParameters
Optional hashtable of parameters for the queries. Format: @{"param"="value"}.

.PARAMETER IsolationLevel
Transaction isolation level. Defaults to ReadCommitted.

.EXAMPLE
# Execute query with explicit connection string
Invoke-SqlServerQuery -ConnectionString "Server=.;Database=test;Trusted_Connection=True" `
    -Query "SELECT * FROM Users WHERE Id = @Id" `
    -SqlParameters @{"Id"=1}

.EXAMPLE
# Execute query using host and credentials
isq -HostName "dbserver" -User "sa" -Password "pwd" `
    -q "SELECT * FROM Users" -data @{"Id"=1}
#>
function Invoke-SqlServerQuery {

    [CmdletBinding(DefaultParameterSetName = "Default")]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingPlainTextForPassword", "Password", Justification = "Common pattern for SQL authentication")]
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
        [string]$HostName,


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
        [Alias("q", "Value", "Name", "Text", "Query")]
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

    begin {
        # prepare connection based on parameter set
        Microsoft.PowerShell.Utility\Write-Verbose "Preparing SQL connection using $($PSCmdlet.ParameterSetName) mode"

        # set default hostname to local server if not specified but needed
        if ($PSCmdlet.ParameterSetName -ne "ConnectionString" -and [string]::IsNullOrEmpty($HostName)) {

            $hostName = "."
            Microsoft.PowerShell.Utility\Write-Verbose "Using default local server hostname (.)"
        }

        # build connection string if not provided directly
        if ($PSCmdlet.ParameterSetName -ne "ConnectionString") {

            $connectionString = "Server=$HostName;"

            if ($User) {

                $connectionString += "User Id=$User;Password=$Password;"
            }
            else {

                $connectionString += "Trusted_Connection=True;"
            }
        }
    }

    process {

        try {
            # establish database connection
            Microsoft.PowerShell.Utility\Write-Verbose "Opening SQL connection"
            $connection = Microsoft.PowerShell.Utility\New-Object System.Data.SqlServer.SqlServerConnection($connectionString)
            $connection.Open()

            # begin transaction with specified isolation
            Microsoft.PowerShell.Utility\Write-Verbose "Beginning transaction with $IsolationLevel isolation"
            $transaction = $connection.BeginTransaction($IsolationLevel)

            # ensure parameters array exists
            $sqlParameters = $sqlParameters -or @()

            try {
                $idx = -1

                # process each query
                $Queries | Microsoft.PowerShell.Core\ForEach-Object {

                    $idx++
                    Microsoft.PowerShell.Utility\Write-Verbose "Executing query #$($idx + 1)"

                    # select appropriate parameter set for this query
                    $data = $SqlParameters[[Math]::Min($idx, $SqlParameters.Count - 1)]

                    # prepare and configure command
                    $command = $connection.CreateCommand()
                    $command.CommandText = $PSItem
                    $command.Transaction = $transaction

                    # add any supplied parameters
                    if ($null -ne $data) {

                        $data.GetEnumerator() | Microsoft.PowerShell.Core\ForEach-Object {

                            Microsoft.PowerShell.Utility\Write-Verbose "Adding parameter $($_.Key) = $($_.Value)"
                            $command.Parameters.AddWithValue($_.Key, $_.Value)
                        }
                    }

                    # execute and process results
                    $reader = $command.ExecuteReader()

                    # convert each row to a hashtable
                    while ($reader.Read()) {

                        $record = @{}

                        for ($i = 0; $i -lt $reader.FieldCount; $i++) {

                            $record[$reader.GetName($i)] = $reader.GetValue($i)
                        }

                        Microsoft.PowerShell.Utility\Write-Output $record
                    }

                    $reader.Close()
                }

                # commit if all succeeded
                Microsoft.PowerShell.Utility\Write-Verbose "Committing transaction"
                $transaction.Commit()
            }
            catch {
                # rollback on any error
                Microsoft.PowerShell.Utility\Write-Verbose "Error occurred, rolling back transaction"
                $transaction.Rollback()
                throw $_
            }
            finally {
                # ensure connections are closed
                if ($reader) { $reader.Close() }
                if ($connection.State -eq 'Open') { $connection.Close() }
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