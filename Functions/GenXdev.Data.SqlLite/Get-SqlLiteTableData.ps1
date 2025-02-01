#######################################################################################

function Get-SqlLiteTableData {

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
        [string]$TableName,

        ###############################################################################

        [Parameter(
            Position = 2,
            Mandatory = $false,
            HelpMessage = 'The number of records to return. default is 100. -1 to return all records.'
        )]
        [int] $Count = 100
    )

    if ($Count -eq -1) {

        $PSBoundParameters["Queries"] = "SELECT * FROM $TableName"
    }
    else {

        $PSBoundParameters["Queries"] = "SELECT * FROM $TableName LIMIT $Count"
    }

    Invoke-SqlLiteQuery @PSBoundParameters
}
