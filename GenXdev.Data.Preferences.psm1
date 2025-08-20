if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}



. "$PSScriptRoot\Functions\GenXdev.Data.Preferences\Get-GenXdevPreference.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.Preferences\Get-GenXdevPreferenceNames.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.Preferences\Get-GenXdevPreferencesDatabasePath.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.Preferences\Remove-GenXdevPreference.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.Preferences\Set-GenXdevDefaultPreference.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.Preferences\Set-GenXdevPreference.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.Preferences\Set-GenXdevPreferencesDatabasePath.ps1"
