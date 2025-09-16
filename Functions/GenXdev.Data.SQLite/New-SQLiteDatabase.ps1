<##############################################################################
Part of PowerShell module : GenXdev.Data.SQLite
Original cmdlet filename  : New-SQLiteDatabase.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.268.2025
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
Creates a new SQLite database file.

.DESCRIPTION
Creates a new SQLite database file at the specified path if it does not already
exist. The function ensures the target directory exists and creates a valid
SQLite database by establishing and closing a connection.

.PARAMETER DatabaseFilePath
The full path where the SQLite database file should be created. If the directory
path does not exist, it will be created automatically.

.EXAMPLE
New-SQLiteDatabase -DatabaseFilePath "C:\Databases\MyNewDb.sqlite"

.EXAMPLE
nsqldb "C:\Databases\MyNewDb.sqlite"
#>
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
        [string]$DatabaseFilePath
        ########################################################################
    )

    begin {
        # load SQLite client assembly
        GenXdev.Helpers\EnsureNuGetAssembly -PackageKey 'System.Data.Sqlite'

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