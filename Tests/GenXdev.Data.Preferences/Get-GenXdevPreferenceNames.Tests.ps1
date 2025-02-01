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
Describe "Get-GenXdevPreferenceNames" {
    BeforeEach {
        Write-Verbose "Preparing test preference data"
        & "$PSScriptRoot\Clear-TestPreferences.ps1"
        Set-GenXdevPreference -Name "TestPref1" -Value "LocalValue"
        Set-GenXdevDefaultPreference -Name "TestPref2" -Value "DefaultValue"
    }

    It "Should return all preference names from both stores" {
        $results = Get-GenXdevPreferenceNames
        $results | Should -Contain "TestPref1"
        $results | Should -Contain "TestPref2"
    }

    It "Should return unique names when preference exists in both stores" {
        Set-GenXdevPreference -name "DuplicateTest" -Value "Local"
        Set-GenXdevDefaultPreference -name "DuplicateTest" -Value "Default"
        $results = Get-GenXdevPreferenceNames
        ($results | Where-Object { $_ -eq "DuplicateTest" }).Count | Should -Be 1
    }

    It "Should return empty array when no preferences exist" {
        & "$PSScriptRoot\Clear-TestPreferences.ps1"
        $results = Get-GenXdevPreferenceNames
        $results | Should -Not -Contain "TestPref1"
        $results | Should -Not -Contain "TestPref2"
        $results | Should -Not -Contain "Theme"
        $results | Should -Not -Contain "TestDefault"
    }
}
