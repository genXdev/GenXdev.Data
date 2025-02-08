################################################################################
<#
.SYNOPSIS
Retrieves a list of views from a SQLite database.

.DESCRIPTION
Gets all view names from the specified SQLite database using either a connection
string or database file path.

.PARAMETER ConnectionString
The connection string to the SQLite database.

.PARAMETER DatabaseFilePath
The path to the SQLite database file.

.EXAMPLE
Get-SQLiteViews -DatabaseFilePath "C:\MyDb.sqlite"

.EXAMPLE
Get-SQLiteViews -ConnectionString "Data Source=C:\MyDb.sqlite"
#>
function Get-SQLiteViews {

    [CmdletBinding(DefaultParameterSetName = "Default")]
    param (
        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database.'
        )]
        [string]$ConnectionString,

        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file.'
        )]
        [string]$DatabaseFilePath
    )

    begin {
        Write-Verbose "Preparing to retrieve SQLite views..."
    }

    process {
        # prepare the query to get all views
        $query = "SELECT name FROM sqlite_master WHERE type='view'"
        Write-Verbose "Executing query: $query"

        # execute the query using existing parameter set
        $PSBoundParameters["Queries"] = $query
        Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
    }
}
################################################################################
