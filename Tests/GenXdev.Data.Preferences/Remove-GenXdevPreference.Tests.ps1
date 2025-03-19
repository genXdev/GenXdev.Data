###############################################################################
Pester\BeforeAll {
    # Clean-up
    GenXdev.Data\Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
}
Pester\AfterAll {
    # Clean-up
    GenXdev.Data\Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
}
###############################################################################
Pester\Describe "Remove-GenXdevPreference" {
    Pester\It "Should pass PSScriptAnalyzer rules" {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.Preferences\Remove-GenXdevPreference.ps1"

        # run analyzer with explicit settings
        $analyzerResults = GenXdev.Coding\Invoke-GenXdevScriptAnalyzer `
            -Path $scriptPath

        [string] $message = ""
        $analyzerResults | Microsoft.PowerShell.Core\ForEach-Object {

            $message = $message + @"
--------------------------------------------------
Rule: $($_.RuleName)`
Description: $($_.Description)
Message: $($_.Message)
`r`n
"@
        }

        $analyzerResults.Count | Pester\Should -Be 0 -Because @"
The following PSScriptAnalyzer rules are being violated:
$message
"@;
    }

    Pester\BeforeEach {
        Microsoft.PowerShell.Utility\Write-Verbose "Setting up test data"
        GenXdev.Data\Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
        GenXdev.Data\Set-GenXdevPreference -Name "TestPref1" -Value "LocalValue"
        GenXdev.Data\Set-GenXdevDefaultPreference -Name "TestPref1" -Value "DefaultValue"
    }

    Pester\It "Should remove local preference" {
        GenXdev.Data\Remove-GenXdevPreference -Name "TestPref1"
        $result = GenXdev.Data\Get-GenXdevPreference -Name "TestPref1"
        $result | Pester\Should -Be "DefaultValue" # Falls back to default
    }

    Pester\It "Should remove both local and default preferences with -RemoveDefault" {
        GenXdev.Data\Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
        $result = GenXdev.Data\Get-GenXdevPreference -Name "TestPref1"
        $result | Pester\Should -BeNullOrEmpty
    }

    Pester\It "Should not error when removing non-existent preference" {
        { GenXdev.Data\Remove-GenXdevPreference -Name "NonExistent" } | Pester\Should -Not -Throw
    }
}