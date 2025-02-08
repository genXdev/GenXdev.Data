################################################################################

Describe "Initialize-KeyValueStores Initialize-KeyValueStores" {

    BeforeAll {
        # set up test paths
        $Script:testRoot = $PSScriptRoot

        # set local database path
        $Script:localDbPath = Expand-Path "$PSScriptRoot\..\..\..\..\GenXdev.Local\KeyValueStores.sqllite.db"

        # determine onedrive path dynamically
        $Script:userProfile = [Environment]::GetFolderPath('UserProfile')
        $Script:shadowDbPath = Expand-Path "$userProfile\OneDrive\GenXdev.PowerShell.SyncObjects\KeyValueStores.sqllite.db"

        Write-Verbose "Setting up test environment"
        try {
            # ensure clean test environment
            & "$PSScriptRoot\Clear-TestData.ps1"
        }
        catch {
            throw
        }
    }

    AfterAll {
        Write-Verbose "Cleaning up test environment"
        try {
            # clean up test data
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
        $null = Test-Path $Script:localDbPath | Should -BeTrue
        $null = Test-Path $Script:shadowDbPath | Should -BeTrue
    }
}

################################################################################
