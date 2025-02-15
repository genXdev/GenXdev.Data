################################################################################
<#
.SYNOPSIS
Ensures SQLiteStudio is installed and accessible from the command line.

.DESCRIPTION
Verifies if SQLiteStudio is installed and available in the system PATH. If not
found, it first checks if the PATH environment variable needs updating. If that
doesn't resolve the issue, it installs SQLiteStudio using WinGet and configures
the PATH environment variable.

.EXAMPLE
AssureSQLiteStudioInstalled
Checks and ensures SQLiteStudio is installed and accessible.
#>
function AssureSQLiteStudioInstalled {

    [CmdletBinding()]
    param()

    begin {

        ########################################################################
        <#
        .SYNOPSIS
        Checks if the WinGet PowerShell client module is installed.
        #>
        function IsWinGetInstalled {

            Import-Module "Microsoft.WinGet.Client" -ErrorAction SilentlyContinue
            $module = Get-Module "Microsoft.WinGet.Client" -ErrorAction SilentlyContinue

            return $null -ne $module
        }

        ########################################################################
        <#
        .SYNOPSIS
        Installs the WinGet PowerShell client module.
        #>
        function InstallWinGet {

            Write-Verbose "Installing WinGet PowerShell client..."
            Install-Module "Microsoft.WinGet.Client" -Force -AllowClobber
            Import-Module "Microsoft.WinGet.Client"
        }
    }

    process {

        # check if sqlitestudio executable is available in the system path
        if (@(Get-Command 'SQLiteStudio.exe' -ErrorAction SilentlyContinue).Length -eq 0) {

            # determine the default installation directory for sqlitestudio
            $sqliteStudioPath = (Expand-Path "${env:ProgramFiles}\SQLiteStudio")

            # get current user path environment variable
            $currentPath = [Environment]::GetEnvironmentVariable('PATH', 'User')

            # add sqlitestudio to path if not already present
            if ($currentPath -notlike "*$sqliteStudioPath*") {

                Write-Verbose "Adding SQLiteStudio directory to user PATH..."
                [Environment]::SetEnvironmentVariable(
                    'PATH',
                    "$currentPath;$sqliteStudioPath",
                    'User')

                # ensure current session has updated path
                $env:PATH = [Environment]::GetEnvironmentVariable('PATH', 'User')
            }

            # verify if path update resolved the missing executable
            if (@(Get-Command 'SQLiteStudio.exe' -ErrorAction SilentlyContinue).Length -gt 0) {

                return
            }

            Write-Host "SQLiteStudio not found. Installing SQLiteStudio..."

            # ensure winget package manager is available
            if (-not (IsWinGetInstalled)) {

                InstallWinGet
            }

            # attempt installation using winget
            Write-Verbose "Installing SQLiteStudio using WinGet..."
            Install-WinGetPackage -Id 'PawelSalawa.SQLiteStudio' -Force

            # verify successful installation
            if (-not (Get-Command 'SQLiteStudioU.exe' -ErrorAction SilentlyContinue)) {

                Write-Error "SQLiteStudio installation failed."
                return
            }
        }
    }

    end {}
}
################################################################################
