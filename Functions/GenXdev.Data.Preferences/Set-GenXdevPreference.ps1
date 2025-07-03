################################################################################
<#
.SYNOPSIS
Sets a preference value in the GenXdev preferences store.

.DESCRIPTION
This function manages preferences in the GenXdev local store. It can set new
preferences, update existing ones, or remove them when a null/empty value is
provided. The preferences are stored with synchronization set to "Local".

.PARAMETER Name
Specifies the name (key) of the preference to set. This is required and must not
be null or empty.

.PARAMETER Value
Specifies the value to store for the preference. If null or empty, the preference
will be removed instead of being set.

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
Set-GenXdevPreference -Name "Theme" -Value "Dark"
Sets the "Theme" preference to "Dark" in the local store.

.EXAMPLE
setPreference Theme Light
Uses the alias and positional parameters to set the Theme preference to Light.
#>
################################################################################
function Set-GenXdevPreference {

    [CmdletBinding(
        SupportsShouldProcess = $true
    )]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
    [Alias("setPreference")]
    param(
        ################################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The name of the preference to set"
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("PreferenceName")]
        [string]$Name,
        ################################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The value to store for the preference"
        )]
        [AllowNull()]
        [AllowEmptyString()]
        [Alias("PreferenceValue")]
        [string]$Value,
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Use alternative settings stored in session for Data " +
                          "preferences like Language, Database paths, etc")
        )]
        [switch]$SessionOnly,
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Clear the session setting (Global variable) before " +
                          "retrieving")
        )]
        [switch]$ClearSession,
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Database path for preference data files"
        )]
        [string]$PreferencesDatabasePath,
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Dont use alternative settings stored in session for " +
                          "Data preferences like Language, Database paths, etc")
        )]
        [Alias("FromPreferences")]
        [switch]$SkipSession
        ################################################################################
    )

    begin {

        # copy identical parameter values to prepare for database path lookup
        $params = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName "GenXdev.Data\Get-GenXdevPreferencesDatabasePath" `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local `
                -ErrorAction SilentlyContinue)

        # resolve the actual database path using the helper function
        $PreferencesDatabasePath = `
            GenXdev.Data\Get-GenXdevPreferencesDatabasePath @params

        # create global variable name for this preference
        $globalVariableName = "GenXdevPreference_$Name"

        # output verbose information about the database path being used
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using database path: $PreferencesDatabasePath"

        # output verbose information about starting preference operation
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Beginning preference operation for preference name: '$Name'")
    }


    process {

        # handle clearing session variables
        if ($ClearSession) {

            # confirm the operation with the user before proceeding
            if ($PSCmdlet.ShouldProcess(
                "GenXdev.Data Preference Configuration",
                "Clear session preference setting: $Name"
            )) {

                # clear the global variable
                Microsoft.PowerShell.Utility\Set-Variable `
                    -Name $globalVariableName `
                    -Value $null `
                    -Scope Global `
                    -Force

                # output verbose confirmation of session clearing
                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Cleared session preference setting: $globalVariableName")
            }
            return
        }

        # handle session-only storage
        if ($SessionOnly) {

            # confirm the operation with the user before proceeding
            if ($PSCmdlet.ShouldProcess(
                "GenXdev.Data Preference Configuration",
                "Set session-only preference '$Name' to: [$Value]"
            )) {

                # set global variable for session-only storage
                Microsoft.PowerShell.Utility\Set-Variable `
                    -Name $globalVariableName `
                    -Value $Value `
                    -Scope Global `
                    -Force

                # output verbose confirmation of session-only setting
                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Set session-only preference: $globalVariableName = $Value")
            }
            return
        }

        # handle persistent storage (default behavior)
        # check if preference should be removed due to null/empty value
        if ([string]::IsNullOrWhiteSpace($Value)) {

            # confirm the operation with the user before proceeding with removal
            if ($PSCmdlet.ShouldProcess(
                "GenXdev.Data Preference Configuration",
                "Remove preference '$Name' from persistent storage"
            )) {

                # copy identical parameter values for Remove-GenXdevPreference
                $removeParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                    -BoundParameters $PSBoundParameters `
                    -FunctionName "GenXdev.Data\Remove-GenXdevPreference" `
                    -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                        -Scope Local `
                        -ErrorAction SilentlyContinue)

                # assign specific parameters for the removal operation
                $removeParams.Name = $Name
                $removeParams.SkipSession = $true  # we handle session separately

                # remove the preference from the local store
                GenXdev.Data\Remove-GenXdevPreference @removeParams

                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Successfully removed preference '$Name'"
            }
            return
        }

        # store the preference if user confirms the action
        if ($PSCmdlet.ShouldProcess(
            "GenXdev.Data Preference Configuration",
            "Set preference '$Name' to: [$Value]"
        )) {

            # copy identical parameter values for Set-ValueByKeyInStore
            $setParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName "GenXdev.Data\Set-ValueByKeyInStore" `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # assign specific parameters for the set operation
            $setParams.StoreName = "GenXdev.PowerShell.Preferences"
            $setParams.KeyName = $Name
            $setParams.Value = $Value
            $setParams.SynchronizationKey = "Local"
            $setParams.DatabasePath = $PreferencesDatabasePath

            # store the preference value in the database store
            GenXdev.Data\Set-ValueByKeyInStore @setParams

            Microsoft.PowerShell.Utility\Write-Verbose `
                "Successfully configured preference '$Name' in GenXdev.Data module: [$Value]"
        }
    }

    end {
    }
}
################################################################################