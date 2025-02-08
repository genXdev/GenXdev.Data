#######################################################################################
<#
.SYNOPSIS
Creates a new SQLite database.
.DESCRIPTION
Creates a new SQLite database file if it does not already exist.
.PARAMETER DatabaseFilePath
Path to the SQLite database file to be created.
.EXAMPLE
New-SQLiteDatabase -DatabaseFilePath "C:\temp\newdb.sqlite"
#>
function New-SQLiteDatabase {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0, HelpMessage = "The path to the SQLite database file.")]
        [string]$DatabaseFilePath
    )

    $DatabaseFilePath = Expand-Path $DatabaseFilePath -CreateDirectory

    if (-not (Test-Path $DatabaseFilePath)) {
        try {
            $connectionString = "Data Source=$DatabaseFilePath"
            $connection = New-Object System.Data.SQLite.SQLiteConnection($connectionString)
            $connection.Open()
            $connection.Close()
        }
        catch {
            throw "Failed to create database at $DatabaseFilePath. Error: $($_.Exception.Message)"
        }
    }
    else {
        Write-Verbose "Database file already exists at $DatabaseFilePath."
    }
}
