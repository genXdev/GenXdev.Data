Pester\Describe 'Remove-GenXdevPreference' {

    Pester\BeforeAll {
        GenXdev.Data\Remove-GenXdevPreference -Name 'TestPref1' -RemoveDefault
    }

    Pester\AfterAll {
        GenXdev.Data\Remove-GenXdevPreference -Name 'TestPref1' -RemoveDefault
    }

    Pester\BeforeEach {
        Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test data'
        GenXdev.Data\Remove-GenXdevPreference -Name 'TestPref1' -RemoveDefault
        GenXdev.Data\Set-GenXdevPreference -Name 'TestPref1' -Value 'LocalValue'
        GenXdev.Data\Set-GenXdevDefaultPreference -Name 'TestPref1' -Value 'DefaultValue'
    }

    Pester\It 'Should remove local preference' {
        GenXdev.Data\Remove-GenXdevPreference -Name 'TestPref1'
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestPref1'
        $result | Pester\Should -Be 'DefaultValue' # Falls back to default
    }

    Pester\It 'Should remove both local and default preferences with -RemoveDefault' {
        GenXdev.Data\Remove-GenXdevPreference -Name 'TestPref1' -RemoveDefault
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestPref1'
        $result | Pester\Should -BeNullOrEmpty
    }

    Pester\It 'Should not error when removing non-existent preference' {
        { GenXdev.Data\Remove-GenXdevPreference -Name 'NonExistent' } | Pester\Should -Not -Throw
    }
}