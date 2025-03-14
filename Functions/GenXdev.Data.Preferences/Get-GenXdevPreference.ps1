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

.EXAMPLE
# Retrieve theme preference with full parameter names
Get-GenXdevPreference -Name "Theme" -DefaultValue "Dark"

.EXAMPLE
# Using alias and positional parameters
getPreference "Theme" "Dark"
#>
function Get-GenXdevPreference {

    [CmdletBinding(
        DefaultParameterSetName = 'Default'
    )]
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

        # initialize the return value
        $value = $null

        try {
            # first attempt to retrieve from local store
            Write-Verbose "Checking local store for preference '$Name'"
            $value = Get-ValueByKeyFromStore `
                -StoreName "GenXdev.PowerShell.Preferences" `
                -KeyName $Name `
                -SynchronizationKey "Local" `
                -ErrorAction Stop

            # if local store lookup failed, try defaults store
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

        # if no value found in either store, use provided default
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