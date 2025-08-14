Pester\Describe 'Sync-KeyValueStore' {

    Pester\BeforeAll {
        Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test environment'
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'SyncKey' -SynchronizationKey 'TestSync'
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'LocalKey' -SynchronizationKey 'Local'
    }

    Pester\AfterAll {

        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'SyncKey' -SynchronizationKey 'TestSync'
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'LocalKey' -SynchronizationKey 'Local'
    }

    Pester\It 'Should sync between local and shadow databases' {
        Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'SyncKey' -Value 'SyncValue' -SynchronizationKey 'TestSync'
        Sync-KeyValueStore -SynchronizationKey 'TestSync'

        # Check shadow database
        $shadowValue = Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'SyncKey' -SynchronizationKey 'TestSync'
        $shadowValue | Pester\Should -Be 'SyncValue'
    }

    Pester\It 'Should not sync Local synchronization key' {
        Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'LocalKey' -Value 'LocalValue' -SynchronizationKey 'Local'
        Sync-KeyValueStore -SynchronizationKey 'Local'

        # Local sync Should not create shadow entry
        $shadowValue = Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'LocalKey' -SynchronizationKey 'Local'
        $shadowValue | Pester\Should -Be 'LocalValue'
    }
}