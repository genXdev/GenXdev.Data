################################################################################
<#
.SYNOPSIS
Ensures SQLiteStudio is installed and accessible from the command line.

.DESCRIPTION
This function checks if SQLiteStudio is installed and available in the system PATH.
If not found, it attempts to install it using WinGet and configures the PATH
environment variable accordingly.

.EXAMPLE
AssureSQLiteStudioInstalled
#>
function AssureSQLiteStudioInstalled {

    [CmdletBinding()]
    param()

    begin {

        function IsWinGetInstalled {

            Import-Module "Microsoft.WinGet.Client" -ErrorAction SilentlyContinue
            $module = Get-Module "Microsoft.WinGet.Client" -ErrorAction SilentlyContinue

            return $null -ne $module
        }

        function InstallWinGet {

            Write-Verbose "Installing WinGet PowerShell client..."
            Install-Module "Microsoft.WinGet.Client" -Force -AllowClobber
            Import-Module "Microsoft.WinGet.Client"
        }
    }

    process {

        # check if sqlitestudio is already available
        if (@(Get-Command 'SQLiteStudio.exe' -ErrorAction SilentlyContinue).Length -eq 0) {

            # get the default installation path
            $sqliteStudioPath = (Expand-Path "${env:ProgramFiles}\SQLiteStudio")

            # get current user path and add sqlitestudio if needed
            $currentPath = [Environment]::GetEnvironmentVariable('PATH', 'User')
            if ($currentPath -notlike "*$sqliteStudioPath*") {

                Write-Verbose "Adding SQLiteStudio to PATH..."
                [Environment]::SetEnvironmentVariable(
                    'PATH',
                    "$currentPath;$sqliteStudioPath",
                    'User')

                # update current session path
                $env:PATH = [Environment]::GetEnvironmentVariable('PATH', 'User')
            }

            # verify if path update resolved the issue
            if (@(Get-Command 'SQLiteStudio.exe' -ErrorAction SilentlyContinue).Length -gt 0) {

                return
            }

            Write-Host "SQLiteStudio not found. Installing SQLiteStudio..."

            # ensure winget is available
            if (-not (IsWinGetInstalled)) {

                InstallWinGet
            }

            # install sqlitestudio using winget
            Install-WinGetPackage -Id 'PawelSalawa.SQLiteStudio' -Force

            # verify installation
            if (-not (Get-Command 'SQLiteStudioU.exe' -ErrorAction SilentlyContinue)) {

                Write-Error "SQLiteStudio installation failed."
                return
            }
        }
    }

    end {}
}
################################################################################
