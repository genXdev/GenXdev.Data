###############################################################################
<#
.SYNOPSIS
Sets the database path for preferences used in GenXdev.Data operations.

.DESCRIPTION
This function configures the global database path used by the GenXdev.Data
module for various preference storage and data operations. Settings can be
stored persistently in a JSON file (default), only in the current session
(using -SessionOnly), or cleared from the session (using -ClearSession).

.PARAMETER PreferencesDatabasePath
A database path where preference data files are located. This path will be used
by GenXdev.Data functions for preference storage and processing operations.

.PARAMETER SkipSession
Dont use alternative settings stored in session for Data preferences like
Language, Database paths, etc.

.PARAMETER SessionOnly
When specified, stores the setting only in the current session (Global
variable) without persisting to preferences. Setting will be lost when the
session ends.

.PARAMETER ClearSession
When specified, clears only the session setting (Global variable) without
affecting persistent preferences.

.EXAMPLE
Set-GenXdevPreferencesDatabasePath -PreferencesDatabasePath "C:\Data\Preferences.db"

Sets the database path persistently in a JSON file.

.EXAMPLE
Set-GenXdevPreferencesDatabasePath "C:\MyPreferences.db"

Sets the database path persistently in a JSON file using positional parameter.

.EXAMPLE
Set-GenXdevPreferencesDatabasePath -DatabasePath "C:\TempPreferences.db" -SessionOnly

Sets the database path only for the current session (Global variable).

.EXAMPLE
Set-GenXdevPreferencesDatabasePath -ClearSession

Clears the session database path setting without affecting persistent
preferences.
#>
###############################################################################
function Set-GenXdevPreferencesDatabasePath {

    [CmdletBinding(SupportsShouldProcess)]
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
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Dont use alternative settings stored in session for ' +
                'Data preferences like Language, Database paths, etc')
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Use alternative settings stored in session for Data ' +
                'preferences like Language, Database paths, etc')
        )]
        [switch] $SessionOnly,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Clear alternative settings stored in session for Data ' +
                'preferences like Language, Database paths, etc')
        )]
        [switch] $ClearSession
        ###############################################################################
    )

    begin {

        # validate parameters - database path is required unless clearing session
        if ((-not $ClearSession) -and
            [string]::IsNullOrWhiteSpace($PreferencesDatabasePath)) {

            throw ('PreferencesDatabasePath parameter is required when not ' +
                'using -ClearSession')
        }

        # expand path only if not clearing session
        if (-not $ClearSession) {

            # expand and validate the database path with directory creation
            $PreferencesDatabasePath = GenXdev.FileSystem\Expand-Path `
                "$PreferencesDatabasePath" `
                -CreateDirectory

            # display verbose information about the database path being
            # configured
            Microsoft.PowerShell.Utility\Write-Verbose (
                'Setting database path for GenXdev.Data module: ' +
                "[$PreferencesDatabasePath]"
            )
        }
    }

    process {

        # handle clearing session variables
        if ($ClearSession) {

            # confirm the operation with the user before proceeding
            if ($PSCmdlet.ShouldProcess(
                    'GenXdev.Data Module Configuration',
                    'Clear session database path setting (Global variable)'
                )) {

                # clear the global variable
                $Global:PreferencesDatabasePath = $null

                # output verbose confirmation of session clearing
                Microsoft.PowerShell.Utility\Write-Verbose (
                    'Cleared session database path setting: ' +
                    'PreferencesDatabasePath'
                )
            }
            return
        }

        # handle session-only storage
        if ($SessionOnly) {

            # confirm the operation with the user before proceeding
            if ($PSCmdlet.ShouldProcess(
                    'GenXdev.Data Module Configuration',
                ('Set session-only database path to: ' +
                    "[$PreferencesDatabasePath]")
                )) {

                # set global variable for session-only storage
                $Global:PreferencesDatabasePath = $PreferencesDatabasePath

                # output verbose confirmation of session-only setting
                Microsoft.PowerShell.Utility\Write-Verbose (
                    ('Set session-only database path: ' +
                    "PreferencesDatabasePath = $PreferencesDatabasePath")
                )
            }
            return
        }

        # handle persistent storage (default behavior)
        # confirm the operation with the user before proceeding with changes
        if ($PSCmdlet.ShouldProcess(
                'GenXdev.Data Module Configuration',
                "Set database path to: [$PreferencesDatabasePath]"
            )) {

            # build the path for the json configuration file
            $jsonPath = GenXdev.FileSystem\Expand-Path `
                "$PSScriptRoot\defaultdblocation.json"

            # create the configuration data structure
            $jsonData = @{
                PreferencesDatabasePath = $PreferencesDatabasePath
            }

            # convert to json and save to file to avoid infinite loop
            $null = $jsonData |
                Microsoft.PowerShell.Utility\ConvertTo-Json -Depth 20 |
                Microsoft.PowerShell.Management\Set-Content -Path $jsonPath -Force

            # output confirmation message about successful configuration
            Microsoft.PowerShell.Utility\Write-Verbose (
                ('Successfully configured database path in GenXdev.Data ' +
                "module: [$PreferencesDatabasePath]")
            )
        }
    }

    end {
    }
}
###############################################################################
