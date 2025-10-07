<##############################################################################
Part of PowerShell module : GenXdev.Data.SqlServer
Original cmdlet filename  : EnsureSSMSInstalled.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.296.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
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
    param()

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

        if (-not $searchPath) {

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

            Microsoft.WinGet.Client\Install-WinGetPackage -Id "Microsoft SQL Server Management Studio 22 Preview"

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