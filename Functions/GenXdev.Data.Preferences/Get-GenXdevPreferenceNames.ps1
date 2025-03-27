################################################################################
<#
.SYNOPSIS
Gets all preference names from both local and default stores.

.DESCRIPTION
Retrieves a unique list of preference names by combining keys from both the local
and default preference stores. The function merges the keys from both stores,
removes duplicates, sorts them alphabetically, and returns the combined list.

This function is useful when you need to see all available preference settings,
regardless of whether they are stored in the local or default configuration.

.EXAMPLE
Get-GenXdevPreferenceNames
Returns: A sorted array of unique preference names from both local and default
stores.

.EXAMPLE
getPreferenceNames
Same as above, using the alias.
#>
function Get-GenXdevPreferenceNames {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    [Alias("getPreferenceNames")]
    param()

    begin {

        # log the start of the operation
        Microsoft.PowerShell.Utility\Write-Verbose "Starting retrieval of preference names from all stores"
    }


process {

        # retrieve all preference keys from the local preferences store
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving keys from local preferences store"
        $localKeys = GenXdev.Data\Get-StoreKeys `
            -StoreName "GenXdev.PowerShell.Preferences" `
            -SynchronizationKey "Local"

        # retrieve all preference keys from the default preferences store
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving keys from default preferences store"
        $defaultKeys = GenXdev.Data\Get-StoreKeys `
            -StoreName "GenXdev.PowerShell.Preferences" `
            -SynchronizationKey "Defaults"

        # combine both sets of keys, remove duplicates, and sort alphabetically
        Microsoft.PowerShell.Utility\Write-Verbose "Merging and deduplicating keys from both stores"
        $allKeys = @($localKeys + $defaultKeys) |
        Microsoft.PowerShell.Utility\Select-Object -Unique |
        Microsoft.PowerShell.Utility\Sort-Object

        # log the total number of unique preferences found
        Microsoft.PowerShell.Utility\Write-Verbose "Found $($allKeys.Count) unique preference names"

        # return the combined and sorted list of preference names
        return $allKeys
    }

    end {
    }
}
################################################################################