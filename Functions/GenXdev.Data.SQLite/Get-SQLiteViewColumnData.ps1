################################################################################
<#
.SYNOPSIS
Retrieves column data from a SQLite view with optional record limiting.

.DESCRIPTION
Executes a SELECT query against a specified SQLite view to retrieve data from a
single column. Supports connecting via either a connection string or database file
path. Allows limiting the number of returned records or retrieving all records.

.PARAMETER ConnectionString
The SQLite database connection string. This parameter is mutually exclusive with
DatabaseFilePath.

.PARAMETER DatabaseFilePath
The full path to the SQLite database file. This parameter is mutually exclusive
with ConnectionString.

.PARAMETER ViewName
The name of the SQLite view to query data from.

.PARAMETER ColumnName
The name of the column within the view to retrieve data from.

.PARAMETER Count
The maximum number of records to return. Use -1 to return all records. Defaults
to 100 if not specified.

.EXAMPLE
Get-SQLiteViewColumnData -DatabaseFilePath "C:\MyDB.sqlite" `
    -ViewName "CustomersView" `
    -ColumnName "Email" `
    -Count 50

.EXAMPLE
Get-SQLiteViewColumnData "C:\MyDB.sqlite" "CustomersView" "Email"
#>
function Get-SQLiteViewColumnData {

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
        [string]$DatabaseFilePath,

        ###############################################################################
        [Parameter(
            Position = 1,
            Mandatory = $true,
            HelpMessage = 'The name of the view.'
        )]
        [string]$ViewName,

        ###############################################################################
        [Parameter(
            Position = 2,
            Mandatory = $true,
            HelpMessage = 'The name of the column.'
        )]
        [string]$ColumnName,

        ###############################################################################
        [Parameter(
            Position = 3,
            Mandatory = $false,
            HelpMessage = 'The number of records to return. Default is 100. -1 for all.'
        )]
        [int]$Count = 100
    )

    begin {

        # log the start of the operation
        Write-Verbose "Starting Get-SQLiteViewColumnData for view '$ViewName'"
    }

    process {

        # determine if we need to limit the results or get all records
        if ($Count -eq -1) {
            # construct query to get all records
            $PSBoundParameters["Queries"] = "SELECT $ColumnName FROM $ViewName"
            Write-Verbose "Querying all records from view '$ViewName'"
        }
        else {
            # construct query with LIMIT clause
            $PSBoundParameters["Queries"] = "SELECT $ColumnName FROM $ViewName LIMIT $Count"
            Write-Verbose "Querying $Count records from view '$ViewName'"
        }

        # execute the query using the existing Invoke-SQLiteQuery cmdlet
        Invoke-SQLiteQuery @PSBoundParameters
    }

    end {

        # log completion of the operation
        Write-Verbose "Completed Get-SQLiteViewColumnData for view '$ViewName'"
    }
}
################################################################################