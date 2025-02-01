###############################################################################
BeforeAll {
    # Clean-up
    & "$PSScriptRoot\Clear-TestData.ps1"
}
AfterAll {
    # Clean-up
    & "$PSScriptRoot\Clear-TestData.ps1"
}
###############################################################################
Describe "Get-StoreKeys" {
    BeforeAll {
        try {
            Write-Verbose "Setting up test environment"
            & "$PSScriptRoot\Clear-TestData.ps1"

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
