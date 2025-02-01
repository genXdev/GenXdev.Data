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
Describe "Set-ValueByKeyInStore" {
    BeforeAll {
        try {
            Write-Verbose "Setting up test environment"
            & "$PSScriptRoot\Clear-TestData.ps1"
        }
        catch {

            throw
        }
    }

    It "Should store a value successfully" {
        Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "TestKey" -Value "TestValue"
        $result = Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "TestKey"
        $result | Should -Be "TestValue"
    }

    It "Should update existing value" {
        Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "TestKey" -Value "Value1"
        Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "TestKey" -Value "Value2"
        $result = Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "TestKey"
        $result | Should -Be "Value2"
    }

    It "Should handle null values" {
        Set-ValueByKeyInStore -StoreName "TestStore" -KeyName "TestKey" -Value $null
        $result = Get-ValueByKeyFromStore -StoreName "TestStore" -KeyName "TestKey"
        $result | Should -BeNullOrEmpty
    }
}
