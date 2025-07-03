###############################################################################
Pester\BeforeAll {
    # Clean-up
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "Key1"
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "Key2"
}
Pester\AfterAll {
    # Clean-up
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "Key1"
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "Key2"
}
###############################################################################
Pester\Describe "Get-StoreKeys" {
    Pester\It "Should pass PSScriptAnalyzer rules" {
# get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.KeyValueStore\Get-StoreKeys.ps1"

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
            GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "Key1"
            GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "Key2"

    # Setup test keys
            GenXdev.Data\Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "Key1" -Value "Value1"
            GenXdev.Data\Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "Key2" -Value "Value2"
        }
        catch {
            throw
        }
    }

    Pester\It "Should list all keys in store" {
        $keys = GenXdev.Data\Get-StoreKeys -StoreName "TestStore"
        $keys | Pester\Should -Contain "Key1"
        $keys | Pester\Should -Contain "Key2"
        $keys.Count | Pester\Should -Be 2
    }

    Pester\It "Should return empty for non-existing store" {
        $keys = GenXdev.Data\Get-StoreKeys -StoreName "NonExistingStore"
        $keys | Pester\Should -BeNullOrEmpty
    }
}