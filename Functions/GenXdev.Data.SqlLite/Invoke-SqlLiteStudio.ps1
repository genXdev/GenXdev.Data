#######################################################################################

function Invoke-SqlLiteStudio {

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

        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory,
            Position = 1,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'The query to execute.'
        )]
        [string[]] $Queries,

        ###############################################################################

        [Alias("parameters")]
        [parameter(
            Mandatory,
            Position = 1,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'Optional parameters for the query. like @{"Id" = 1; "Name" = "John"}'
        )]
        [System.Collections.Hashtable[]] $SqlParameters,

        ###############################################################################

        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The isolation level to use. default is ReadCommitted.'
        )]
        [System.Data.IsolationLevel]$IsolationLevel = [System.Data.IsolationLevel]::ReadCommitted
    )
}
