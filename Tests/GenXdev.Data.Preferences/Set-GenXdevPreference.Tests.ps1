Pester\Describe 'Set-GenXdevPreference' {

    Pester\BeforeAll {
        GenXdev.Data\Remove-GenXdevPreference -Name 'Theme' -RemoveDefault
    }

    Pester\AfterAll {
        GenXdev.Data\Remove-GenXdevPreference -Name 'Theme' -RemoveDefault
    }

    Pester\It 'Should store preference value locally' {
        GenXdev.Data\Set-GenXdevPreference -Name 'Theme' -Value 'Dark'
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'Theme'
        $result | Pester\Should -Be 'Dark'
    }

    Pester\It 'Should update existing preference' {
        GenXdev.Data\Set-GenXdevPreference -Name 'Theme' -Value 'Light'
        GenXdev.Data\Set-GenXdevPreference -Name 'Theme' -Value 'Dark'
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'Theme'
        $result | Pester\Should -Be 'Dark'
    }

    Pester\It 'Should remove preference when value is null' {
        GenXdev.Data\Set-GenXdevPreference -Name 'Theme' -Value 'Dark'
        GenXdev.Data\Set-GenXdevPreference -Name 'Theme' -Value $null
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'Theme' -DefaultValue 'Default'
        $result | Pester\Should -Be 'Default'
    }
}