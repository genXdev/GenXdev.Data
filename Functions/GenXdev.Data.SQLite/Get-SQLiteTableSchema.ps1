################################################################################
<#
.SYNOPSIS
Retrieves the schema information for a specified SQLite table.

.DESCRIPTION
This function queries the SQLite database to get detailed schema information for
a specified table using the PRAGMA table_info command.

.PARAMETER ConnectionString
The connection string to the SQLite database.

.PARAMETER DatabaseFilePath
The file path to the SQLite database file.

.PARAMETER TableName
The name of the table to get schema information for.

.EXAMPLE
Get-SQLiteTableSchema -ConnectionString "Data Source=C:\mydb.sqlite" -TableName "Users"

.EXAMPLE
Get-SQLiteTableSchema -DatabaseFilePath "C:\mydb.sqlite" -TableName "Users"
#>
function Get-SQLiteTableSchema {

    [CmdletBinding(DefaultParameterSetName = "Default")]
    param (
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'ConnectionString',
            HelpMessage = 'The connection string to the SQLite database'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ConnectionString,

        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'DatabaseFilePath',
            HelpMessage = 'The path to the SQLite database file'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$DatabaseFilePath,

        ###########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $true,
            HelpMessage = 'The name of the table'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$TableName
    )

    begin {
        Write-Verbose "Preparing to retrieve schema for table '$TableName'"
    }

    process {
        # construct the PRAGMA query to get table information
        $PSBoundParameters["Queries"] = "PRAGMA table_info($TableName)"

        Write-Verbose "Executing schema query against SQLite database"

        # execute the query using Invoke-SQLiteQuery
        Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
    }
}
################################################################################
