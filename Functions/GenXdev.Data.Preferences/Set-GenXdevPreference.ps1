################################################################################
<#
.SYNOPSIS
Sets a preference value in the GenXdev preferences store.

.DESCRIPTION
This function sets a preference value in the local store. The value can be
retrieved later using Get-GenXdevPreference. If the value is null, the
preference will be removed instead.

.PARAMETER Name
The name of the preference to set.

.PARAMETER Value
The value to store for the preference.

.EXAMPLE
Set-GenXdevPreference -Name "Theme" -Value "Dark"

.EXAMPLE
Set-GenXdevPreference Theme Dark
#>
function Set-GenXdevPreference {

    [CmdletBinding(DefaultParameterSetName = 'Default')]
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

        Write-Verbose "Starting preference operation for '$Name'"
    }

    process {

        # check if value is null or whitespace and remove preference if it is
        if ([string]::IsNullOrWhiteSpace($Value)) {
            Write-Verbose "Value is null or empty, removing preference '$Name'"
            Remove-GenXdevPreference -Name $Name
            return
        }

        Write-Verbose "Setting preference '$Name' to value: $Value"

        # store the preference value in the local store
        Set-ValueByKeyInStore `
            -StoreName "GenXdev.PowerShell.Preferences" `
            -KeyName $Name `
            -Value $Value `
            -SynchronizationKey "Local"

        Write-Verbose "Successfully stored preference '$Name'"
    }

    end {
    }
}
