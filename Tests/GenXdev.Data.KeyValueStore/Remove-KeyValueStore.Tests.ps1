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
Describe "Remove-KeyValueStore" {
    BeforeAll {
        try {
            Write-Verbose "Setting up test environment"
            & "$PSScriptRoot\Clear-TestData.ps1"
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
