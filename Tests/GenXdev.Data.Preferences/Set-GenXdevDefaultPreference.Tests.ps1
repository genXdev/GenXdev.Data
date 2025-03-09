###############################################################################
BeforeAll {
    # Clean-up
    Remove-GenXdevPreference -Name "TestDefault" -RemoveDefault
}
AfterAll {
    # Clean-up
    Remove-GenXdevPreference -Name "TestDefault" -RemoveDefault
}
###############################################################################
Describe "Set-GenXdevDefaultPreference" {
    It "should pass PSScriptAnalyzer rules" {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.Preferences\Set-GenXdevDefaultPreference.ps1"

        # run analyzer with explicit settings
        $analyzerResults = GenXdev.Coding\Invoke-GenXdevScriptAnalyzer `
            -Path $scriptPath

        [string] $message = ""
        $analyzerResults | ForEach-Object {

            $message = $message + @"
--------------------------------------------------
Rule: $($_.RuleName)`
Description: $($_.Description)
Message: $($_.Message)
`r`n
"@
        }

        $analyzerResults.Count | Should -Be 0 -Because @"
The following PSScriptAnalyzer rules are being violated:
$message
"@;
    }

    It "Should store default preference value" {
        Set-GenXdevDefaultPreference -Name "TestDefault" -Value "DefaultValue"
        $result = Get-GenXdevPreference -Name "TestDefault"
        $result | Should -Be "DefaultValue"
    }

    It "Should sync across instances" {
        Set-GenXdevDefaultPreference -Name "TestDefault" -Value "SyncedValue"
        # Note: In a real test environment, you might need to verify this across different PS sessions
        $result = Get-GenXdevPreference -Name "TestDefault"
        $result | Should -Be "SyncedValue"
    }

    It "Should handle null value by removing preference" {
        Set-GenXdevDefaultPreference -Name "TestDefault" -Value "DefaultValue"
        Set-GenXdevDefaultPreference -Name "TestDefault" -Value $null
        $result = Get-GenXdevPreference -Name "TestDefault"
        $result | Should -BeNullOrEmpty
    }
}
