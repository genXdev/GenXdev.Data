Pester\Describe 'Remove-GenXdevPreference' {

    Pester\BeforeAll {
        Remove-GenXdevPreference -Name 'TestPref1' -RemoveDefault
    }

    Pester\AfterAll {
        Remove-GenXdevPreference -Name 'TestPref1' -RemoveDefault
    }

    Pester\BeforeEach {
        Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test data'
        Remove-GenXdevPreference -Name 'TestPref1' -RemoveDefault
        Set-GenXdevPreference -Name 'TestPref1' -Value 'LocalValue'
        Set-GenXdevDefaultPreference -Name 'TestPref1' -Value 'DefaultValue'
    }

    Pester\It 'Should remove local preference' {
        Remove-GenXdevPreference -Name 'TestPref1'
        $result = Get-GenXdevPreference -Name 'TestPref1'
        $result | Pester\Should -Be 'DefaultValue' # Falls back to default
    }

    Pester\It 'Should remove both local and default preferences with -RemoveDefault' {
        Remove-GenXdevPreference -Name 'TestPref1' -RemoveDefault
        $result = Get-GenXdevPreference -Name 'TestPref1'
        $result | Pester\Should -BeNullOrEmpty
    }

    Pester\It 'Should not error when removing non-existent preference' {
        { Remove-GenXdevPreference -Name 'NonExistent' } | Pester\Should -Not -Throw
    }
}