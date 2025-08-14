Pester\Describe 'Set-ValueByKeyInStore' {

    Pester\BeforeAll {
        Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test environment'
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
    }
    
    Pester\AfterAll {
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
    }

    Pester\It 'Should store a value successfully' {
        Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'TestKey' -Value 'TestValue'
        $result = Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
        $result | Pester\Should -Be 'TestValue'
    }

    Pester\It 'Should update existing value' {
        Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'TestKey' -Value 'Value1'
        Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'TestKey' -Value 'Value2'
        $result = Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
        $result | Pester\Should -Be 'Value2'
    }

    Pester\It 'Should handle null values' {
        Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'TestKey' -Value $null
        $result = Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
        $result | Pester\Should -BeNullOrEmpty
    }
}