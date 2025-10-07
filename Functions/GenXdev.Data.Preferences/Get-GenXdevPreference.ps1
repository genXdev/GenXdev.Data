<##############################################################################
Part of PowerShell module : GenXdev.Data.Preferences
Original cmdlet filename  : Get-GenXdevPreference.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.296.2025
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
################################################################################
<#
.SYNOPSIS
Retrieves a preference value from the GenXdev preferences store.

.DESCRIPTION
The function implements a two-tier preference retrieval system. It first checks
the local store for a preference value. If not found, it falls back to the
default store. If still not found, returns the provided default value.

.PARAMETER Name
The name of the preference to retrieve from the preference stores.

.PARAMETER DefaultValue
The fallback value to return if the preference is not found in any store.

.PARAMETER PreferencesDatabasePath
Database path for preference data files.

.PARAMETER SessionOnly
Use alternative settings stored in session for Data preferences like Language,
Database paths, etc.

.PARAMETER ClearSession
Clear the session setting (Global variable) before retrieving.

.PARAMETER SkipSession
Dont use alternative settings stored in session for Data preferences like
Language, Database paths, etc.

.EXAMPLE
Get-GenXdevPreference -Name "Theme" -DefaultValue "Dark"

.EXAMPLE
getPreference "Theme" "Dark"
#>
function Get-GenXdevPreference {

    [CmdletBinding(
        DefaultParameterSetName = 'Default'
    )]
    [Alias('getPreference')]
    param(
        ###############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The name of the preference to retrieve'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('PreferenceName')]
        [string] $Name,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The default value if preference is not found'
        )]
        [AllowNull()]
        [AllowEmptyString()]
        [Alias('DefaultPreference')]
        [string] $DefaultValue,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Database path for preference data files'
        )]
        [Alias('DatabasePath')]
        [string] $PreferencesDatabasePath,
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
            HelpMessage = ('Clear the session setting (Global variable) before ' +
                'retrieving')
        )]
        [switch] $ClearSession,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Dont use alternative settings stored in session for ' +
                'Data preferences like Language, Database paths, etc')
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession
        ###############################################################################
    )

    begin {

        # create global variable name for this preference
        $globalVariableName = "GenXdevPreference_$Name"

        # output verbose information about starting preference retrieval
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Starting preference retrieval for: $Name"

        # handle clearing session variables first if requested
        if ($ClearSession) {

            # clear the global variable for this preference
            Microsoft.PowerShell.Utility\Set-Variable `
                -Name $globalVariableName `
                -Value $null `
                -Scope Global `
                -Force

            # output verbose information about clearing session preference
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Cleared session preference setting: $globalVariableName"
        }
    }

    process {

        # initialize the return value
        $value = $null

        # check global variable first (unless SkipSession is specified)
        if (-not $SkipSession) {

            # attempt to get the preference value from global variable
            $globalValue = Microsoft.PowerShell.Utility\Get-Variable `
                -Name $globalVariableName `
                -Scope Global `
                -ValueOnly `
                -ErrorAction SilentlyContinue

            # return global value if found and not empty
            if (-not ([string]::IsNullOrEmpty($globalValue))) {

                # output verbose information about found session value
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Found session value for '$Name': $globalValue"

                return $globalValue
            }
        }

        # fallback to persistent preferences (unless SessionOnly is specified)
        if (-not $SessionOnly) {

            # copy parameters for database path resolution function
            $params = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Get-GenXdevPreferencesDatabasePath' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # resolve the actual database path using the helper function
            $preferencesDatabasePath = `
                GenXdev.Data\Get-GenXdevPreferencesDatabasePath @params

            # output verbose information about the database path being used
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Using database path: $preferencesDatabasePath"

            # fallback to persistent preferences when not session only
            try {

                # output verbose information about checking local store
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Checking local store for preference '$Name'"

                # copy identical parameter values for local store retrieval
                $getLocalParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                    -BoundParameters $PSBoundParameters `
                    -FunctionName 'GenXdev.Data\Get-ValueByKeyFromStore' `
                    -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                        -Scope Local `
                        -ErrorAction SilentlyContinue)

                # assign specific parameters for local store retrieval
                $getLocalParams.StoreName = 'GenXdev.PowerShell.Preferences'
                $getLocalParams.KeyName = $Name
                $getLocalParams.SynchronizationKey = 'Local'
                $getLocalParams.DatabasePath = $preferencesDatabasePath
                $getLocalParams.ErrorAction = 'Stop'

                # attempt to get value from local store
                $value = GenXdev.Data\Get-ValueByKeyFromStore @getLocalParams

                # if local store lookup failed, try defaults store
                if ([string]::IsNullOrEmpty($value)) {

                    # output verbose information about checking defaults store
                    Microsoft.PowerShell.Utility\Write-Verbose `
                        'Preference not found locally, checking defaults store'

                    # copy identical parameter values for defaults store retrieval
                    $getDefaultParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                        -BoundParameters $PSBoundParameters `
                        -FunctionName 'GenXdev.Data\Get-ValueByKeyFromStore' `
                        -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                            -Scope Local `
                            -ErrorAction SilentlyContinue)

                    # assign specific parameters for defaults store retrieval
                    $getDefaultParams.StoreName = 'GenXdev.PowerShell.Preferences'
                    $getDefaultParams.KeyName = $Name
                    $getDefaultParams.SynchronizationKey = 'Defaults'
                    $getDefaultParams.DatabasePath = $preferencesDatabasePath
                    $getDefaultParams.ErrorAction = 'Stop'

                    # attempt to get value from defaults store
                    $value = GenXdev.Data\Get-ValueByKeyFromStore @getDefaultParams
                }

                # if we found a value in persistent storage, return it
                if (-not ([string]::IsNullOrEmpty($value))) {

                    # output verbose information about returning persistent value
                    Microsoft.PowerShell.Utility\Write-Verbose `
                        "Returning persistent value: $value"

                    return $value
                }
            }
            catch {

                # output verbose information about error accessing stores
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Error accessing preference stores: $_"
            }
        }

        # output verbose information about using default value
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using provided default value: $DefaultValue"

        return $DefaultValue
    }

    end {
    }
}
################################################################################