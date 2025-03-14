################################################################################
<#
.SYNOPSIS
Removes a preference value from the GenXdev preferences store.

.DESCRIPTION
This function removes a preference value from both the local store and optionally
from the default store. It provides two parameter sets - one for local removal
only and another for removing from both local and default stores. The function
ensures proper synchronization when modifying the default store.

.PARAMETER Name
Specifies the name of the preference to remove. This is required and can be
provided via pipeline input.

.PARAMETER RemoveDefault
When specified, removes the preference from both the local and default stores.
If not specified, only removes from the local store.

.EXAMPLE
Remove-GenXdevPreference -Name "Theme"
# Removes the "Theme" preference from the local store only

.EXAMPLE
removePreference "Theme" -RemoveDefault
# Removes the "Theme" preference from both local and default stores
#>
function Remove-GenXdevPreference {

    [CmdletBinding(
        SupportsShouldProcess = $true
    )]
    [Alias("removePreference")]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The name of the preference to remove"
        )]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            ParameterSetName = 'All',
            HelpMessage = "Switch to also remove the preference from defaults"
        )]
        [switch]$RemoveDefault
        ########################################################################
    )

    begin {

        Write-Verbose "Starting preference removal for: $Name"
    }

    process {

        if ($PSCmdlet.ShouldProcess($Name, "Remove preference")) {

            Write-Verbose "Removing preference from local store"
            Remove-KeyFromStore `
                -StoreName "GenXdev.PowerShell.Preferences" `
                -KeyName $Name `
                -SynchronizationKey "Local"

            if ($RemoveDefault) {

                Write-Verbose "Removing preference from default store"
                Remove-KeyFromStore `
                    -StoreName "GenXdev.PowerShell.Preferences" `
                    -KeyName $Name `
                    -SynchronizationKey "Defaults"

                Write-Verbose "Synchronizing default store changes"
                $null = Sync-KeyValueStore -SynchronizationKey "Defaults"
            }

            Write-Verbose "Preference removal completed"
        }
    }

    end {
    }
}
################################################################################