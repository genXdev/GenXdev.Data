###############################################################################
Pester\BeforeAll {
    # Clean-up
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "TestKey"
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"
}
Pester\AfterAll {
    # Clean-up
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "TestKey"
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"
}
###############################################################################
Pester\Describe "Remove-KeyFromStore" {
    Pester\It "Should pass PSScriptAnalyzer rules" {
        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.KeyValueStore\Remove-KeyFromStore.ps1"

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

    Pester\BeforeAll {
        try {
            Microsoft.PowerShell.Utility\Write-Verbose "Setting up test environment"
            GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "TestKey"
            GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"
        }
        catch {
            throw
        }
    }

    Pester\It "Should remove existing key" {
        GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "TestKey"
        $result = GenXdev.Data\Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "TestKey"
        $result | Pester\Should -BeNullOrEmpty
    }

    Pester\It "Should not error when removing non-existing key" {
        { GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey" } | Pester\Should -Not -Throw
    }
}