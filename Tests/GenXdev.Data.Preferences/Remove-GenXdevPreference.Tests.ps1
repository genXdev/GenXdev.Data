###############################################################################
BeforeAll {
    # Clean-up
    Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
}
AfterAll {
    # Clean-up
    Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
}
###############################################################################
Describe "Remove-GenXdevPreference" {
    It "Should pass PSScriptAnalyzer rules" {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.Preferences\Remove-GenXdevPreference.ps1"

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

    BeforeEach {
        Write-Verbose "Setting up test data"
        Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
        Set-GenXdevPreference -Name "TestPref1" -Value "LocalValue"
        Set-GenXdevDefaultPreference -Name "TestPref1" -Value "DefaultValue"
    }

    It "Should remove local preference" {
        Remove-GenXdevPreference -Name "TestPref1"
        $result = Get-GenXdevPreference -Name "TestPref1"
        $result | Should -Be "DefaultValue" # Falls back to default
    }

    It "Should remove both local and default preferences with -RemoveDefault" {
        Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
        $result = Get-GenXdevPreference -Name "TestPref1"
        $result | Should -BeNullOrEmpty
    }

    It "Should not error when removing non-existent preference" {
        { Remove-GenXdevPreference -Name "NonExistent" } | Should -Not -Throw
    }
}