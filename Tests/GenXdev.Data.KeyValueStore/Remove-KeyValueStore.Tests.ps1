###############################################################################
Pester\BeforeAll {
    # Clean-up
    Remove-KeyValueStore -StoreName 'TestStore'
}
Pester\AfterAll {
    # Clean-up
    Remove-KeyValueStore -StoreName 'TestStore'
}
###############################################################################
Pester\Describe 'Remove-KeyValueStore' {
    Pester\It 'Should pass PSScriptAnalyzer rules' {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.KeyValueStore\Remove-KeyValueStore.ps1"

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

    Pester\BeforeAll {
        try {
            Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test environment'
            Remove-KeyValueStore -StoreName 'TestStore'
        }
        catch {
            throw
        }
    }

    Pester\It 'Should remove entire store' {
        Remove-KeyValueStore -StoreName 'TestStore'
        $keys = Get-StoreKeys -StoreName 'TestStore'
        $keys | Pester\Should -BeNullOrEmpty
    }
}