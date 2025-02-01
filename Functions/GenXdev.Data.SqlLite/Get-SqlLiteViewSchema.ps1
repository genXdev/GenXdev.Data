#######################################################################################

function Get-SqlLiteViewSchema {

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
        [string]$DatabaseFilePath,

        ###############################################################################

        [Parameter(
            Position = 1,
            Mandatory,
            HelpMessage = 'The name of the view.'
        )]
        [string]$ViewName
    )

    $PSBoundParameters["Queries"] = "SELECT sql FROM sqlite_master WHERE name = '$ViewName'"

    Invoke-SqlLiteQuery @PSBoundParameters
}
