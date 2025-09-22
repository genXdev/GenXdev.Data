<##############################################################################
Part of PowerShell module : GenXdev.Data.Preferences
Original cmdlet filename  : Get-GenXdevPreferenceNames.ps1
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
Gets all preference names from session storage and database stores.

.DESCRIPTION
Retrieves a unique list of preference names by combining keys from session
storage (global variables) and both the local and default preference stores.
The function respects session management parameters to control which sources
are queried.

The function first checks session storage (unless SkipSession is specified),
then falls back to database stores (unless SessionOnly is specified). It
merges all keys, removes duplicates, sorts them alphabetically, and returns
the combined list.

This function is useful when you need to see all available preference settings,
regardless of whether they are stored in session or persistent storage.

.PARAMETER SessionOnly
Use alternative settings stored in session for Data preferences like Language,
Database paths, etc.

.PARAMETER ClearSession
Clear the session setting (Global variable) before retrieving.

.PARAMETER PreferencesDatabasePath
Database path for preference data files.

.PARAMETER SkipSession
Dont use alternative settings stored in session for Data preferences like
Language, Database paths, etc.

.EXAMPLE
Get-GenXdevPreferenceNames -PreferencesDatabasePath "C:\Data\prefs.db"
Returns: A sorted array of unique preference names from session storage and
both local and default stores using the specified database path.

.EXAMPLE
getPreferenceNames -SessionOnly
Returns only preference names from session storage, ignoring database stores.

.EXAMPLE
getPreferenceNames -SkipSession
Returns only preference names from database stores, ignoring session storage.
#>
###############################################################################
function Get-GenXdevPreferenceNames {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [Alias('getPreferenceNames')]

    param(
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Use alternative settings stored in session for Data ' +
                'preferences like Language, Database paths, etc')
        )]
        [switch] $SessionOnly,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Clear the session setting (Global variable) before ' +
                'retrieving')
        )]
        [switch] $ClearSession,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Database path for preference data files'
        )]
        [Alias('DatabasePath')]
        [string] $PreferencesDatabasePath,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Dont use alternative settings stored in session for ' +
                'Data preferences like Language, Database paths, etc')
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession
    )

    begin {

        # copy identical parameter values to prepare for database path lookup
        $params = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Data\Get-GenXdevPreferencesDatabasePath' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local `
                -ErrorAction SilentlyContinue)

        # resolve the actual database path using the helper function
        $PreferencesDatabasePath = `
            GenXdev.Data\Get-GenXdevPreferencesDatabasePath @params

        # output verbose information about the database path being used
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using database path: $PreferencesDatabasePath"

        # log the start of the operation
        Microsoft.PowerShell.Utility\Write-Verbose `
            'Starting retrieval of preference names from all stores'

        # handle clearing session variables first if requested
        if ($ClearSession) {
            # get all current GenXdev preference variables to clear them
            $prefVars = Microsoft.PowerShell.Utility\Get-Variable `
                -Name 'GenXdevPreference_*' `
                -Scope Global `
                -ErrorAction SilentlyContinue

            foreach ($var in $prefVars) {
                Microsoft.PowerShell.Utility\Set-Variable `
                    -Name $var.Name `
                    -Value $null `
                    -Scope Global `
                    -Force
            }

            if ($prefVars.Count -gt 0) {
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Cleared $($prefVars.Count) session preference variables"
            }
        }
    }

    process {

        $allKeys = @()

        # check session storage first (unless SkipSession is specified)
        if (-not $SkipSession) {
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Checking session variables for preference names'

            # get all GenXdev preference variables from global scope
            $sessionVars = Microsoft.PowerShell.Utility\Get-Variable `
                -Name 'GenXdevPreference_*' `
                -Scope Global `
                -ErrorAction SilentlyContinue

            # extract preference names from variable names
            $sessionKeys = $sessionVars | Microsoft.PowerShell.Core\Where-Object {
                (-not [string]::IsNullOrEmpty($_.Value)) -and
                ($_.Name -match '^GenXdevPreference_(.+)$')
            } | Microsoft.PowerShell.Core\ForEach-Object {
                $Matches[1]
            }

            if ($sessionKeys.Count -gt 0) {
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Found $($sessionKeys.Count) preference names in session storage"
                $allKeys += $sessionKeys
            }
        }

        # fallback to persistent preferences (unless SessionOnly is specified)
        if (-not $SessionOnly) {
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Retrieving preference names from database stores'

            # retrieve all preference keys from the local preferences store
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Retrieving keys from local preferences store'

            # copy identical parameter values for Get-StoreKeys (local)
            $getLocalKeysParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Get-StoreKeys' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # assign specific parameters for local store keys retrieval
            $getLocalKeysParams.StoreName = 'GenXdev.PowerShell.Preferences'
            $getLocalKeysParams.SynchronizationKey = 'Local'
            $getLocalKeysParams.DatabasePath = $PreferencesDatabasePath

            # get keys from local store
            $localKeys = GenXdev.Data\Get-StoreKeys @getLocalKeysParams

            if ($localKeys.Count -gt 0) {
                $allKeys += $localKeys
            }

            # retrieve all preference keys from the default preferences store
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Retrieving keys from default preferences store'

            # copy identical parameter values for Get-StoreKeys (defaults)
            $getDefaultKeysParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Get-StoreKeys' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # assign specific parameters for defaults store keys retrieval
            $getDefaultKeysParams.StoreName = 'GenXdev.PowerShell.Preferences'
            $getDefaultKeysParams.SynchronizationKey = 'Defaults'
            $getDefaultKeysParams.DatabasePath = $PreferencesDatabasePath

            # get keys from defaults store
            $defaultKeys = GenXdev.Data\Get-StoreKeys @getDefaultKeysParams

            if ($defaultKeys.Count -gt 0) {
                $allKeys += $defaultKeys
            }
        }

        # combine all keys, remove duplicates, and sort alphabetically
        Microsoft.PowerShell.Utility\Write-Verbose `
            'Merging and deduplicating keys from all sources'

        # create unique sorted array from all key collections
        $uniqueKeys = $allKeys |
            Microsoft.PowerShell.Utility\Select-Object -Unique |
            Microsoft.PowerShell.Utility\Sort-Object

        # log the total number of unique preferences found
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Found $($uniqueKeys.Count) unique preference names"

        # return the combined and sorted list of preference names
        return $uniqueKeys
    }

    end {
    }
}
###############################################################################