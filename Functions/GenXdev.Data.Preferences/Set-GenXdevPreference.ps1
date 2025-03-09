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

.EXAMPLE
Set-GenXdevPreference -Name "Theme" -Value "Dark"
Sets the "Theme" preference to "Dark" in the local store.

.EXAMPLE
setPreference Theme Light
Uses the alias and positional parameters to set the Theme preference to Light.
#>
function Set-GenXdevPreference {

    [CmdletBinding(
        SupportsShouldProcess = $true
    )]
    [Alias("setPreference")]
    param(
        ########################################################################
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

        Write-Verbose "Beginning preference operation for preference name: '$Name'"
    }

    process {

        # check if preference should be removed due to null/empty value
        if ([string]::IsNullOrWhiteSpace($Value)) {

            Write-Verbose "Removing preference '$Name' due to null/empty value"
            if ($PSCmdlet.ShouldProcess($Name, "Remove preference")) {
                Remove-GenXdevPreference -Name $Name
            }
            return
        }

        # store the preference with local synchronization
        Write-Verbose "Storing preference '$Name' with value: '$Value'"
        if ($PSCmdlet.ShouldProcess($Name, "Set preference to '$Value'")) {
            Set-ValueByKeyInStore `
                -StoreName "GenXdev.PowerShell.Preferences" `
                -KeyName $Name `
                -Value $Value `
                -SynchronizationKey "Local"
        }

        Write-Verbose "Successfully stored preference '$Name'"
    }

    end {
    }
}
################################################################################
