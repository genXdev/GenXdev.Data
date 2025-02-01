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
Describe "Set-GenXdevDefaultPreference" {
    It "Should store default preference value" {
        Set-GenXdevDefaultPreference -name "TestDefault" -Value "DefaultValue"
        $result = Get-GenXdevPreference -name "TestDefault"
        $result | Should -Be "DefaultValue"
    }

    It "Should sync across instances" {
        Set-GenXdevDefaultPreference -name "TestDefault" -Value "SyncedValue"
        # Note: In a real test environment, you might need to verify this across different PS sessions
        $result = Get-GenXdevPreference -name "TestDefault"
        $result | Should -Be "SyncedValue"
    }

    It "Should handle null value by removing preference" {
        Set-GenXdevDefaultPreference -name "TestDefault" -Value "DefaultValue"
        Set-GenXdevDefaultPreference -name "TestDefault" -Value $null
        $result = Get-GenXdevPreference -name "TestDefault"
        $result | Should -BeNullOrEmpty
    }
}
