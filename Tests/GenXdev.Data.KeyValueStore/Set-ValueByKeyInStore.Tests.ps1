###############################################################################
Pester\BeforeAll {
    # Clean-up
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "TestKey"
}
Pester\AfterAll {
    # Clean-up
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "TestKey"
}
###############################################################################
Pester\Describe "Set-ValueByKeyInStore" {
    Pester\It "Should pass PSScriptAnalyzer rules" {

# get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.KeyValueStore\Set-ValueByKeyInStore.ps1"

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
        }
        catch {
            throw
        }
    }

    Pester\It "Should store a value successfully" {
        GenXdev.Data\Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "TestKey" -Value "TestValue"
        $result = GenXdev.Data\Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "TestKey"
        $result | Pester\Should -Be "TestValue"
    }

    Pester\It "Should update existing value" {
        GenXdev.Data\Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "TestKey" -Value "Value1"
        GenXdev.Data\Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "TestKey" -Value "Value2"
        $result = GenXdev.Data\Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "TestKey"
        $result | Pester\Should -Be "Value2"
    }

    Pester\It "Should handle null values" {
        GenXdev.Data\Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "TestKey" -Value $null
        $result = GenXdev.Data\Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "TestKey"
        $result | Pester\Should -BeNullOrEmpty
    }
}