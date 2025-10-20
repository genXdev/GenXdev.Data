if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}



. "$PSScriptRoot\Functions\GenXdev.Data.SQLite\EnsureSQLiteStudioInstalled.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SQLite\Get-SQLiteTransaction.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SQLite\Invoke-SQLiteQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SQLite\New-SQLiteDatabase.ps1"
