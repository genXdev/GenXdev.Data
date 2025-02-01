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
Get-SqlLiteSchema -DatabaseFilePath "C:\path\to\database.db"

.EXAMPLE
Get-SqlLiteSchema -ConnectionString "Data Source=C:\path\to\database.db"
#>
function Get-SqlLiteSchema {

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

    Invoke-SqlLiteQuery @PSBoundParameters
}
