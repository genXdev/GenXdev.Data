################################################################################
<#
.SYNOPSIS
Removes a preference value from the GenXdev preferences store.

.DESCRIPTION
This function removes a preference value from the local store and optionally from
the default store. It supports removing both local and default preferences
through parameter sets.

.PARAMETER Name
The name of the preference to remove.

.PARAMETER RemoveDefault
Switch to also remove the preference from the default store.

.EXAMPLE
Remove-GenXdevPreference -Name "Theme"

.EXAMPLE
Remove-GenXdevPreference "Theme" -RemoveDefault
#>
function Remove-GenXdevPreference {

    [CmdletBinding(DefaultParameterSetName = 'Local')]
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

        # remove the preference from local store
        Write-Verbose "Removing preference from local store"
        Remove-KeyFromStore `
            -StoreName "GenXdev.PowerShell.Preferences" `
            -KeyName $Name `
            -SynchronizationKey "Local"

        # if removedefault is specified, remove from defaults and sync
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

    end {
    }
}
