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
Describe "Get-GenXdevPreference" {

    BeforeAll {
        # Setup test environment
        try {
            Write-Verbose "Setting up test environment"
            & "$PSScriptRoot\Clear-TestPreferences.ps1"
            Set-GenXdevPreference -Name "TestPref1" -Value "LocalValue"
            Set-GenXdevDefaultPreference -Name "TestPref2" -Value "DefaultValue"
        }
        catch {
            # Restore VerbosePreference even if setup fails

            throw
        }
    }

    It "Should retrieve local preference value" {
        $result = Get-GenXdevPreference -name "TestPref1"
        $result | Should -Be "LocalValue"
    }

    It "Should fall back to default value when local not found" {
        $result = Get-GenXdevPreference -name "TestPref2"
        $result | Should -Be "DefaultValue"
    }

    It "Should return specified default when preference not found" {
        $result = Get-GenXdevPreference -name "NonExistent" -DefaultValue "Fallback"
        $result | Should -Be "Fallback"
    }

    It "Should handle null default value" {
        $result = Get-GenXdevPreference -name "NonExistent"
        $result | Should -BeNullOrEmpty
    }
}
