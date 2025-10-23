<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : Get-SQLServerTransaction.ps1
Original author           : René Vaessen / GenXdev
Version                   : 2.1.2025
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
# don't remove this line [dontrefactor]

###############################################################################
<#
.SYNOPSIS
Creates and returns a SQL Server transaction object for batch operations.

.DESCRIPTION
Creates a SQL Server database connection and transaction object that can be used
for batch operations. The caller is responsible for committing or rolling back
the transaction. Requires an existing SQL Server database and connection.

.PARAMETER ConnectionString
The SQL Server connection string for database access.

.PARAMETER DatabaseName
The name of the SQL Server database. Used with Server parameter to create connection string.

.PARAMETER Server
The SQL Server instance name. Defaults to 'localhost'.

.PARAMETER IsolationLevel
Transaction isolation level. Defaults to ReadCommitted.

.PARAMETER CreateDatabaseIfNotExists
Whether to create the database file if it doesn't exist. Defaults to true.

.PARAMETER ForceConsent
Force a consent prompt even if a preference is already set for SQL Server package
installation, overriding any saved consent preferences.

.PARAMETER ConsentToThirdPartySoftwareInstallation
Automatically consent to third-party software installation and set a persistent
preference flag for SQL Server package, bypassing interactive consent prompts.

.EXAMPLE
$transaction = Get-SQLServerTransaction -Server "localhost" -DatabaseName "MyDatabase"
try {
    Invoke-SQLServerQuery -Transaction $transaction -Queries "INSERT INTO Users..."
    Invoke-SQLServerQuery -Transaction $transaction -Queries "UPDATE Users..."
    $transaction.Commit()
} catch {
    $transaction.Rollback()
    throw
} finally {
    $transaction.Connection.Close()
}

.EXAMPLE
$transaction = Get-SQLServerTransaction -ConnectionString "Server=localhost;Database=MyDB;Integrated Security=true"

.EXAMPLE
$transaction = Get-SQLServerTransaction -Server "localhost" -DatabaseName "MyDatabase" -ConsentToThirdPartySoftwareInstallation
#>
function Get-SQLServerTransaction {

    [CmdletBinding(DefaultParameterSetName = 'DatabaseName')]
    [Alias('getsqltx', 'newsqltx')]
    param (
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQL Server database.'
        )]
        [string]$ConnectionString,

        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The name of the SQL Server database.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$DatabaseName,

        ###########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The SQL Server instance name.'
        )]
        [string]$Server = '.',

        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Transaction isolation level.'
        )]
        [ValidateSet('ReadCommitted', 'ReadUncommitted', 'RepeatableRead', 'Serializable', 'Snapshot', 'Chaos')]
        [string]$IsolationLevel = "ReadCommitted",

        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Force a consent prompt even if preference is set for SQL Server package installation.'
        )]
        [switch] $ForceConsent,

        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Automatically consent to third-party software installation and set persistent flag for SQL Server package.'
        )]
        [switch] $ConsentToThirdPartySoftwareInstallation
        ###########################################################################
    )

    begin {
        # load SQL Server client assembly with embedded consent using Copy-IdenticalParamValues
        $ensureParams = GenXdev.FileSystem\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Helpers\EnsureNuGetAssembly' `
            -DefaultValues (
            Microsoft.PowerShell.Utility\Get-Variable -Scope Local `
                -ErrorAction SilentlyContinue
        )

        # Set specific parameters for SQL Server package
        $ensureParams['PackageKey'] = 'System.Data.SqlClient'
        $ensureParams['Description'] = 'SQL Server client library required for database operations'
        $ensureParams['Publisher'] = 'Microsoft'

        GenXdev.Helpers\EnsureNuGetAssembly @ensureParams

        # initialize connection string from parameters
        if ($PSCmdlet.ParameterSetName -eq 'DatabaseName') {
            $connString = "Server=$Server;Database=$DatabaseName;Integrated Security=true;TrustServerCertificate=true"
        }
        else {
            $connString = $ConnectionString
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Creating SQL Server transaction with connection string: $connString"
    }

    process {
        try {
            # establish database connection
            $connectionClass = "System.Data.SqlClient.SqlConnection"
            $connection = Microsoft.PowerShell.Utility\New-Object $connectionClass($connString)
            $connection.Open()
            Microsoft.PowerShell.Utility\Write-Verbose 'SQL Server connection opened successfully'

            # begin transaction with specified isolation
            $transaction = $connection.BeginTransaction($IsolationLevel)
            Microsoft.PowerShell.Utility\Write-Verbose "Transaction started with $IsolationLevel isolation level"

            # return the transaction object
            return $transaction
        }
        catch {
            if ($null -ne $connection -and $connection.State -eq 'Open') {
                $connection.Close()
            }
            throw $_
        }
    }

    end {
    }
}