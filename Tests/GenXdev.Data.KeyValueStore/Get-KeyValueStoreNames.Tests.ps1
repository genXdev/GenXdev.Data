
Pester\Describe 'Get-KeyValueStoreNames' {

    Pester\BeforeAll {
        try {
            Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test environment'
            GenXdev.Data\Remove-KeyValueStore -StoreName 'Store1'
            GenXdev.Data\Remove-KeyValueStore -StoreName 'Store2'

            # Setup test stores
            GenXdev.Data\Set-ValueByKeyInStore -StoreName 'Store1' -KeyName 'Key1' -Value 'Value1'
            GenXdev.Data\Set-ValueByKeyInStore -StoreName 'Store2' -KeyName 'Key2' -Value 'Value2'
        }
        catch {
            throw
        }
    }

    Pester\AfterAll {
        # Clean-up
        GenXdev.Data\Remove-KeyValueStore -StoreName 'Store1'
        GenXdev.Data\Remove-KeyValueStore -StoreName 'Store2'
    }

    Pester\It 'Should list all stores' {
        $stores = GenXdev.Data\Get-KeyValueStoreNames
        $stores | Pester\Should -Contain 'Store1'
        $stores | Pester\Should -Contain 'Store2'
    }
}