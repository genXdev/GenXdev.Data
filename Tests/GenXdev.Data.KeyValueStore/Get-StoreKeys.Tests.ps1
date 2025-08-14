
Pester\Describe 'Get-StoreKeys' {

    Pester\BeforeAll {
        Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test environment'
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'Key1'
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'Key2'

        Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'Key1' -Value 'Value1'
        Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'Key2' -Value 'Value2'
    }

    Pester\AfterAll {

        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'Key1'
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'Key2'
    }

    Pester\It 'Should list all keys in store' {
        $keys = Get-StoreKeys -StoreName 'TestStore'
        $keys | Pester\Should -Contain 'Key1'
        $keys | Pester\Should -Contain 'Key2'
        $keys.Count | Pester\Should -Be 2
    }

    Pester\It 'Should return empty for non-existing store' {
        $keys = Get-StoreKeys -StoreName 'NonExistingStore'
        $keys | Pester\Should -BeNullOrEmpty
    }
}