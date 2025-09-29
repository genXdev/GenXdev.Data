<##############################################################################
Part of PowerShell module : GenXdev.Data.Preferences
Original cmdlet filename  : Get-GenXdevPreferencesDatabasePath.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.288.2025
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
<#
.SYNOPSIS
Gets the configured database path for preference data files used in GenXdev.Data operations.

.DESCRIPTION
This function retrieves the global database path used by the GenXdev.Data module for various preference storage and data operations. It checks Global variables first (unless SkipSession is specified), then uses system defaults.

.PARAMETER DatabasePath
Optional database path override. If specified, this path will be returned instead of retrieving from configuration.

.PARAMETER ClearSession
When specified, clears the session database path setting (Global variable) before retrieving the configuration.

.PARAMETER SkipSession
When specified, skips checking the session setting (Global variable) and retrieves only from persistent preferences.

.EXAMPLE
Get-GenXdevPreferencesDatabasePath

Gets the currently configured database path from Global variables or preferences.

.EXAMPLE
Get-GenXdevPreferencesDatabasePath -SkipSession

Gets the configured database path using system defaults, ignoring any session setting.

.EXAMPLE
Get-GenXdevPreferencesDatabasePath -ClearSession

Clears the session database path setting and then gets the path using system defaults.

.EXAMPLE
Get-GenXdevPreferencesDatabasePath "C:\MyPreferences.db"

Returns the specified path after expanding the path.
#>
function Get-GenXdevPreferencesDatabasePath {

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
    param(
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = 'Database path for preference data files'
        )]
        [Alias('DatabasePath')]
        [string] $PreferencesDatabasePath,
        ###############################################################################
        # Use alternative settings stored in session for Data preferences like Language, Database paths, etc
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use alternative settings stored in session for Data preferences like Language, Database paths, etc'
        )]
        [switch] $SessionOnly,
        ###############################################################################
        # clear the session setting (Global variable) before retrieving
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Clear the session setting (Global variable) before retrieving'
        )]
        [switch] $ClearSession,
        ###############################################################################
        # Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc'
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession
    )
    begin {

        # handle clearing session variables first if requested
        if ($ClearSession) {
            $Global:PreferencesDatabasePath = $null
            Microsoft.PowerShell.Utility\Write-Verbose (
                'Cleared session database path setting: PreferencesDatabasePath'
            )
        }

        # get configured database path from preference store
        $resolvedDatabasePath = $null

        if (-not ([string]::IsNullOrWhiteSpace($PreferencesDatabasePath))) {

            $resolvedDatabasePath = GenXdev.FileSystem\Expand-Path "$PreferencesDatabasePath" -CreateDirectory
            return
        }

        # check global variable first (unless SkipSession is specified), then fall back to default (unless SessionOnly is specified)
        if ((-not $SkipSession) -and (-not ([string]::IsNullOrWhiteSpace($Global:PreferencesDatabasePath)))) {

            $resolvedDatabasePath = $Global:PreferencesDatabasePath
            return
        }

        if (-not $SessionOnly) {

            # use default path since no session variable or JSON file
            $resolvedDatabasePath = GenXdev.FileSystem\Expand-Path `
                "$($Env:LOCALAPPDATA)\GenXdev\Preferences.db" `
                -CreateDirectory

            if (-not [string]::IsNullOrWhiteSpace($resolvedDatabasePath)) {
                return
            }
        }
        # SessionOnly is specified but no session variable found, use default
        $resolvedDatabasePath = GenXdev.FileSystem\Expand-Path `
            "$($Env:LOCALAPPDATA)\GenXdev\Preferences.db" `
            -CreateDirectory

    }

    end {
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using provided database path: $resolvedDatabasePath"

        Microsoft.PowerShell.Utility\Write-Output (GenXdev.FileSystem\Expand-Path "$resolvedDatabasePath")
    }
}