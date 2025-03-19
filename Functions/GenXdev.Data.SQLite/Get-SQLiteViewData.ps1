################################################################################
<#
.SYNOPSIS
Retrieves data from a SQLite database view with optional record limiting.

.DESCRIPTION
Queries a SQLite database view using either a connection string or database file
path. The function supports limiting the number of returned records and provides
verbose output for tracking query execution.

.PARAMETER ConnectionString
The connection string to connect to the SQLite database. This parameter is
mutually exclusive with DatabaseFilePath.

.PARAMETER DatabaseFilePath
The file path to the SQLite database file. This parameter is mutually exclusive
with ConnectionString.

.PARAMETER ViewName
The name of the view from which to retrieve data.

.PARAMETER Count
The maximum number of records to return. Use -1 to return all records.
Defaults to 100 if not specified.

.EXAMPLE
Get-SQLiteViewData -DatabaseFilePath "C:\MyDb.sqlite" `
    -ViewName "CustomerView" `
    -Count 50

.EXAMPLE
Get-SQLiteViewData "C:\MyDb.sqlite" "CustomerView"
#>
function Get-SQLiteViewData {

    [CmdletBinding(DefaultParameterSetName = "DatabaseFilePath")]
    param (
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ConnectionString,

        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$DatabaseFilePath,

        ########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $true,
            HelpMessage = 'The name of the view to query.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ViewName,

        ########################################################################
        [Parameter(
            Position = 2,
            Mandatory = $false,
            HelpMessage = 'Number of records to return. -1 for all records.'
        )]
        [ValidateRange(-1, [int]::MaxValue)]
        [int]$Count = 100
    )

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Starting Get-SQLiteViewData for view: $ViewName"
    }

    process {

        # construct query with optional record limit
        $query = if ($Count -eq -1) {
            "SELECT * FROM $ViewName"
        }
        else {
            "SELECT * FROM $ViewName LIMIT $Count"
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Executing query: $query"

        # prepare parameters for Invoke-SQLiteQuery
        $PSBoundParameters["Queries"] = $query

        # execute query and return results
        GenXdev.Data\Invoke-SQLiteQuery @PSBoundParameters
    }

    end {

        Microsoft.PowerShell.Utility\Write-Verbose "Completed querying view: $ViewName"
    }
}
################################################################################