Pester\Describe 'Remove-KeyValueStore' {

    Pester\BeforeAll {
        GenXdev.Data\Remove-KeyValueStore -StoreName 'TestStore'
    }
    Pester\AfterAll {
        GenXdev.Data\Remove-KeyValueStore -StoreName 'TestStore'
    }

    Pester\It 'Should remove entire store' {
        GenXdev.Data\Remove-KeyValueStore -StoreName 'TestStore'
        $keys = GenXdev.Data\Get-StoreKeys -StoreName 'TestStore'
        $keys | Pester\Should -BeNullOrEmpty
    }
}