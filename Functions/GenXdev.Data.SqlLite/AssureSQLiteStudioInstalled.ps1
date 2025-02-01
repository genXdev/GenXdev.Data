#######################################################################################

function AssureSQLiteStudioInstalled {

    function IsWinGetInstalled {

        Import-Module "Microsoft.WinGet.Client" -ErrorAction SilentlyContinue
        $module = Get-Module "Microsoft.WinGet.Client" -ErrorAction SilentlyContinue

        if ($null -eq $module) {

            return $false
        }

        return $true
    }

    function InstallWinGet {

        Write-Verbose "Installing WinGet PowerShell client.."
        Install-Module "Microsoft.WinGet.Client" -Force -AllowClobber
        Import-Module "Microsoft.WinGet.Client"
    }

    # Check if SQLiteStudio command is available
    if (@(Get-Command 'SQLiteStudio.exe' -ErrorAction SilentlyContinue).Length -eq 0) {

        # Get the installation directory of SQLiteStudio
        $SQLiteStudioPath = (Expand-Path "${env:ProgramFiles}\SQLiteStudio")

        # Add SQLiteStudio's path to the current user's environment PATH
        $currentPath = [Environment]::GetEnvironmentVariable('PATH', 'User')
        if ($currentPath -notlike "*$SQLiteStudioPath*") {

            [Environment]::SetEnvironmentVariable('PATH', "$currentPath;$SQLiteStudioPath", 'User')

            # Update the PATH for the current session
            $env:PATH = [Environment]::GetEnvironmentVariable('PATH', 'User')
        }

        # Check if SQLiteStudio command is available
        if (@(Get-Command 'SQLiteStudio.exe' -ErrorAction SilentlyContinue).Length -gt 0) {

            return;
        }

        Write-Host "SQLiteStudio not found. Installing SQLiteStudio..."

        if (-not (IsWinGetInstalled)) {

            InstallWinGet
        }

        Install-WinGetPackage -Id 'PawelSalawa.SQLiteStudio' -Force

        if (-not (Get-Command 'SQLiteStudioU.exe' -ErrorAction SilentlyContinue)) {

            Write-Error "SQLiteStudio installation path not found."

            return
        }
    }
}
