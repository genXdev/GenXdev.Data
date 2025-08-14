Pester\Describe 'Set-GenXdevDefaultPreference' {

    Pester\BeforeAll {
        GenXdev.Data\Remove-GenXdevPreference -Name 'TestDefault' -RemoveDefault
    }

    Pester\AfterAll {
        GenXdev.Data\Remove-GenXdevPreference -Name 'TestDefault' -RemoveDefault
    }

    Pester\It 'Should store default preference value' {
        GenXdev.Data\Set-GenXdevDefaultPreference -Name 'TestDefault' -Value 'DefaultValue'
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestDefault'
        $result | Pester\Should -Be 'DefaultValue'
    }

    Pester\It 'Should sync across instances' {
        GenXdev.Data\Set-GenXdevDefaultPreference -Name 'TestDefault' -Value 'SyncedValue'
        # Note: In a real test environment, you might need to verify this across different PS sessions
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestDefault'
        $result | Pester\Should -Be 'SyncedValue'
    }

    Pester\It 'Should handle null value by removing preference' {
        GenXdev.Data\Set-GenXdevDefaultPreference -Name 'TestDefault' -Value 'DefaultValue'
        GenXdev.Data\Set-GenXdevDefaultPreference -Name 'TestDefault' -Value $null
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestDefault'
        $result | Pester\Should -BeNullOrEmpty
    }
}