###############################################################################
BeforeAll {
    # Clean-up
    Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
    Remove-GenXdevPreference -Name "TestPref2" -RemoveDefault
}
AfterAll {
    # Clean-up
    Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
    Remove-GenXdevPreference -Name "TestPref2" -RemoveDefault
}
###############################################################################
Describe "Get-GenXdevPreference" {

    BeforeAll {
        # Setup test environment
        try {
            Write-Verbose "Setting up test environment"
            Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
            Remove-GenXdevPreference -Name "TestPref2" -RemoveDefault
            Set-GenXdevPreference -Name "TestPref1" -Value "LocalValue"
            Set-GenXdevDefaultPreference -Name "TestPref2" -Value "DefaultValue"
        }
        catch {
            throw
        }
    }

    It "Should pass PSScriptAnalyzer rules" {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.Preferences\Get-GenXdevPreference.ps1"

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

    It "Should retrieve local preference value" {
        $result = Get-GenXdevPreference -Name "TestPref1"
        $result | Should -Be "LocalValue"
    }

    It "Should fall back to default value when local not found" {
        $result = Get-GenXdevPreference -Name "TestPref2"
        $result | Should -Be "DefaultValue"
    }

    It "Should return specified default when preference not found" {
        $result = Get-GenXdevPreference -Name "NonExistent" -DefaultValue "Fallback"
        $result | Should -Be "Fallback"
    }

    It "Should handle null default value" {
        $result = Get-GenXdevPreference -Name "NonExistent"
        $result | Should -BeNullOrEmpty
    }
}