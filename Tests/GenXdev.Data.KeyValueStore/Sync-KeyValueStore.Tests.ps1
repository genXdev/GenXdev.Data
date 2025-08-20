Pester\Describe 'Sync-KeyValueStore' {

    Pester\BeforeAll {
        Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test environment'
        GenXdev.Data\Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'SyncKey' -SynchronizationKey 'TestSync'
        GenXdev.Data\Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'LocalKey' -SynchronizationKey 'Local'
    }

    Pester\AfterAll {

        GenXdev.Data\Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'SyncKey' -SynchronizationKey 'TestSync'
        GenXdev.Data\Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'LocalKey' -SynchronizationKey 'Local'
    }

    Pester\It 'Should sync between local and shadow databases' {
        GenXdev.Data\Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'SyncKey' -Value 'SyncValue' -SynchronizationKey 'TestSync'
        GenXdev.Data\Sync-KeyValueStore -SynchronizationKey 'TestSync'

        # Check shadow database
        $shadowValue = GenXdev.Data\Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'SyncKey' -SynchronizationKey 'TestSync'
        $shadowValue | Pester\Should -Be 'SyncValue'
    }

    Pester\It 'Should not sync Local synchronization key' {
        GenXdev.Data\Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'LocalKey' -Value 'LocalValue' -SynchronizationKey 'Local'
        GenXdev.Data\Sync-KeyValueStore -SynchronizationKey 'Local'

        # Local sync Should not create shadow entry
        $shadowValue = GenXdev.Data\Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'LocalKey' -SynchronizationKey 'Local'
        $shadowValue | Pester\Should -Be 'LocalValue'
    }
}