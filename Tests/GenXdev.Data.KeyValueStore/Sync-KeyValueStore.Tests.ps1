###############################################################################
BeforeAll {
    # Clean-up
    & "$PSScriptRoot\Clear-TestData.ps1"
}
AfterAll {
    # Clean-up
    & "$PSScriptRoot\Clear-TestData.ps1"
}
###############################################################################
Describe "Sync-KeyValueStore" {
    BeforeAll {
        try {
            Write-Verbose "Setting up test environment"
            & "$PSScriptRoot\Clear-TestData.ps1"
        }
        catch {

            throw
        }
    }

    It "Should sync between local and shadow databases" {
        Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "SyncKey" -Value "SyncValue" -SynchronizationKey "TestSync"
        Sync-KeyValueStore -SynchronizationKey "TestSync"

        # Check shadow database
        $shadowValue = Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "SyncKey" -SynchronizationKey "TestSync"
        $shadowValue | Should -Be "SyncValue"
    }

    It "Should not sync Local synchronization key" {
        Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "LocalKey" -Value "LocalValue" -SynchronizationKey "Local"
        Sync-KeyValueStore -SynchronizationKey "Local"

        # Local sync should not create shadow entry
        $shadowValue = Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "LocalKey" -SynchronizationKey "Local"
        $shadowValue | Should -Be "LocalValue"
    }
}
