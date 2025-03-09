###############################################################################
BeforeAll {
    # Clean-up
    Remove-KeyValueStore -StoreName "TestStore"
}
AfterAll {
    # Clean-up
    Remove-KeyValueStore -StoreName "TestStore"
}
###############################################################################
Describe "Remove-KeyValueStore" {
    It "should pass PSScriptAnalyzer rules" {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.KeyValueStore\Remove-KeyValueStore.ps1"

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
            Remove-KeyValueStore -StoreName "TestStore"
        }
        catch {
            throw
        }
    }

    It "Should remove entire store" {
        Remove-KeyValueStore -StoreName "TestStore"
        $keys = Get-StoreKeys -StoreName "TestStore"
        $keys | Should -BeNullOrEmpty
    }
}
