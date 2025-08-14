Pester\Describe 'Remove-KeyValueStore' {

    Pester\BeforeAll {
        Remove-KeyValueStore -StoreName 'TestStore'
    }
    Pester\AfterAll {
        Remove-KeyValueStore -StoreName 'TestStore'
    }

    Pester\It 'Should remove entire store' {
        Remove-KeyValueStore -StoreName 'TestStore'
        $keys = Get-StoreKeys -StoreName 'TestStore'
        $keys | Pester\Should -BeNullOrEmpty
    }
}