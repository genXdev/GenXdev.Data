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
Describe "Remove-KeyFromStore" {
    BeforeAll {
        try {
            Write-Verbose "Setting up test environment"
            & "$PSScriptRoot\Clear-TestData.ps1"
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
