Pester\Describe 'Set-ValueByKeyInStore' {

    Pester\BeforeAll {
        Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test environment'
        GenXdev.Data\Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
    }

    Pester\AfterAll {
        GenXdev.Data\Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
    }

    Pester\It 'Should store a value successfully' {
        GenXdev.Data\Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'TestKey' -Value 'TestValue'
        $result = GenXdev.Data\Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
        $result | Pester\Should -Be 'TestValue'
    }

    Pester\It 'Should update existing value' {
        GenXdev.Data\Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'TestKey' -Value 'Value1'
        GenXdev.Data\Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'TestKey' -Value 'Value2'
        $result = GenXdev.Data\Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
        $result | Pester\Should -Be 'Value2'
    }

    Pester\It 'Should handle null values' {
        GenXdev.Data\Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'TestKey' -Value $null
        $result = GenXdev.Data\Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
        $result | Pester\Should -BeNullOrEmpty
    }
}