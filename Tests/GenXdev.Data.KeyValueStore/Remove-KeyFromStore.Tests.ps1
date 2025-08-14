Pester\Describe 'Remove-KeyFromStore' {

    Pester\BeforeAll {
        Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test environment'
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'NonExistingKey'
    }

    Pester\AfterAll {
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'NonExistingKey'
    }

    Pester\It 'Should remove existing key' {
        Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
        $result = Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'TestKey'
        $result | Pester\Should -BeNullOrEmpty
    }

    Pester\It 'Should not error when removing non-existing key' {
        { Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'NonExistingKey' } | Pester\Should -Not -Throw
    }
}