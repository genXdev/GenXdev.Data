###############################################################################
Pester\BeforeAll {
    # Clean-up
    GenXdev.Data\Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
    GenXdev.Data\Remove-GenXdevPreference -Name "TestPref2" -RemoveDefault
}
Pester\AfterAll {
    # Clean-up
    GenXdev.Data\Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
    GenXdev.Data\Remove-GenXdevPreference -Name "TestPref2" -RemoveDefault
}
###############################################################################
Pester\Describe "Get-GenXdevPreference" {

    Pester\BeforeAll {
        # Setup test environment
        try {
            Microsoft.PowerShell.Utility\Write-Verbose "Setting up test environment"
            GenXdev.Data\Remove-GenXdevPreference -Name "TestPref1" -RemoveDefault
            GenXdev.Data\Remove-GenXdevPreference -Name "TestPref2" -RemoveDefault
            GenXdev.Data\Set-GenXdevPreference -Name "TestPref1" -Value "LocalValue"
            GenXdev.Data\Set-GenXdevDefaultPreference -Name "TestPref2" -Value "DefaultValue"
        }
        catch {
            throw
        }
    }

    Pester\It "Should pass PSScriptAnalyzer rules" {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.Preferences\Get-GenXdevPreference.ps1"

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

    Pester\It "Should retrieve local preference value" {
        $result = GenXdev.Data\Get-GenXdevPreference -Name "TestPref1"
        $result | Pester\Should -Be "LocalValue"
    }

    Pester\It "Should fall back to default value when local not found" {
        $result = GenXdev.Data\Get-GenXdevPreference -Name "TestPref2"
        $result | Pester\Should -Be "DefaultValue"
    }

    Pester\It "Should return specified default when preference not found" {
        $result = GenXdev.Data\Get-GenXdevPreference -Name "NonExistent" -DefaultValue "Fallback"
        $result | Pester\Should -Be "Fallback"
    }

    Pester\It "Should handle null default value" {
        $result = GenXdev.Data\Get-GenXdevPreference -Name "NonExistent"
        $result | Pester\Should -BeNullOrEmpty
    }
}