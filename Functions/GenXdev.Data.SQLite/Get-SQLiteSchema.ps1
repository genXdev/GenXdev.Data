#######################################################################################
<#
.SYNOPSIS
Get the schema of a SQLite database.

.DESCRIPTION
Get the schema of a SQLite database.

.PARAMETER ConnectionString
The connection string to the SQLite database.

.PARAMETER DatabaseFilePath
The path to the SQLite database file.

.EXAMPLE
Get-SQLiteSchema -DatabaseFilePath "C:\path\to\database.db"

.EXAMPLE
Get-SQLiteSchema -ConnectionString "Data Source=C:\path\to\database.db"
#>
function Get-SQLiteSchema {

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
        [string]$DatabaseFilePath
    )

    $PSBoundParameters["Queries"] = "SELECT * FROM sqlite_master"

    Invoke-SQLiteQuery @PSBoundParameters
}
