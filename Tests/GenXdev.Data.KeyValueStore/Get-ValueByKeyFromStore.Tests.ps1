###############################################################################
BeforeAll {
    # Clean-up
    Remove-KeyFromStore -StoreName "TestStore" -KeyName "ExistingKey"
    Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"
}
AfterAll {
    # Clean-up
    Remove-KeyFromStore -StoreName "TestStore" -KeyName "ExistingKey"
    Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"
}
###############################################################################
Describe "Get-ValueByKeyFromStore" {
    It "Should pass PSScriptAnalyzer rules" {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.KeyValueStore\Get-ValueByKeyFromStore.ps1"

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
            Remove-KeyFromStore -StoreName "TestStore" -KeyName "ExistingKey"
            Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"

            # Setup test data
            Set-ValueByKeyInStore -StoreName "TestStore" `
                -KeyName "ExistingKey" `
                -Value "ExistingValue"
        }
        catch {
            throw
        }
    }

    It "Should retrieve existing value" {
        $result = Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "ExistingKey"
        $result | Should -Be "ExistingValue"
    }

    It "Should return default value for non-existing key" {
        $result = Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey" -DefaultValue "Default"
        $result | Should -Be "Default"
    }

    It "Should return null for non-existing key without default" {
        $result = Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"
        $result | Should -BeNullOrEmpty
    }
}