################################################################################
<#
.SYNOPSIS
Gets all preference names from both local and default stores.

.DESCRIPTION
Retrieves a unique list of preference names by combining keys from both the local
and default preference stores. The function merges the keys from both stores and
ensures uniqueness in the returned collection.

.EXAMPLE
Get-GenXdevPreferenceNames
Returns a unique list of all preference names from both stores.
#>
function Get-GenXdevPreferenceNames {

    [CmdletBinding()]
    [Alias("getPreferenceNames")]
    param()

    begin {

        Write-Verbose "Starting retrieval of preference names from all stores"
    }

    process {

        # get all preference names from the local store
        Write-Verbose "Retrieving keys from local store"
        $localKeys = Get-StoreKeys `
            -StoreName "GenXdev.PowerShell.Preferences" `
            -SynchronizationKey "Local"

        # get all preference names from the default store
        Write-Verbose "Retrieving keys from default store"
        $defaultKeys = Get-StoreKeys `
            -StoreName "GenXdev.PowerShell.Preferences" `
            -SynchronizationKey "Defaults"

        # combine local and default keys, remove duplicates, and sort
        Write-Verbose "Merging and deduplicating keys from both stores"
        $allKeys = @($localKeys + $defaultKeys) |
        Select-Object -Unique |
        Sort-Object

        Write-Verbose "Found $($allKeys.Count) unique preference names"
        return $allKeys
    }

    end {
    }
}
