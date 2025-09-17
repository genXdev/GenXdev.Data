<##############################################################################
Part of PowerShell module : GenXdev.Data.Preferences
Original cmdlet filename  : Set-GenXdevDefaultPreference.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.272.2025
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
Sets a default preference value in the GenXdev preferences store.

.DESCRIPTION
This function manages default preferences in the GenXdev preference system. It
handles storing values, removing preferences when values are empty, and ensures
changes are synchronized across the system. The function supports null values by
removing the preference entirely in such cases. When a value is provided, it is
stored in the key-value store and synchronized across all consumers.

.PARAMETER Name
Specifies the name (key) of the preference to set in the default store. This
parameter is required and cannot be null or empty.

.PARAMETER Value
Specifies the value to store for the preference. Can be null or empty, which
will result in removing the preference from the store.

.PARAMETER PreferencesDatabasePath
Database path for preference data files. This parameter is optional and can
be used to override the default database path.

.PARAMETER SessionOnly
Use alternative settings stored in session for Data preferences like Language,
Database paths, etc.

.PARAMETER ClearSession
Clear the session setting (Global variable) before retrieving.

.PARAMETER SkipSession
Dont use alternative settings stored in session for Data preferences like
Language, Database paths, etc.

.EXAMPLE
Set-GenXdevDefaultPreference -Name "Theme" -Value "Dark"
Sets the default theme preference to "Dark".

.EXAMPLE
setPreferenceDefault "EmailNotifications" "Disabled"
Uses the alias to disable email notifications in defaults.
#>
###############################################################################
function Set-GenXdevDefaultPreference {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('setPreferenceDefault')]

    param(
        #######################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The name of the preference to set in defaults'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('PreferenceName')]
        [string]$Name,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The value to store for the preference'
        )]
        [AllowNull()]
        [AllowEmptyString()]
        [Alias('PreferenceValue')]
        [string]$Value,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = 'Database path for preference data files'
        )]
        [Alias('DatabasePath')]
        [string]$PreferencesDatabasePath,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use alternative settings stored in session for Data preferences like Language, Database paths, etc'
        )]
        [switch]$SessionOnly,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Clear the session setting (Global variable) before retrieving'
        )]
        [switch]$ClearSession,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc'
        )]
        [Alias('FromPreferences')]
        [switch]$SkipSession
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

        # output verbose information about the operation start
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Starting Set-GenXdevDefaultPreference for '$Name'"
    }

    process {

        # check if the value is null, empty, or whitespace only
        if ([string]::IsNullOrWhiteSpace($Value)) {

            # output verbose information about preference removal
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Removing default preference '$Name' as value is empty"

            # check if we should proceed with the removal operation
            if ($PSCmdlet.ShouldProcess($Name, 'Remove default preference')) {

                # copy identical parameter values for Remove-GenXdevPreference
                $removeParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                    -BoundParameters $PSBoundParameters `
                    -FunctionName 'GenXdev.Data\Remove-GenXdevPreference' `
                    -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                        -Scope Local `
                        -ErrorAction SilentlyContinue)

                # assign specific parameters for the removal operation
                $removeParams.Name = $Name
                $removeParams.RemoveDefault = $true

                # remove the preference from the default store
                GenXdev.Data\Remove-GenXdevPreference @removeParams
            }

            # exit early as removal is complete
            return
        }

        # output verbose information about preference setting
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Setting default preference '$Name' to: $Value"

        # check if we should proceed with the setting operation
        if ($PSCmdlet.ShouldProcess($Name, 'Set default preference')) {

            # copy identical parameter values for Set-ValueByKeyInStore
            $setParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Set-ValueByKeyInStore' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # assign specific parameters for the set operation
            $setParams.StoreName = 'GenXdev.PowerShell.Preferences'
            $setParams.KeyName = $Name
            $setParams.Value = $Value
            $setParams.SynchronizationKey = 'Defaults'
            $setParams.DatabasePath = $PreferencesDatabasePath

            # store the preference value in the key-value store
            GenXdev.Data\Set-ValueByKeyInStore @setParams

            # copy identical parameter values for Sync-KeyValueStore
            $syncParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Sync-KeyValueStore' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # assign specific parameters for the sync operation
            $syncParams.SynchronizationKey = 'Defaults'
            $syncParams.DatabasePath = $PreferencesDatabasePath

            # synchronize the key-value store to ensure consistency
            $null = GenXdev.Data\Sync-KeyValueStore @syncParams

            # output verbose information about successful operation
            Microsoft.PowerShell.Utility\Write-Verbose `
            ("Successfully stored and synchronized preference '$Name'")
        }
    }

    end {
    }
}
###############################################################################