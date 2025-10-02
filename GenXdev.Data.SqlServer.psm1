if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}



. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\EnsureSSMSInstalled.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Get-SQLServerSchema.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Get-SQLServerTableColumnData.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Get-SQLServerTableData.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Get-SQLServerTables.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Get-SQLServerTableSchema.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Get-SQLServerTransaction.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Get-SQLServerViewColumnData.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Get-SQLServerViewData.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Get-SQLServerViews.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Get-SQLServerViewSchema.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Invoke-SqlServerQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\Invoke-SSMS.ps1"
. "$PSScriptRoot\Functions\GenXdev.Data.SqlServer\New-SQLServerDatabase.ps1"
