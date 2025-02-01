################################################################################
<#
.SYNOPSIS
Sets a default preference value in the GenXdev preferences store.

.DESCRIPTION
This function sets a preference value in the default store and synchronizes it
to ensure the changes are propagated across the system.

.PARAMETER Name
The name of the preference to set in the default store.

.PARAMETER Value
The value to store for the preference.

.EXAMPLE
Set-GenXdevDefaultPreference -Name "Theme" -Value "Dark"

.EXAMPLE
Set-GenXdevDefaultPreference "Theme" "Light"
#>
function Set-GenXdevDefaultPreference {

    [CmdletBinding()]
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

        # log the operation being performed
        Write-Verbose "Setting default preference '$Name' to value: $Value"
    }

    process {

        # handle null or whitespace value by removing the preference
        if ([string]::IsNullOrWhiteSpace($Value)) {

            Write-Verbose "Value is null or empty, removing default preference"
            Remove-GenXdevPreference -Name $Name -RemoveDefault
            return
        }

        # store the value in the defaults store
        Set-ValueByKeyInStore `
            -StoreName "GenXdev.PowerShell.Preferences" `
            -KeyName $Name `
            -Value $Value `
            -SynchronizationKey "Defaults"

        # ensure changes are propagated across the system
        $null = Sync-KeyValueStore -SynchronizationKey "Defaults"

        Write-Verbose "Successfully stored and synchronized default preference"
    }

    end {
    }
}
