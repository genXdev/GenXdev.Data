###############################################################################
<#
.SYNOPSIS
Removes a preference value from the GenXdev preferences store.

.DESCRIPTION
This function removes a preference value from both the local store and
optionally from the default store. It provides two parameter sets - one for
local removal only and another for removing from both local and default stores.
The function ensures proper synchronization when modifying the default store.

.PARAMETER Name
Specifies the name of the preference to remove. This is required and can be
provided via pipeline input.

.PARAMETER RemoveDefault
When specified, removes the preference from both the local and default stores.
If not specified, only removes from the local store.

.PARAMETER SessionOnly
Use alternative settings stored in session for Data preferences like Language,
Database paths, etc.

.PARAMETER ClearSession
Clear the session setting (Global variable) before retrieving.

.PARAMETER PreferencesDatabasePath
Database path for preference data files.
Alias: DatabasePath

.PARAMETER SkipSession
Dont use alternative settings stored in session for Data preferences like
Language, Database paths, etc.

.EXAMPLE
Remove-GenXdevPreference -Name "Theme"

Removes the "Theme" preference from the local store only.

.EXAMPLE
removePreference "Theme" -RemoveDefault

Removes the "Theme" preference from both local and default stores.
#>
function Remove-GenXdevPreference {

    [CmdletBinding(
        SupportsShouldProcess = $true
    )]
    [Alias('removePreference')]
    param(
        #######################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The name of the preference to remove'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            ParameterSetName = 'All',
            HelpMessage = 'Switch to also remove the preference from defaults'
        )]
        [switch]$RemoveDefault,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Use alternative settings stored in session for ' +
                'Data preferences like Language, Database paths, etc')
        )]
        [Alias('DatabasePath')]
        [string]$PreferencesDatabasePath,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Use alternative settings stored in session for ' +
                'Data preferences like Language, Database paths, etc')
        )]
        [switch]$SessionOnly,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Clear the session setting (Global variable) ' +
                'before retrieving')
        )]
        [switch]$ClearSession,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Dont use alternative settings stored in session ' +
                'for Data preferences like Language, Database ' +
                'paths, etc')
        )]
        [Alias('FromPreferences')]
        [switch]$SkipSession
        #######################################################################
    )

    begin {

        # copy identical parameter values to prepare for database path lookup
        $params = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Data\Get-GenXdevPreferencesDatabasePath' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local `
                -ErrorAction SilentlyContinue)

        # resolve the actual database path using the helper function
        $PreferencesDatabasePath = GenXdev.Data\Get-GenXdevPreferencesDatabasePath @params

        # create global variable name for this preference
        $globalVariableName = "GenXdevPreference_$Name"

        # output verbose information about the database path being used
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using database path: $PreferencesDatabasePath"

        # output verbose information about the operation start
        Microsoft.PowerShell.Utility\Write-Verbose ('Starting preference ' +
            "removal for: $Name")
    }

    process {

        # handle clearing session variables first if requested
        if ($ClearSession) {

            # confirm the operation with the user before proceeding
            if ($PSCmdlet.ShouldProcess($Name, 'Clear session variable')) {

                # clear the session variable
                Microsoft.PowerShell.Utility\Remove-Variable -Name $globalVariableName -Scope Global -ErrorAction SilentlyContinue
            }
        }

        # handle session-only removal
        if ($SessionOnly) {

            # confirm the operation with the user before proceeding
            if ($PSCmdlet.ShouldProcess($Name, 'Remove session-only preference')) {

                # remove the preference from session-only store
                GenXdev.Data\Remove-KeyFromStore -Name $Name -SessionOnly
            }
        }

        # check if the operation should proceed based on whatif/confirm
        if ($PSCmdlet.ShouldProcess($Name, 'Remove preference')) {

            # clear session variable for this preference if not SkipSession
            if (-not $SkipSession) {
                Microsoft.PowerShell.Utility\Remove-Variable -Name $globalVariableName -Scope Global -ErrorAction SilentlyContinue
            }

            # output verbose information about local store removal
            Microsoft.PowerShell.Utility\Write-Verbose ('Removing preference ' +
                $Name + ' from local store')

            # copy identical parameter values for Remove-KeyFromStore
            $removeLocalParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Remove-KeyFromStore' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # assign specific parameters for local store removal
            $removeLocalParams.StoreName = 'GenXdev.PowerShell.Preferences'
            $removeLocalParams.KeyName = $Name
            $removeLocalParams.SynchronizationKey = 'Local'
            $removeLocalParams.DatabasePath = $PreferencesDatabasePath

            # remove the preference key from the local store
            GenXdev.Data\Remove-KeyFromStore @removeLocalParams

            # handle default store removal if requested
            if ($RemoveDefault) {
                Microsoft.PowerShell.Utility\Write-Verbose ('Removing preference ' + $Name + ' from default store')
                GenXdev.Data\Sync-KeyValueStore -Name $Name -RemoveDefault
            }
        }
    }

    end {
    }
}
###############################################################################