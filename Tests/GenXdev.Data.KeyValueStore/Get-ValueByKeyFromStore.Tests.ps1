Pester\Describe 'Get-ValueByKeyFromStore' {

    Pester\BeforeAll {
        Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test environment'
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'ExistingKey'
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'NonExistingKey'

        # Setup test data
        Set-ValueByKeyInStore -StoreName 'TestStore' `
            -KeyName 'ExistingKey' `
            -Value 'ExistingValue'
    }

    Pester\AfterAll {
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'ExistingKey'
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'NonExistingKey'
    }

    Pester\It 'Should retrieve existing value' {
        $result = Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'ExistingKey'
        $result | Pester\Should -Be 'ExistingValue'
    }

    Pester\It 'Should return default value for non-existing key' {
        $result = Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'NonExistingKey' -DefaultValue 'Default'
        $result | Pester\Should -Be 'Default'
    }

    Pester\It 'Should return null for non-existing key without default' {
        $result = Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'NonExistingKey'
        $result | Pester\Should -BeNullOrEmpty
    }
}