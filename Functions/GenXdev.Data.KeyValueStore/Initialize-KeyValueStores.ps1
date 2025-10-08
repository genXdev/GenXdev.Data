<##############################################################################
Part of PowerShell module : GenXdev.Data.KeyValueStore
Original cmdlet filename  : Initialize-KeyValueStores.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.298.2025
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
Initializes KeyValueStore directory structure for local and OneDrive storage.

.DESCRIPTION
Creates directory structure for JSON-based key-value stores in two locations:
1. Local machine for immediate access ($ENV:LOCALAPPDATA\GenXdev.PowerShell\KeyValueStore\)
2. OneDrive folder for cloud synchronization
The function ensures both directories exist and are properly configured.

.PARAMETER DatabasePath
Base directory path for key-value store JSON files.

.EXAMPLE
Initialize-KeyValueStores -DatabasePath "C:\MyStores"

.EXAMPLE
Initialize-KeyValueStores
#>
function Initialize-KeyValueStores {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]

    param(
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Database path for key-value store data files'
        )]
        [string] $DatabasePath
        ###############################################################################
    )

    begin {

        # use provided base path or default to local app data
        if ([string]::IsNullOrWhiteSpace($DatabasePath)) {

            $basePath = GenXdev.FileSystem\Expand-Path `
                "$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\KeyValueStore" `
                -CreateDirectory
        }
        else {

            $basePath = GenXdev.FileSystem\Expand-Path $DatabasePath `
                -CreateDirectory
        }

        # output verbose message showing selected base path
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using KeyValueStore directory: $basePath"

        # determine the path for onedrive synchronized store directory
        $shadowPath = GenXdev.FileSystem\Expand-Path `
            '~\Onedrive\GenXdev.PowerShell.SyncObjects\KeyValueStore' `
            -CreateDirectory

        # output verbose message for shadow path
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Using OneDrive sync directory: $shadowPath"
    }


    process {

        # iterate through both directory paths to ensure they exist
        foreach ($storePath in @($basePath, $shadowPath)) {

            # create directory if it doesn't exist
            if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $storePath)) {

                # output verbose message about directory creation
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Creating KeyValueStore directory at: $storePath"

                # create directory structure
                $null = GenXdev.FileSystem\Expand-Path $storePath `
                    -CreateDirectory
            }

            # make the onedrive sync folder hidden to prevent user interference
            if ($storePath -eq $shadowPath) {
                # ensure directory exists before setting attributes
                if (Microsoft.PowerShell.Management\Test-Path -LiteralPath $storePath) {
                    $folder = [System.IO.DirectoryInfo]::new($storePath)
                    $folder.Attributes = $folder.Attributes -bor `
                        [System.IO.FileAttributes]::Hidden
                }
            }
        }
    }

    end {
    }
}
