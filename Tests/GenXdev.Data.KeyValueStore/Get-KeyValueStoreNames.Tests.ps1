BeforeAll {
    # Clean-up
    Remove-KeyValueStore -StoreName "Store1"
    Remove-KeyValueStore -StoreName "Store2"
}
AfterAll {
    # Clean-up
    Remove-KeyValueStore -StoreName "Store1"
    Remove-KeyValueStore -StoreName "Store2"
}

Describe "Get-KeyValueStoreNames" {
    It "Should pass PSScriptAnalyzer rules" {
        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.KeyValueStore\Get-KeyValueStoreNames.ps1"

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
            Remove-KeyValueStore -StoreName "Store1"
            Remove-KeyValueStore -StoreName "Store2"

            # Setup test stores
            Set-ValueByKeyInStore -StoreName "Store1" -KeyName "Key1" -Value "Value1"
            Set-ValueByKeyInStore -StoreName "Store2" -KeyName "Key2" -Value "Value2"
        }
        catch {
            throw
        }
    }

    It "Should list all stores" {
        $stores = Get-KeyValueStoreNames
        $stores | Should -Contain "Store1"
        $stores | Should -Contain "Store2"
    }
}
