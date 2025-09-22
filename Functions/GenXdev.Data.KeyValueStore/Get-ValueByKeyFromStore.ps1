<##############################################################################
Part of PowerShell module : GenXdev.Data.KeyValueStore
Original cmdlet filename  : Get-ValueByKeyFromStore.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.280.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
###############################################################################
<#
.SYNOPSIS
Retrieves a value from a key-value store database.

.DESCRIPTION
Retrieves a value for a specified key from a SQLite-based key-value store. The
function supports optional default values and synchronization across different
scopes. It can use session-based settings or direct database access and
provides automatic database initialization and synchronization capabilities.

.PARAMETER StoreName
The name of the key-value store to query.

.PARAMETER KeyName
The key whose value should be retrieved.

.PARAMETER DefaultValue
Optional default value to return if the key is not found.

.PARAMETER SynchronizationKey
Optional key to identify synchronization scope. Defaults to "Local".

.PARAMETER SessionOnly
Use alternative settings stored in session for Data preferences like Language,
Database paths, etc.

.PARAMETER ClearSession
Clear the session setting (Global variable) before retrieving.

.PARAMETER DatabasePath
Database path for key-value store data files.

.PARAMETER SkipSession
Dont use alternative settings stored in session for Data preferences like
Language, Database paths, etc.

.EXAMPLE
Get-ValueByKeyFromStore -StoreName "AppSettings" -KeyName "Theme" `
    -DefaultValue "Dark"

.EXAMPLE
getvalue AppSettings Theme
#>
function Get-ValueByKeyFromStore {

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    [OutputType([System.String])]
    [Alias('getvalue')]

    param (
        ###############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = 'Default',
            HelpMessage = 'Name of the store to retrieve the key from'
        )]
        [string]$StoreName,
        ###############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            ParameterSetName = 'Default',
            HelpMessage = 'Key to retrieve from the specified store'
        )]
        [string]$KeyName,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            ParameterSetName = 'Default',
            HelpMessage = 'A optional default value'
        )]
        [string]$DefaultValue = $null,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 3,
            ParameterSetName = 'Default',
            HelpMessage = 'Key to identify synchronization scope'
        )]
        [string]$SynchronizationKey = 'Local',
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Database path for key-value store data files'
        )]
        [string]$DatabasePath,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Use alternative settings stored in session for Data ' +
                'preferences like Language, Database paths, etc')
        )]
        [switch]$SessionOnly,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Clear the session setting (Global variable) before ' +
                'retrieving')
        )]
        [switch]$ClearSession,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Dont use alternative settings stored in session for ' +
                'Data preferences like Language, Database paths, etc')
        )]
        [Alias('FromPreferences')]
        [switch]$SkipSession
        ###############################################################################
    )

    begin {

        # check if custom database path was provided
        if ([string]::IsNullOrWhiteSpace($DatabasePath)) {

            # use default database path in local app data folder
            $databaseFilePath = GenXdev.FileSystem\Expand-Path `
            ("$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\" +
                'KeyValueStores.sqlite.db') `
                -CreateDirectory
        }
        else {

            # expand provided database path and ensure directory exists
            $databaseFilePath = GenXdev.FileSystem\Expand-Path $DatabasePath `
                -CreateDirectory
        }

        # output database location for debugging purposes
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using database at: $databaseFilePath"
    }


    process {

        # check if database file exists and initialize if needed
        if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $databaseFilePath)) {

            # log database initialization activity
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Database not found, initializing...'

            # copy identical parameter values for initialize function
            $initParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Initialize-KeyValueStores' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # initialize the key-value store database
            GenXdev.Data\Initialize-KeyValueStores @initParams
        }

        # synchronize with external store when not using local scope
        if ($SynchronizationKey -ne 'Local') {

            # log synchronization activity
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Syncing store with key: $SynchronizationKey"

            # copy identical parameter values for sync function
            $syncParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Sync-KeyValueStore' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # assign synchronization key for external store sync
            $syncParams.SynchronizationKey = $SynchronizationKey

            # execute synchronization to align with external store
            GenXdev.Data\Sync-KeyValueStore @syncParams
        }

        # define sql query to retrieve value from key-value store
        $sqlQuery = @'
SELECT value
FROM KeyValueStore
WHERE storeName = @storeName
AND keyName = @keyName
AND synchronizationKey = @syncKey
AND deletedDate IS NULL;
'@

        # prepare parameters for database query
        $params = @{
            'storeName' = $StoreName
            'keyName'   = $KeyName
            'syncKey'   = $SynchronizationKey
        }

        # log the query operation details
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Querying store '$StoreName' for key '$KeyName'"

        # copy identical parameter values for query function
        $queryParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Data\Invoke-SQLiteQuery' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local `
                -ErrorAction SilentlyContinue)

        # set database file path for query execution
        $queryParams.DatabaseFilePath = $databaseFilePath

        # set sql query text for execution
        $queryParams.Queries = $sqlQuery

        # set parameters for sql query placeholders
        $queryParams.SqlParameters = $params

        # execute database query to retrieve the value
        $result = GenXdev.Data\Invoke-SQLiteQuery @queryParams

        # determine return value based on query result
        if ($result) {

            # log successful value retrieval
            Microsoft.PowerShell.Utility\Write-Verbose 'Value found'

            # return the retrieved value from database
            return $result.value
        }
        else {

            # log fallback to default value
            Microsoft.PowerShell.Utility\Write-Verbose `
                'No value found, returning default'

            # return the specified default value
            return $DefaultValue
        }
    }

    end {
    }
}
###############################################################################