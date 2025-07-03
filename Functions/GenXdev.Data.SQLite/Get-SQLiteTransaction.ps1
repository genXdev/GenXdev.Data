###############################################################################
<#
.SYNOPSIS
Creates and returns a SQLite transaction object for batch operations.

.DESCRIPTION
Creates a SQLite database connection and transaction object that can be used
for batch operations. The caller is responsible for committing or rolling back
the transaction. The connection will be automatically created if the database
file doesn't exist.

.PARAMETER ConnectionString
The SQLite connection string for database access.

.PARAMETER DatabaseFilePath
The file path to the SQLite database. Will be converted to a connection string.

.PARAMETER IsolationLevel
Transaction isolation level. Defaults to ReadCommitted.

.PARAMETER CreateDatabaseIfNotExists
Whether to create the database file if it doesn't exist. Defaults to true.

.EXAMPLE
$transaction = Get-SQLiteTransaction -DatabaseFilePath "C:\data.db"
try {
    Invoke-SQLiteQuery -Transaction $transaction -Queries "INSERT INTO Users..."
    Invoke-SQLiteQuery -Transaction $transaction -Queries "UPDATE Users..."
    $transaction.Commit()
} catch {
    $transaction.Rollback()
    throw
} finally {
    $transaction.Connection.Close()
}

.EXAMPLE
$transaction = Get-SQLiteTransaction -ConnectionString "Data Source=C:\data.db"
        ###############################################################################>
function Get-SQLiteTransaction {

    [CmdletBinding(DefaultParameterSetName = "DatabaseFilePath")]
    [Alias("getsqltx", "newsqltx")]
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
        [ValidateNotNullOrEmpty()]
        [Alias("dbpath", "indexpath")]
        [string]$DatabaseFilePath,

        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Transaction isolation level.'
        )]
        [System.Data.IsolationLevel]$IsolationLevel = [System.Data.IsolationLevel]::ReadCommitted,

        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Whether to create the database file if it does not exist.'
        )]
        [bool]$CreateDatabaseIfNotExists = $true
        ###########################################################################
    )

    begin {
        # initialize connection string from file path if provided
        if ($PSCmdlet.ParameterSetName -eq 'DatabaseFilePath') {
            $expandedPath = GenXdev.FileSystem\Expand-Path $DatabaseFilePath
              # create database if it doesn't exist and CreateDatabaseIfNotExists is true
            if ($CreateDatabaseIfNotExists -and -not (Microsoft.PowerShell.Management\Test-Path $expandedPath)) {
                Microsoft.PowerShell.Utility\Write-Verbose "Creating database file: $expandedPath"

                # use Copy-IdenticalParamValues to pass compatible parameters to New-SQLiteDatabase
                $params = GenXdev.Helpers\Copy-IdenticalParamValues `
                    -BoundParameters $PSBoundParameters `
                    -FunctionName "GenXdev.Data\New-SQLiteDatabase" `
                    -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable -Scope Local -ErrorAction SilentlyContinue)

                GenXdev.Data\New-SQLiteDatabase @params
            }

            $connString = "Data Source=$expandedPath"
        } else {
            $connString = $ConnectionString
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Creating SQLite transaction with connection string: $connString"
    }

    process {
        try {
            # establish database connection
            $connection = Microsoft.PowerShell.Utility\New-Object System.Data.SQLite.SQLiteConnection($connString)
            $connection.Open()
            Microsoft.PowerShell.Utility\Write-Verbose "SQLite connection opened successfully"

            # begin transaction with specified isolation
            $transaction = $connection.BeginTransaction($IsolationLevel)
            Microsoft.PowerShell.Utility\Write-Verbose "Transaction started with $IsolationLevel isolation level"

            # return the transaction object
            return $transaction
        }
        catch {
            if ($null -ne $connection -and $connection.State -eq [System.Data.ConnectionState]::Open) {
                $connection.Close()
            }
            throw $_
        }
    }

    end {
    }
}
        ###############################################################################
