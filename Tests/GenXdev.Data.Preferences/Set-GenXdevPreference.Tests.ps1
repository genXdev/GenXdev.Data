###############################################################################
BeforeAll {
    # Clean-up
    & "$PSScriptRoot\Clear-TestPreferences.ps1"
}
AfterAll {
    # Clean-up
    & "$PSScriptRoot\Clear-TestPreferences.ps1"
}
###############################################################################
Describe "Set-GenXdevPreference" {

    It "Should store preference value locally" {
        Set-GenXdevPreference -name "Theme" -Value "Dark"
        $result = Get-GenXdevPreference -name "Theme"
        $result | Should -Be "Dark"
    }

    It "Should update existing preference" {
        Set-GenXdevPreference -name "Theme" -Value "Light"
        Set-GenXdevPreference -name "Theme" -Value "Dark"
        $result = Get-GenXdevPreference -name "Theme"
        $result | Should -Be "Dark"
    }

    It "Should remove preference when value is null" {
        Set-GenXdevPreference -name "Theme" -Value "Dark"
        Set-GenXdevPreference -name "Theme" -Value $null
        $result = Get-GenXdevPreference -name "Theme" -DefaultValue "Default"
        $result | Should -Be "Default"
    }
}
