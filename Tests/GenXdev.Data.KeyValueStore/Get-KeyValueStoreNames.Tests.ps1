Describe "Get-KeyValueStoreNames" {
    BeforeAll {
        try {
            Write-Verbose "Setting up test environment"
            & "$PSScriptRoot\Clear-TestData.ps1"

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
