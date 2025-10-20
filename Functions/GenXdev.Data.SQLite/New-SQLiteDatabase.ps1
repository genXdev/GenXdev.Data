<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : New-SQLiteDatabase.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.302.2025
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
Creates a new SQLite database file.

.DESCRIPTION
Creates a new SQLite database file at the specified path if it does not already
exist. The function ensures the target directory exists and creates a valid
SQLite database by establishing and closing a connection.

.PARAMETER DatabaseFilePath
The full path where the SQLite database file should be created. If the directory
path does not exist, it will be created automatically.

.PARAMETER ForceConsent
Force a consent prompt even if a preference is already set for SQLite package
installation, overriding any saved consent preferences.

.PARAMETER ConsentToThirdPartySoftwareInstallation
Automatically consent to third-party software installation and set a persistent
preference flag for SQLite package, bypassing interactive consent prompts.

.EXAMPLE
New-SQLiteDatabase -DatabaseFilePath "C:\Databases\MyNewDb.sqlite"

.EXAMPLE
nsqldb "C:\Databases\MyNewDb.sqlite"

.EXAMPLE
New-SQLiteDatabase -DatabaseFilePath "C:\Databases\MyNewDb.sqlite" -ConsentToThirdPartySoftwareInstallation
#>

# don't remove this line [dontrefactor]

function New-SQLiteDatabase {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('nsqldb')]

    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'The path to the SQLite database file'
        )]
        [string]$DatabaseFilePath,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Force a consent prompt even if preference is set for SQLite package installation.'
        )]
        [switch] $ForceConsent,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Automatically consent to third-party software installation and set persistent flag for SQLite package.'
        )]
        [switch] $ConsentToThirdPartySoftwareInstallation
        ########################################################################
    )

    begin {
        # load SQLite client assembly with embedded consent using Copy-IdenticalParamValues
        $ensureParams = GenXdev.FileSystem\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Helpers\EnsureNuGetAssembly' `
            -DefaultValues (
            Microsoft.PowerShell.Utility\Get-Variable -Scope Local `
                -ErrorAction SilentlyContinue
        )

        # Set specific parameters for SQLite package
        $ensureParams['PackageKey'] = 'System.Data.Sqlite'
        $ensureParams['Description'] = 'SQLite database engine for .NET applications'
        $ensureParams['Publisher'] = 'SQLite Development Team'

        GenXdev.Helpers\EnsureNuGetAssembly @ensureParams

        # expand the path and create directory if needed
        $DatabaseFilePath = GenXdev.FileSystem\Expand-Path $DatabaseFilePath -CreateDirectory
    }


    process {

        # check if database file already exists
        if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $DatabaseFilePath)) {

            # build a meaningful should process message
            $targetObject = 'SQLite database'
            $action = 'Create'

            # check if user wants to proceed with operation
            if ($PSCmdlet.ShouldProcess($DatabaseFilePath, "$action $targetObject")) {
                try {
                    # construct the connection string
                    $connectionString = "Data Source=$DatabaseFilePath"

                    # create a new database connection
                    $connection = Microsoft.PowerShell.Utility\New-Object System.Data.Sqlite.SQLiteConnection(
                        $connectionString)

                    # open and immediately close to create empty database
                    $connection.Open()
                    $connection.Close()

                    Microsoft.PowerShell.Utility\Write-Verbose "Successfully created database at $DatabaseFilePath"
                }
                catch {
                    throw "Failed to create database at $DatabaseFilePath. Error: `
$($_.Exception.Message)"
                }
            }
        }
        else {
            Microsoft.PowerShell.Utility\Write-Verbose "Database file already exists at $DatabaseFilePath"
        }
    }

    end {
    }
}