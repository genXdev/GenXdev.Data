###############################################################################
BeforeAll {
    # Clean-up
    Remove-KeyFromStore -StoreName "TestStore" -KeyName "TestKey"
    Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"
}
AfterAll {
    # Clean-up
    Remove-KeyFromStore -StoreName "TestStore" -KeyName "TestKey"
    Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"
}
###############################################################################
Describe "Remove-KeyFromStore" {
    It "Should pass PSScriptAnalyzer rules" {
        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.KeyValueStore\Remove-KeyFromStore.ps1"

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
            Remove-KeyFromStore -StoreName "TestStore" -KeyName "TestKey"
            Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey"
        }
        catch {
            throw
        }
    }

    It "Should remove existing key" {
        Remove-KeyFromStore -StoreName "TestStore" -KeyName "TestKey"
        $result = Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "TestKey"
        $result | Should -BeNullOrEmpty
    }

    It "Should not error when removing non-existing key" {
        { Remove-KeyFromStore -StoreName "TestStore" -KeyName "NonExistingKey" } | Should -Not -Throw
    }
}