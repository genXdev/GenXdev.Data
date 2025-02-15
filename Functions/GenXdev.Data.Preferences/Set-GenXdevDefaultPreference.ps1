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

        # log the starting operation with the preference name and value
        Write-Verbose "Setting default preference '$Name' to value: $Value"
    }

    process {

        # handle cases where the value is null or consists only of whitespace
        if ([string]::IsNullOrWhiteSpace($Value)) {

            # log the removal operation
            Write-Verbose "Value is null or empty, removing default preference"

            # remove the preference from defaults
            Remove-GenXdevPreference -Name $Name -RemoveDefault

            return
        }

        # store the preference value in the defaults store
        Set-ValueByKeyInStore `
            -StoreName "GenXdev.PowerShell.Preferences" `
            -KeyName $Name `
            -Value $Value `
            -SynchronizationKey "Defaults"

        # ensure the change is propagated across the system
        $null = Sync-KeyValueStore -SynchronizationKey "Defaults"

        # log successful completion
        Write-Verbose "Successfully stored and synchronized default preference"
    }

    end {
    }
}
################################################################################
