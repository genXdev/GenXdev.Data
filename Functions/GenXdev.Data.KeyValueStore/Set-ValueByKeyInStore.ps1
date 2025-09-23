<##############################################################################
Part of PowerShell module : GenXdev.Data.KeyValueStore
Original cmdlet filename  : Set-ValueByKeyInStore.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.286.2025
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
Manages key-value pairs in a SQLite database store.

.DESCRIPTION
Provides persistent storage for key-value pairs using SQLite. Handles both
insertion of new entries and updates to existing ones. Supports optional
synchronization for non-local stores. This function implements an upsert
operation that either inserts new key-value pairs or updates existing ones
based on the combination of synchronization key, store name, and key name.

.PARAMETER StoreName
The name of the store where the key-value pair will be saved.

.PARAMETER KeyName
The unique identifier for the value within the specified store.

.PARAMETER Value
The data to be stored, associated with the specified key.

.PARAMETER SynchronizationKey
Identifies the synchronization scope. Use "Local" for local-only storage.
Defaults to "Local". Non-local values trigger store synchronization.

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
Set-ValueByKeyInStore -StoreName "ConfigStore" -KeyName "ApiEndpoint" `
    -Value "https://api.example.com"

.EXAMPLE
setvalue ConfigStore ApiEndpoint "https://api.example.com"
#>
function Set-ValueByKeyInStore {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('setvalue')]

    param (
        ###############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'Store name for the key-value pair'
        )]
        [string]$StoreName,
        ###############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = 'Name of the key to set or update'
        )]
        [string]$KeyName,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = 'Value to be stored'
        )]
        [string]$Value,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 3,
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
            HelpMessage = 'Use alternative settings stored in session for Data preferences like Language, Database paths, etc'
        )]
        [switch]$SessionOnly,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Clear the session setting (Global variable) before retrieving'
        )]
        [switch]$ClearSession,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc'
        )]
        [Alias('FromPreferences')]
        [switch]$SkipSession
        ###############################################################################
    )

    begin {

        # use provided database path or default to local app data
        if ([string]::IsNullOrWhiteSpace($DatabasePath)) {

            $databaseFilePath = GenXdev.FileSystem\Expand-Path `
            ("$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\" +
                'KeyValueStores.sqlite.db') `
                -CreateDirectory
        }
        else {

            $databaseFilePath = GenXdev.FileSystem\Expand-Path $DatabasePath `
                -CreateDirectory
        }

        Microsoft.PowerShell.Utility\Write-Verbose (
            "Using database at: $databaseFilePath")
    }

    process {

        # ensure database exists before attempting operations
        if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $databaseFilePath)) {

            Microsoft.PowerShell.Utility\Write-Verbose (
                'Database not found. Initializing...')

            # copy identical parameter values for Initialize-KeyValueStores
            $initParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Initialize-KeyValueStores' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

                GenXdev.Data\Initialize-KeyValueStores @initParams
        }

        # get current user identity for audit trail purposes
        $lastModifiedBy = "$env:COMPUTERNAME\$env:USERNAME"

        Microsoft.PowerShell.Utility\Write-Verbose (
            "Setting value as user: $lastModifiedBy")

        # prepare sql query for upsert operation (insert or update)
        $sqlQuery = @'
INSERT INTO KeyValueStore (
    synchronizationKey,
    storeName,
    keyName,
    value,
    lastModified,
    lastModifiedBy,
    deletedDate
)
VALUES (
    @syncKey,
    @storeName,
    @keyName,
    @value,
    CURRENT_TIMESTAMP,
    @modifiedBy,
    NULL
)
ON CONFLICT(synchronizationKey, storeName, keyName)
DO UPDATE SET
    value = excluded.value,
    lastModified = CURRENT_TIMESTAMP,
    lastModifiedBy = excluded.lastModifiedBy,
    deletedDate = NULL;
'@

        # prepare parameters for sql query execution
        $params = @{
            'syncKey'    = $SynchronizationKey
            'storeName'  = $StoreName
            'keyName'    = $KeyName
            'value'      = $Value
            'modifiedBy' = $lastModifiedBy
        }

        # only proceed if user confirms or -WhatIf is not used
        if ($PSCmdlet.ShouldProcess(
                "Store: $StoreName, Key: $KeyName",
                "Set value to: $Value")) {

            Microsoft.PowerShell.Utility\Write-Verbose (
                "Executing upsert for key '$KeyName' in store '$StoreName'")

            # copy identical parameter values for Invoke-SQLiteQuery
            $queryParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Invoke-SQLiteQuery' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # assign specific parameters for the database operation
            $queryParams.DatabaseFilePath = $databaseFilePath
            $queryParams.Queries = $sqlQuery
            $queryParams.SqlParameters = $params

                # execute the upsert operation against the database
                GenXdev.Data\Invoke-SQLiteQuery @queryParams

            # handle synchronization for non-local stores
            if ($SynchronizationKey -ne 'Local') {

                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Synchronizing non-local store: $SynchronizationKey")

                # copy identical parameter values for Sync-KeyValueStore
                $syncParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                    -BoundParameters $PSBoundParameters `
                    -FunctionName 'GenXdev.Data\Sync-KeyValueStore' `
                    -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                        -Scope Local `
                        -ErrorAction SilentlyContinue)

                # assign specific parameters for synchronization
                $syncParams.SynchronizationKey = $SynchronizationKey

                    # trigger the synchronization process
                    GenXdev.Data\Sync-KeyValueStore @syncParams
            }
        }
    }

    end {
    }
}