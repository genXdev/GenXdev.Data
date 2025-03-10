###############################################################################
BeforeAll {
    # Clean-up
    Remove-GenXdevPreference -Name "Theme" -RemoveDefault
}
AfterAll {
    # Clean-up
    Remove-GenXdevPreference -Name "Theme" -RemoveDefault
}
###############################################################################
Describe "Set-GenXdevPreference" {

    It "Should pass PSScriptAnalyzer rules" {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.Preferences\Set-GenXdevPreference.ps1"

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

    It "Should store preference value locally" {
        Set-GenXdevPreference -Name "Theme" -Value "Dark"
        $result = Get-GenXdevPreference -Name "Theme"
        $result | Should -Be "Dark"
    }

    It "Should update existing preference" {
        Set-GenXdevPreference -Name "Theme" -Value "Light"
        Set-GenXdevPreference -Name "Theme" -Value "Dark"
        $result = Get-GenXdevPreference -Name "Theme"
        $result | Should -Be "Dark"
    }

    It "Should remove preference when value is null" {
        Set-GenXdevPreference -Name "Theme" -Value "Dark"
        Set-GenXdevPreference -Name "Theme" -Value $null
        $result = Get-GenXdevPreference -Name "Theme" -DefaultValue "Default"
        $result | Should -Be "Default"
    }
}
