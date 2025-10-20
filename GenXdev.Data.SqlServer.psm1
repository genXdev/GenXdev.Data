if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}



. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\EnsureSSMSInstalled.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Get-SQLServerTransaction.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Invoke-SqlServerQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\New-SQLServerDatabase.ps1"
