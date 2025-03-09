################################################################################
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
    [Alias("nsqldb")]

    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "The path to the SQLite database file"
        )]
        [string]$DatabaseFilePath
        ########################################################################
    )

    begin {

        # expand the path and create directory if needed
        $DatabaseFilePath = GenXdev.FileSystem\Expand-Path $DatabaseFilePath -CreateDirectory
    }

    process {

        # check if database file already exists
        if (-not (Test-Path $DatabaseFilePath)) {

            # build a meaningful should process message
            $targetObject = "SQLite database"
            $action = "Create"

            # check if user wants to proceed with operation
            if ($PSCmdlet.ShouldProcess($DatabaseFilePath, "$action $targetObject")) {
                try {
                    # construct the connection string
                    $connectionString = "Data Source=$DatabaseFilePath"

                    # create a new database connection
                    $connection = New-Object System.Data.SQLite.SQLiteConnection(
                        $connectionString)

                    # open and immediately close to create empty database
                    $connection.Open()
                    $connection.Close()

                    Write-Verbose "Successfully created database at $DatabaseFilePath"
                }
                catch {
                    throw "Failed to create database at $DatabaseFilePath. Error: `
$($_.Exception.Message)"
                }
            }
        }
        else {
            Write-Verbose "Database file already exists at $DatabaseFilePath"
        }
    }

    end {
    }
}
################################################################################
