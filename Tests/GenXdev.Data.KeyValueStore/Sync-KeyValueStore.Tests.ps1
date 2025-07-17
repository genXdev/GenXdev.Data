###############################################################################
Pester\BeforeAll {
    # Clean-up
    Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'SyncKey' -SynchronizationKey 'TestSync'
    Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'LocalKey' -SynchronizationKey 'Local'
}
Pester\AfterAll {
    # Clean-up
    Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'SyncKey' -SynchronizationKey 'TestSync'
    Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'LocalKey' -SynchronizationKey 'Local'
}
###############################################################################
Pester\Describe 'Sync-KeyValueStore' {
    Pester\It 'Should pass PSScriptAnalyzer rules' {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Data.KeyValueStore\Sync-KeyValueStore.ps1"

        # run analyzer with explicit settings
        $analyzerResults = GenXdev.Coding\Invoke-GenXdevScriptAnalyzer `
            -Path $scriptPath

        [string] $message = ''
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
            Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test environment'
            Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'SyncKey' -SynchronizationKey 'TestSync'
            Remove-KeyFromStore -StoreName 'TestStore' -KeyName 'LocalKey' -SynchronizationKey 'Local'
        }
        catch {
            throw
        }
    }

    Pester\It 'Should sync between local and shadow databases' {
        Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'SyncKey' -Value 'SyncValue' -SynchronizationKey 'TestSync'
        Sync-KeyValueStore -SynchronizationKey 'TestSync'

        # Check shadow database
        $shadowValue = Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'SyncKey' -SynchronizationKey 'TestSync'
        $shadowValue | Pester\Should -Be 'SyncValue'
    }

    Pester\It 'Should not sync Local synchronization key' {
        Set-ValueByKeyInStore -StoreName 'TestStore' -KeyName 'LocalKey' -Value 'LocalValue' -SynchronizationKey 'Local'
        Sync-KeyValueStore -SynchronizationKey 'Local'

        # Local sync Should not create shadow entry
        $shadowValue = Get-ValueByKeyFromStore -StoreName 'TestStore' -KeyName 'LocalKey' -SynchronizationKey 'Local'
        $shadowValue | Pester\Should -Be 'LocalValue'
    }
}