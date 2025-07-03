Pester\BeforeAll {
    # Clean-up
    GenXdev.Data\Remove-KeyValueStore -StoreName "Store1"
    GenXdev.Data\Remove-KeyValueStore -StoreName "Store2"
}
Pester\AfterAll {
    # Clean-up
    GenXdev.Data\Remove-KeyValueStore -StoreName "Store1"
    GenXdev.Data\Remove-KeyValueStore -StoreName "Store2"
}

Pester\Describe "Get-KeyValueStoreNames" {
    Pester\It "Should pass PSScriptAnalyzer rules" {
# get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.KeyValueStore\Get-KeyValueStoreNames.ps1"

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
            GenXdev.Data\Remove-KeyValueStore -StoreName "Store1"
            GenXdev.Data\Remove-KeyValueStore -StoreName "Store2"

    # Setup test stores
            GenXdev.Data\Set-ValueByKeyInStore -StoreName "Store1" -KeyName "Key1" -Value "Value1"
            GenXdev.Data\Set-ValueByKeyInStore -StoreName "Store2" -KeyName "Key2" -Value "Value2"
        }
        catch {
            throw
        }
    }

    Pester\It "Should list all stores" {
        $stores = GenXdev.Data\Get-KeyValueStoreNames
        $stores | Pester\Should -Contain "Store1"
        $stores | Pester\Should -Contain "Store2"
    }
}