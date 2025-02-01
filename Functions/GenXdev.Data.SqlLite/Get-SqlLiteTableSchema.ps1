#######################################################################################

function Get-SqlLiteTableSchema {

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
            HelpMessage = 'The name of the table.'
        )]
        [string]$TableName
    )

    $PSBoundParameters["Queries"] = "PRAGMA table_info($TableName)"

    Invoke-SqlLiteQuery @PSBoundParameters
}
