###############################################################################
BeforeAll {
    # Clean-up
    Remove-KeyFromStore -StoreName "TestStore" -KeyName "Key1"
    Remove-KeyFromStore -StoreName "TestStore" -KeyName "Key2"
}
AfterAll {
    # Clean-up
    Remove-KeyFromStore -StoreName "TestStore" -KeyName "Key1"
    Remove-KeyFromStore -StoreName "TestStore" -KeyName "Key2"
}
###############################################################################
Describe "Get-StoreKeys" {
    It "Should pass PSScriptAnalyzer rules" {
        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.KeyValueStore\Get-StoreKeys.ps1"

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

    BeforeAll {
        try {
            Write-Verbose "Setting up test environment"
            Remove-KeyFromStore -StoreName "TestStore" -KeyName "Key1"
            Remove-KeyFromStore -StoreName "TestStore" -KeyName "Key2"

            # Setup test keys
            Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "Key1" -Value "Value1"
            Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "Key2" -Value "Value2"
        }
        catch {
            throw
        }
    }

    It "Should list all keys in store" {
        $keys = Get-StoreKeys -StoreName "TestStore"
        $keys | Should -Contain "Key1"
        $keys | Should -Contain "Key2"
        $keys.Count | Should -Be 2
    }

    It "Should return empty for non-existing store" {
        $keys = Get-StoreKeys -StoreName "NonExistingStore"
        $keys | Should -BeNullOrEmpty
    }
}
