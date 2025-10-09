<##############################################################################
Part of PowerShell module : GenXdev.Data.Preferences
Original cmdlet filename  : Set-GenXdevPreferencesDatabasePath.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
################################################################################>
###############################################################################
<#
.SYNOPSIS
Sets the database path for preferences used in GenXdev.Data operations.

.DESCRIPTION
This function configures the global database path used by the GenXdev.Data
module for various preference storage and data operations. Settings are
stored in the current session (using Global variables) and can be cleared
from the session (using -ClearSession).

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

Sets the database path in the current session (Global variable).

.EXAMPLE
Set-GenXdevPreferencesDatabasePath "C:\MyPreferences.db"

Sets the database path in the current session using positional parameter.

.EXAMPLE
Set-GenXdevPreferencesDatabasePath -DatabasePath "C:\TempPreferences.db" -SessionOnly

Sets the database path only for the current session (Global variable).

.EXAMPLE
Set-GenXdevPreferencesDatabasePath -ClearSession

Clears the session database path setting.
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

        # set global variable for storage (default behavior now)
        # confirm the operation with the user before proceeding
        if ($PSCmdlet.ShouldProcess(
                'GenXdev.Data Module Configuration',
                "Set database path to: [$PreferencesDatabasePath]"
            )) {

            # set global variable for storage
            $Global:PreferencesDatabasePath = $PreferencesDatabasePath

            # output verbose confirmation of setting
            Microsoft.PowerShell.Utility\Write-Verbose (
                ('Set database path: ' +
                "PreferencesDatabasePath = $PreferencesDatabasePath")
            )
        }
    }

    end {
    }
}
###############################################################################