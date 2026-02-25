<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : EnsureSSMSInstalled.ps1
Original author           : René Vaessen / GenXdev
Version                   : 3.3.2026
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
################################################################################>
###############################################################################
<#
.SYNOPSIS
Ensures SSMS is installed and accessible from the command line.

.DESCRIPTION
Verifies if SSMS is installed and available in the system PATH. If not
found, it first checks if the PATH environment variable needs updating. If that
doesn't resolve the issue, it installs SSMS using WinGet and configures
the PATH environment variable.

.EXAMPLE
EnsureSSMSInstalled
Checks and ensures SSMS is installed and accessible.
#>
function EnsureSSMSInstalled {

    [CmdletBinding()]
    param(
        [switch] $Force
    )

    begin {

        ########################################################################
        <#
        .SYNOPSIS
        Checks if the WinGet PowerShell client module is installed.
        #>
        function IsWinGetInstalled {

            Microsoft.PowerShell.Core\Import-Module 'Microsoft.WinGet.Client' -ErrorAction SilentlyContinue
            $ModuleObj = Microsoft.PowerShell.Core\Get-Module 'Microsoft.WinGet.Client' -ErrorAction SilentlyContinue

            return $null -ne $ModuleObj
        }

        ########################################################################
        <#
        .SYNOPSIS
        Installs the WinGet PowerShell client module.
        #>
        function InstallWinGet {

            $consent = GenXdev.FileSystem\Confirm-InstallationConsent `
                -ApplicationName 'Microsoft.WinGet.Client' `
                -Source 'PowerShell Gallery' `
                -Description 'Required for installing SQL Server Management Studio' `
                -Publisher 'Microsoft'

            if (-not $consent) {
                throw "Installation consent denied for Microsoft.WinGet.Client module. Cannot proceed with SSMS installation."
            }

            Microsoft.PowerShell.Utility\Write-Verbose 'Installing WinGet PowerShell client...'
            PowerShellGet\Install-Module 'Microsoft.WinGet.Client' -Force -AllowClobber
            Microsoft.PowerShell.Core\Import-Module 'Microsoft.WinGet.Client'
        }

        $searchPath  = GenXdev.FileSystem\Find-Item `
             "${Env:ProgramFiles(x86)}\*SQL Server Management*\Ssms.exe",
             "${Env:ProgramFiles}\*SQL Server Management*\Ssms.exe" |
             Microsoft.PowerShell.Utility\Sort-Object LastWriteTime -Descending | Microsoft.PowerShell.Utility\Select-Object -First 1

        if ($Force -or -not $searchPath) {

            # ensure winget package manager is available
            if (-not (IsWinGetInstalled)) {

                InstallWinGet
            }

            $consent = GenXdev.FileSystem\Confirm-InstallationConsent `
                -ApplicationName 'SQL Server Management Studio 22 Preview' `
                -Source 'Winget' `
                -Description 'Required for SQL Server database management and administration' `
                -Publisher 'Microsoft'

            if (-not $consent) {
                throw "Installation consent denied for SQL Server Management Studio. Cannot proceed with SSMS installation."
            }

            Microsoft.WinGet.Client\Install-WinGetPackage -Id "Microsoft.SQLServerManagementStudio.22.Preview"

            $searchPath  = GenXdev.FileSystem\Find-Item  `
             "${Env:ProgramFiles(x86)}\*SQL Server Management*\Ssms.exe",
             "${Env:ProgramFiles}\*SQL Server Management*\Ssms.exe" |
             Microsoft.PowerShell.Utility\Sort-Object LastWriteTime -Descending | Microsoft.PowerShell.Utility\Select-Object -First 1
        }

        if (-not $searchPath) {
            Throw "SSMS not found after installation attempt."
        }
    }


    process {

    }

    end {}
}