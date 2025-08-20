Pester\Describe 'Get-GenXdevPreference' {

    Pester\BeforeAll {

        Microsoft.PowerShell.Utility\Write-Verbose 'Setting up test environment'
        GenXdev.Data\Remove-GenXdevPreference -Name 'TestPref1' -RemoveDefault
        GenXdev.Data\Remove-GenXdevPreference -Name 'TestPref2' -RemoveDefault
        GenXdev.Data\Set-GenXdevPreference -Name 'TestPref1' -Value 'LocalValue'
        GenXdev.Data\Set-GenXdevDefaultPreference -Name 'TestPref2' -Value 'DefaultValue'
    }

    Pester\AfterAll {
        # Clean-up
        GenXdev.Data\Remove-GenXdevPreference -Name 'TestPref1' -RemoveDefault
        GenXdev.Data\Remove-GenXdevPreference -Name 'TestPref2' -RemoveDefault
    }

    Pester\It 'Should retrieve local preference value' {
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestPref1'
        $result | Pester\Should -Be 'LocalValue'
    }

    Pester\It 'Should fall back to default value when local not found' {
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestPref2'
        $result | Pester\Should -Be 'DefaultValue'
    }

    Pester\It 'Should return specified default when preference not found' {
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'NonExistent' -DefaultValue 'Fallback'
        $result | Pester\Should -Be 'Fallback'
    }

    Pester\It 'Should handle null default value' {
        $result = GenXdev.Data\Get-GenXdevPreference -Name 'NonExistent'
        $result | Pester\Should -BeNullOrEmpty
    }

    Pester\It 'Should work on a different preferences set when setting a different database path in session once' {

        $testFile = (GenXdev.FileSystem\Expand-Path ([IO.Path]::GetTempFileName()) -DeleteExistingFile -CreateDirectory)

        GenXdev.Data\Set-GenXdevPreferencesDatabasePath $testFile -SessionOnly

        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestPref1'
        $result | Pester\Should -Not -Be 'LocalValue'

        GenXdev.Data\Set-GenXdevPreference -Name 'TestPref1' -Value 'DifferentValue'

        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestPref1'
        $result | Pester\Should -Be 'DifferentValue'

        GenXdev.Data\Set-GenXdevPreferencesDatabasePath -ClearSession

        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestPref1'
        $result | Pester\Should -Be 'LocalValue'

        $result = GenXdev.Data\Get-GenXdevPreference -Name 'TestPref2'
        $result | Pester\Should -Be 'DefaultValue'

        $result = GenXdev.Data\Get-GenXdevPreference -Name 'NonExistent' -DefaultValue 'Fallback'
        $result | Pester\Should -Be 'Fallback'

        $result = GenXdev.Data\Get-GenXdevPreference -Name 'NonExistent'
        $result | Pester\Should -BeNullOrEmpty
    }
}