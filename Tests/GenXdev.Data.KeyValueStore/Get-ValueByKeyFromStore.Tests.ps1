###############################################################################
Pester\BeforeAll {
    # Clean-up
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "ExistingKey"
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"
}
Pester\AfterAll {
    # Clean-up
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "ExistingKey"
    GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"
}
###############################################################################
Pester\Describe "Get-ValueByKeyFromStore" {
    Pester\It "Should pass PSScriptAnalyzer rules" {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.KeyValueStore\Get-ValueByKeyFromStore.ps1"

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
            GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "ExistingKey"
            GenXdev.Data\Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"

            # Setup test data
            GenXdev.Data\Set-ValueByKeyInStore -StoreName "TestStore" `
                -KeyName "ExistingKey" `
                -Value "ExistingValue"
        }
        catch {
            throw
        }
    }

    Pester\It "Should retrieve existing value" {
        $result = GenXdev.Data\Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "ExistingKey"
        $result | Pester\Should -Be "ExistingValue"
    }

    Pester\It "Should return default value for non-existing key" {
        $result = GenXdev.Data\Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey" -DefaultValue "Default"
        $result | Pester\Should -Be "Default"
    }

    Pester\It "Should return null for non-existing key without default" {
        $result = GenXdev.Data\Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"
        $result | Pester\Should -BeNullOrEmpty
    }
}