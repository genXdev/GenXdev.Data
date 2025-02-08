################################################################################
<#
.SYNOPSIS
Retrieves data from a SQLite database table.

.DESCRIPTION
This function allows you to query data from a specified SQLite database table
using either a connection string or database file path. It supports limiting the
number of records returned.

.PARAMETER ConnectionString
The connection string to connect to the SQLite database.

.PARAMETER DatabaseFilePath
The file path to the SQLite database file.

.PARAMETER TableName
The name of the table to query data from.

.PARAMETER Count
The maximum number of records to return. Default is 100. Use -1 to return all
records.

.EXAMPLE
Get-SQLiteTableData -DatabaseFilePath "C:\mydb.sqlite" -TableName "Users" -Count 10

.EXAMPLE
Get-SQLiteTableData -ConnectionString "Data Source=mydb.sqlite" -TableName "Users"
#>
function Get-SQLiteTableData {

    [CmdletBinding(DefaultParameterSetName = "Default")]
    param (
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ConnectionString,

        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$DatabaseFilePath,

        ###########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $true,
            HelpMessage = 'The name of the table.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$TableName,

        ###########################################################################
        [Parameter(
            Position = 2,
            Mandatory = $false,
            HelpMessage = 'The number of records to return. Default is 100. -1 for all.'
        )]
        [ValidateRange(-1, [int]::MaxValue)]
        [int]$Count = 100
    )

    begin {
        Write-Verbose "Starting Get-SQLiteTableData for table: $TableName"
    }

    process {
        # construct the query based on count parameter
        $query = if ($Count -eq -1) {
            "SELECT * FROM $TableName"
        }
        else {
            "SELECT * FROM $TableName LIMIT $Count"
        }

        Write-Verbose "Executing query: $query"

        # set the query parameter
        $PSBoundParameters["Queries"] = $query

        # invoke the query and return results
        Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
        Write-Verbose "Completed querying table: $TableName"
    }
}
################################################################################
