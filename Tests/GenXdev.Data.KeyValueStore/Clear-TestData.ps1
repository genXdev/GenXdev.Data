################################################################################
<#
.SYNOPSIS
Helper function to clean up test data from key-value stores.

.DESCRIPTION
Removes all test-related stores and their data from both local and shadow
databases without deleting the database files themselves.

.EXAMPLE
Clear-TestData
#>
[CmdletBinding()]
param()

begin {
    # define test data identifiers
    $testStores = @("TestStore", "Store1", "Store2")
    $testSyncKeys = @("Local", "TestSync")

    Write-Verbose "Starting cleanup of test data"
}

process {
    # remove each test store for each sync key
    foreach ($store in $testStores) {
        foreach ($syncKey in $testSyncKeys) {
            Write-Verbose "Removing store: $store with sync key: $syncKey"
            Remove-KeyValueStore -StoreName $store `
                -SynchronizationKey $syncKey
        }
    }
}

end {
    Write-Verbose "Test data cleanup completed"
}

