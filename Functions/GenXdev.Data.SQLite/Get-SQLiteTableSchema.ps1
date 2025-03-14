################################################################################
<#
.SYNOPSIS
Retrieves the schema information for a specified SQLite table.

.DESCRIPTION
This function queries the SQLite database to get detailed schema information for
a specified table. It uses the SQLite PRAGMA table_info command to return column
definitions including names, types, nullable status, and default values.

.PARAMETER ConnectionString
Specifies the SQLite connection string in the format:
"Data Source=path_to_database_file"

.PARAMETER DatabaseFilePath
Specifies the direct file path to the SQLite database file. This is converted
internally to a connection string.

.PARAMETER TableName
Specifies the name of the table for which to retrieve schema information.

.EXAMPLE
Get-SQLiteTableSchema -DatabaseFilePath "C:\Databases\mydb.sqlite" `
    -TableName "Users"

.EXAMPLE
Get-SQLiteTableSchema -ConnectionString "Data Source=C:\Databases\mydb.sqlite" `
    -TableName "Products"
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

        # log the start of schema retrieval operation
        Write-Verbose "Preparing to retrieve schema for table '$TableName'"
    }

    process {

        # construct the PRAGMA query to get detailed table column information
        $PSBoundParameters["Queries"] = "PRAGMA table_info($TableName)"

        # log the execution of the schema query
        Write-Verbose "Executing schema query against SQLite database"

        # execute the query and return results using existing Invoke-SQLiteQuery
        Invoke-SQLiteQuery @PSBoundParameters
    }

    end {
    }
}
################################################################################