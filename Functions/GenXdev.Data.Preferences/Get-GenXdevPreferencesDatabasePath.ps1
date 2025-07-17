<#
.SYNOPSIS
Gets the configured database path for preference data files used in GenXdev.Data operations.

.DESCRIPTION
This function retrieves the global database path used by the GenXdev.Data module for various preference storage and data operations. It checks Global variables first (unless SkipSession is specified), then falls back to a JSON configuration file, and finally uses system defaults.

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

Gets the configured database path only from the JSON configuration file, ignoring any session setting.

.EXAMPLE
Get-GenXdevPreferencesDatabasePath -ClearSession

Clears the session database path setting and then gets the path from the JSON configuration file.

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

        # check global variable first (unless SkipSession is specified), then fall back to preferences (unless SessionOnly is specified)
        if ((-not $SkipSession) -and (-not ([string]::IsNullOrWhiteSpace($Global:PreferencesDatabasePath)))) {

            $resolvedDatabasePath = $Global:PreferencesDatabasePath
            return
        }

        if (-not $SessionOnly) {

            try {

                # read from JSON file instead of preferences to avoid infinite loop
                $jsonPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\defaultdblocation.json"

                if (Microsoft.PowerShell.Management\Test-Path $jsonPath) {
                    $jsonContent = Microsoft.PowerShell.Management\Get-Content $jsonPath -Raw | Microsoft.PowerShell.Utility\ConvertFrom-Json
                    $resolvedDatabasePath = $jsonContent.PreferencesDatabasePath
                }
                else {
                    $resolvedDatabasePath = $null
                }
            }
            catch {

                $resolvedDatabasePath = $null
            }

            # use configured path or fallback to default
            if ([string]::IsNullOrWhiteSpace($resolvedDatabasePath)) {

                # fallback to default path
                $resolvedDatabasePath = GenXdev.FileSystem\Expand-Path `
                    "$($Env:LOCALAPPDATA)\GenXdev\Preferences.db" `
                    -CreateDirectory
            }
            if (-not [string]::IsNullOrWhiteSpace($resolvedDatabasePath)) {
                return;
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
