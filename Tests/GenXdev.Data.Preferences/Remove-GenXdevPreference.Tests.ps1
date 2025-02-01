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
Describe "Remove-GenXdevPreference" {
    BeforeEach {
        Write-Verbose "Setting up test data"
        & "$PSScriptRoot\Clear-TestPreferences.ps1"
        Set-GenXdevPreference -Name "TestPref1" -Value "LocalValue"
        Set-GenXdevDefaultPreference -Name "TestPref1" -Value "DefaultValue"
    }

    It "Should remove local preference" {
        Remove-GenXdevPreference -name "TestPref1"
        $result = Get-GenXdevPreference -name "TestPref1"
        $result | Should -Be "DefaultValue" # Falls back to default
    }

    It "Should remove both local and default preferences with -RemoveDefault" {
        Remove-GenXdevPreference -name "TestPref1" -RemoveDefault
        $result = Get-GenXdevPreference -name "TestPref1"
        $result | Should -BeNullOrEmpty
    }

    It "Should not error when removing non-existent preference" {
        { Remove-GenXdevPreference -name "NonExistent" } | Should -Not -Throw
    }
}
