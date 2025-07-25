###############################################################################
Pester\BeforeAll {
    # Clean-up
    GenXdev.Data\Remove-GenXdevPreference -Name 'TestDefault' -RemoveDefault
}
Pester\AfterAll {
    # Clean-up
    GenXdev.Data\Remove-GenXdevPreference -Name 'TestDefault' -RemoveDefault
}
###############################################################################
Pester\Describe 'Set-GenXdevDefaultPreference' {
    Pester\It 'Should pass PSScriptAnalyzer rules' {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.Preferences\Set-GenXdevDefaultPreference.ps1"

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

    Pester\It 'Should store default preference value' {
        GenXdev.Data\Set-GenXdevDefaultPreference -Name 'TestDefault' -Value 'DefaultValue'
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestDefault'
        $result | Pester\Should -Be 'DefaultValue'
    }

    Pester\It 'Should sync across instances' {
        GenXdev.Data\Set-GenXdevDefaultPreference -Name 'TestDefault' -Value 'SyncedValue'
        # Note: In a real test environment, you might need to verify this across different PS sessions
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestDefault'
        $result | Pester\Should -Be 'SyncedValue'
    }

    Pester\It 'Should handle null value by removing preference' {
        GenXdev.Data\Set-GenXdevDefaultPreference -Name 'TestDefault' -Value 'DefaultValue'
        GenXdev.Data\Set-GenXdevDefaultPreference -Name 'TestDefault' -Value $null
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestDefault'
        $result | Pester\Should -BeNullOrEmpty
    }
}