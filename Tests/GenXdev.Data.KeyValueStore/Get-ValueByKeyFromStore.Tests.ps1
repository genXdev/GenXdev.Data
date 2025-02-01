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
Describe "Get-ValueByKeyFromStore" {
    BeforeAll {
        try {
            Write-Verbose "Setting up test environment"
            & "$PSScriptRoot\Clear-TestData.ps1"

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
