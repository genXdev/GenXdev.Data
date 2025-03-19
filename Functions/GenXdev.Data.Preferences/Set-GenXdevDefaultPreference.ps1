################################################################################
<#
.SYNOPSIS
Sets a default preference value in the GenXdev preferences store.

.DESCRIPTION
This function manages default preferences in the GenXdev preference system. It
handles storing values, removing preferences when values are empty, and ensures
changes are synchronized across the system. The function supports null values by
removing the preference entirely in such cases.

.PARAMETER Name
Specifies the name (key) of the preference to set in the default store. This
parameter is required and cannot be null or empty.

.PARAMETER Value
Specifies the value to store for the preference. Can be null or empty, which
will result in removing the preference from the store.

.EXAMPLE
Set-GenXdevDefaultPreference -Name "Theme" -Value "Dark"
# Sets the default theme preference to "Dark"

.EXAMPLE
setPreferenceDefault "EmailNotifications" "Disabled"
# Uses the alias to disable email notifications in defaults
#>
function Set-GenXdevDefaultPreference {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("setPreferenceDefault")]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The name of the preference to set in defaults"
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("PreferenceName")]
        [string]$Name,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The value to store for the preference"
        )]
        [AllowNull()]
        [AllowEmptyString()]
        [Alias("PreferenceValue")]
        [string]$Value
        ########################################################################
    )

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Starting Set-GenXdevDefaultPreference for '$Name'"
    }

    process {

        if ([string]::IsNullOrWhiteSpace($Value)) {

            Microsoft.PowerShell.Utility\Write-Verbose "Removing default preference '$Name' as value is empty"

            if ($PSCmdlet.ShouldProcess($Name, "Remove default preference")) {

                GenXdev.Data\Remove-GenXdevPreference -Name $Name -RemoveDefault
            }

            return
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Setting default preference '$Name' to: $Value"

        if ($PSCmdlet.ShouldProcess($Name, "Set default preference")) {

            GenXdev.Data\Set-ValueByKeyInStore `
                -StoreName "GenXdev.PowerShell.Preferences" `
                -KeyName $Name `
                -Value $Value `
                -SynchronizationKey "Defaults"

            $null = GenXdev.Data\Sync-KeyValueStore -SynchronizationKey "Defaults"

            Microsoft.PowerShell.Utility\Write-Verbose "Successfully stored and synchronized preference '$Name'"
        }
    }

    end {
    }
}
################################################################################