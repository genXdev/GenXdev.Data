if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}


. "$PSScriptRoot\Functions\GenXdev.Data.KeyValueStore\Get-KeyValueStoreNames.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.KeyValueStore\Get-StoreKeys.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.KeyValueStore\Get-ValueByKeyFromStore.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.KeyValueStore\Initialize-KeyValueStores.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.KeyValueStore\Remove-KeyFromStore.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.KeyValueStore\Remove-KeyValueStore.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.KeyValueStore\Set-ValueByKeyInStore.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.KeyValueStore\Sync-KeyValueStore.ps1"
