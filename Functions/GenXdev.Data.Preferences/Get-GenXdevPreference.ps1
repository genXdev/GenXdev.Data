################################################################################
<#
.SYNOPSIS
Retrieves a preference value from the GenXdev preferences store.

.DESCRIPTION
This function gets a preference value from the local store first, then falls back
to the default store if not found. If neither store contains the value, returns
the provided default value.

.PARAMETER Name
The name of the preference to retrieve.

.PARAMETER DefaultValue
The default value to return if the preference is not found in any store.

.EXAMPLE
Get-GenXdevPreference -Name "Theme" -DefaultValue "Dark"
#>
function Get-GenXdevPreference {

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    [Alias("getPreference")]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The name of the preference to retrieve"
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("PreferenceName")]
        [string]$Name,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The default value if preference is not found"
        )]
        [AllowNull()]
        [AllowEmptyString()]
        [Alias("DefaultPreference")]
        [string]$DefaultValue
        ########################################################################
    )

    begin {
        Write-Verbose "Starting preference retrieval for: $Name"
    }

    process {
        $value = $null

        try {
            # attempt to get value from local store
            Write-Verbose "Checking local store for preference '$Name'"
            $value = Get-ValueByKeyFromStore `
                -StoreName "GenXdev.PowerShell.Preferences" `
                -KeyName $Name `
                -SynchronizationKey "Local" `
                -ErrorAction Stop

            # if no local value found, check defaults store
            if ([string]::IsNullOrEmpty($value)) {
                Write-Verbose "Preference not found locally, checking defaults store"
                $value = Get-ValueByKeyFromStore `
                    -StoreName "GenXdev.PowerShell.Preferences" `
                    -KeyName $Name `
                    -SynchronizationKey "Defaults" `
                    -ErrorAction Stop
            }
        }
        catch {
            Write-Verbose "Error accessing preference stores: $_"
        }

        # if still no value found, use provided default
        if ([string]::IsNullOrEmpty($value)) {
            Write-Verbose "Using provided default value: $DefaultValue"
            $value = $DefaultValue
        }

        Write-Verbose "Returning value: $value"
        return $value
    }

    end {
    }
}
################################################################################
