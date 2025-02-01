[CmdletBinding()]
param()

begin {
    # define test preference names to be cleaned up
    $testPrefs = @(
        "TestPref1",
        "TestPref2",
        "Theme",
        "TestDefault",
        "NonExistent"
    )
    Write-Verbose "Starting cleanup of test preferences"
}

process {
    foreach ($pref in $testPrefs) {
        Write-Verbose "Removing preference: $pref from all stores"
        Remove-GenXdevPreference -Name $pref -RemoveDefault
    }
}
