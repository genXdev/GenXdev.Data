###############################################################################
Pester\BeforeAll {
    # Clean-up
    Remove-GenXdevPreference -Name 'TestPref1' -RemoveDefault
    Remove-GenXdevPreference -Name 'TestPref2' -RemoveDefault
}
Pester\AfterAll {
    # Clean-up
    Remove-GenXdevPreference -Name 'TestPref1' -RemoveDefault
    Remove-GenXdevPreference -Name 'TestPref2' -RemoveDefault
}
###############################################################################
Pester\Describe 'Get-GenXdevPreference' {

    Pester\BeforeAll {
        # Setup test environment
        try {
            Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test environment'
            Remove-GenXdevPreference -Name 'TestPref1' -RemoveDefault
            Remove-GenXdevPreference -Name 'TestPref2' -RemoveDefault
            Set-GenXdevPreference -Name 'TestPref1' -Value 'LocalValue'
            Set-GenXdevDefaultPreference -Name 'TestPref2' -Value 'DefaultValue'
        }
        catch {
            throw
        }
    }

    Pester\It 'Should pass PSScriptAnalyzer rules' {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.Preferences\Get-GenXdevPreference.ps1"

        # run analyzer with explicit settings
        $analyzerResults = GenXdev.Coding\Invoke-GenXdevScriptAnalyzer `
            -Path $scriptPath

        [string] $message = ''
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

    Pester\It 'Should retrieve local preference value' {
        $result = Get-GenXdevPreference -Name 'TestPref1'
        $result | Pester\Should -Be 'LocalValue'
    }

    Pester\It 'Should fall back to default value when local not found' {
        $result = Get-GenXdevPreference -Name 'TestPref2'
        $result | Pester\Should -Be 'DefaultValue'
    }

    Pester\It 'Should return specified default when preference not found' {
        $result = Get-GenXdevPreference -Name 'NonExistent' -DefaultValue 'Fallback'
        $result | Pester\Should -Be 'Fallback'
    }

    Pester\It 'Should handle null default value' {
        $result = Get-GenXdevPreference -Name 'NonExistent'
        $result | Pester\Should -BeNullOrEmpty
    }

    Pester\It 'Should work on a different preferences set when setting a different database path in session once' {

        $testFile = (Expand-Path ([IO.Path]::GetTempFileName()) -DeleteExistingFile -CreateDirectory)

        Set-GenXdevPreferencesDatabasePath $testFile -SessionOnly

        $result = Get-GenXdevPreference -Name 'TestPref1'
        $result | Pester\Should -Not -Be 'LocalValue'

        Set-GenXdevPreference -Name 'TestPref1' -Value 'DifferentValue'

        $result = Get-GenXdevPreference -Name 'TestPref1'
        $result | Pester\Should -Be 'DifferentValue'

        Set-GenXdevPreferencesDatabasePath -ClearSession

        $result = Get-GenXdevPreference -Name 'TestPref1'
        $result | Pester\Should -Be 'LocalValue'

        $result = Get-GenXdevPreference -Name 'TestPref2'
        $result | Pester\Should -Be 'DefaultValue'

        $result = Get-GenXdevPreference -Name 'NonExistent' -DefaultValue 'Fallback'
        $result | Pester\Should -Be 'Fallback'

        $result = Get-GenXdevPreference -Name 'NonExistent'
        $result | Pester\Should -BeNullOrEmpty
    }
}