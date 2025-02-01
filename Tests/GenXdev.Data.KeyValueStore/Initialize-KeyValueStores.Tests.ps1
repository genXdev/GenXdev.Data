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
Describe "Initialize-KeyValueStores" {

    BeforeAll {
        try {
            Write-Verbose "Setting up test environment"
            & "$PSScriptRoot\Clear-TestData.ps1"
        }
        catch {

            throw
        }
    }

    It "Should create both local and shadow databases" {
        # initialize the stores
        Initialize-KeyValueStores

        # verify database files exist
        $localDb = [System.IO.Path]::Combine(
            $PSScriptRoot, "..\..", "GenXdev.Local", "KeyValueStores.sqllite.db")
        $shadowDb = [System.IO.Path]::Combine(
            [Environment]::GetFolderPath('UserProfile'),
            "OneDrive", "GenXdev.PowerShell.SyncObjects", "KeyValueStores.sqllite.db")

        [System.IO.File]::Exists($localDb) | Should -BeTrue
        [System.IO.File]::Exists($shadowDb) | Should -BeTrue
    }
}
