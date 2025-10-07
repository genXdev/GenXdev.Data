<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : New-SQLServerDatabase.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.296.2025
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
Creates a new SQL Server database.

.DESCRIPTION
Creates a new SQL Server database with the specified name on the specified server.
Requires appropriate permissions to create databases on the target SQL Server instance.
If the database already exists, the operation will be skipped.

.PARAMETER DatabaseName
The name of the SQL Server database to create. Must be a valid SQL Server database name.

.PARAMETER Server
The SQL Server instance name where the database should be created. Defaults to 'localhost'.

.PARAMETER ConnectionString
Alternative connection string to use instead of Server parameter. Should connect to master database or have appropriate permissions.

.PARAMETER ForceConsent
Force a consent prompt even if a preference is already set for SQL Server package
installation, overriding any saved consent preferences.

.PARAMETER ConsentToThirdPartySoftwareInstallation
Automatically consent to third-party software installation and set a persistent
preference flag for SQL Server package, bypassing interactive consent prompts.

.EXAMPLE
New-SQLServerDatabase -DatabaseName "MyNewDatabase" -Server "localhost"

.EXAMPLE
New-SQLServerDatabase "MyNewDatabase"

.EXAMPLE
New-SQLServerDatabase -DatabaseName "MyNewDatabase" -ConnectionString "Server=localhost;Database=master;Integrated Security=true"

.EXAMPLE
New-SQLServerDatabase -DatabaseName "MyNewDatabase" -Server "localhost" -ConsentToThirdPartySoftwareInstallation
#>
function New-SQLServerDatabase {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('nsqldb')]

    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The name of the SQL Server database to create'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$DatabaseName,
        ########################################################################
        [Parameter(
            Position = 1,
            ParameterSetName = 'DatabaseName',
            HelpMessage = 'The SQL Server instance name'
        )]
        [string]$Server = '.',
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to connect to SQL Server'
        )]
        [string]$ConnectionString,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Force a consent prompt even if preference is set for SQL Server package installation.'
        )]
        [switch] $ForceConsent,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Automatically consent to third-party software installation and set persistent flag for SQL Server package.'
        )]
        [switch] $ConsentToThirdPartySoftwareInstallation
        ########################################################################
    )

    begin {
        # load SQL Server client assembly with embedded consent using Copy-IdenticalParamValues
        $ensureParams = GenXdev.Helpers\Copy-IdenticalParamValues `
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


        # prepare connection string
        if ($PSCmdlet.ParameterSetName -eq 'DatabaseName') {
            $masterConnectionString = "Server=$Server;Database=master;Integrated Security=true;TrustServerCertificate=true"
        } else {
            $masterConnectionString = $ConnectionString
        }
    }

    process {

        # build a meaningful should process message
        $targetObject = 'SQL Server database'
        $action = 'Create'
        $target = if ($PSCmdlet.ParameterSetName -eq 'DatabaseName') { "$DatabaseName on $Server" } else { "database via connection string" }

        # check if user wants to proceed with operation
        if ($PSCmdlet.ShouldProcess($target, "$action $targetObject")) {
            try {
                # create connection to master database to check if target database exists
                $connectionClass = "$sqlClientType.SqlConnection"
                $connection = Microsoft.PowerShell.Utility\New-Object $connectionClass($masterConnectionString)
                $connection.Open()

                # check if database already exists
                $checkQuery = if ($PSCmdlet.ParameterSetName -eq 'DatabaseName') {
                    "SELECT database_id FROM sys.databases WHERE name = @DatabaseName"
                } else {
                    # For connection string mode, we'll try to connect directly and see if it fails
                    $null
                }

                if ($checkQuery) {
                    $checkCommand = $connection.CreateCommand()
                    $checkCommand.CommandText = $checkQuery
                    $checkCommand.Parameters.AddWithValue("@DatabaseName", $DatabaseName)
                    $existingDb = $checkCommand.ExecuteScalar()

                    if ($null -eq $existingDb) {
                        # create the database
                        $createQuery = "CREATE DATABASE [$DatabaseName]"
                        $createCommand = $connection.CreateCommand()
                        $createCommand.CommandText = $createQuery
                        $createCommand.ExecuteNonQuery()

                        Microsoft.PowerShell.Utility\Write-Verbose "Successfully created database '$DatabaseName' on server '$Server'"
                    } else {
                        Microsoft.PowerShell.Utility\Write-Verbose "Database '$DatabaseName' already exists on server '$Server'"
                    }
                }

                $connection.Close()
            }
            catch {
                if ($null -ne $connection -and $connection.State -eq 'Open') {
                    $connection.Close()
                }
                throw "Failed to create database. Error: $($_.Exception.Message)"
            }
        }
    }

    end {
    }
}