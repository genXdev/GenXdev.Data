Pester\Describe 'Set-GenXdevPreference' {

    Pester\BeforeAll {
        Remove-GenXdevPreference -Name 'Theme' -RemoveDefault
    }

    Pester\AfterAll {
        Remove-GenXdevPreference -Name 'Theme' -RemoveDefault
    }

    Pester\It 'Should store preference value locally' {
        Set-GenXdevPreference -Name 'Theme' -Value 'Dark'
        $result = Get-GenXdevPreference -Name 'Theme'
        $result | Pester\Should -Be 'Dark'
    }

    Pester\It 'Should update existing preference' {
        Set-GenXdevPreference -Name 'Theme' -Value 'Light'
        Set-GenXdevPreference -Name 'Theme' -Value 'Dark'
        $result = Get-GenXdevPreference -Name 'Theme'
        $result | Pester\Should -Be 'Dark'
    }

    Pester\It 'Should remove preference when value is null' {
        Set-GenXdevPreference -Name 'Theme' -Value 'Dark'
        Set-GenXdevPreference -Name 'Theme' -Value $null
        $result = Get-GenXdevPreference -Name 'Theme' -DefaultValue 'Default'
        $result | Pester\Should -Be 'Default'
    }
}