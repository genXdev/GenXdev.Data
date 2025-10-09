<##############################################################################
Part of PowerShell module : GenXdev.Data.KeyValueStore
Original cmdlet filename  : Set-ValueByKeyInStore.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
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
Manages key-value pairs in a JSON file-based store.

.DESCRIPTION
Provides persistent storage for key-value pairs using JSON files. Handles both
insertion of new entries and updates to existing ones. Supports optional
synchronization for non-local stores. This function implements an upsert
operation that either inserts new key-value pairs or updates existing ones
based on the combination of synchronization key, store name, and key name.

.PARAMETER StoreName
The name of the store where the key-value pair will be saved.

.PARAMETER KeyName
The unique identifier for the value within the specified store.

.PARAMETER Value
The data to be stored, associated with the specified key.

.PARAMETER SynchronizationKey
Identifies the synchronization scope. Use "Local" for local-only storage.
Defaults to "Local". Non-local values trigger store synchronization.

.PARAMETER DatabasePath
Database path for key-value store data files.

.EXAMPLE
Set-ValueByKeyInStore -StoreName "ConfigStore" -KeyName "ApiEndpoint" `
    -Value "https://api.example.com"

.EXAMPLE
setvalue ConfigStore ApiEndpoint "https://api.example.com"
#>
function Set-ValueByKeyInStore {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('setvalue')]

    param (
        ###############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'Store name for the key-value pair'
        )]
        [string]$StoreName,
        ###############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = 'Name of the key to set or update'
        )]
        [string]$KeyName,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = 'Value to be stored'
        )]
        [string]$Value,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 3,
            HelpMessage = 'Key to identify synchronization scope'
        )]
        [string]$SynchronizationKey = 'Local',
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Database path for key-value store data files'
        )]
        [string]$DatabasePath
        ###############################################################################
    )

    begin {

        # use provided base path or default to local app data
        if ([string]::IsNullOrWhiteSpace($DatabasePath)) {

            $basePath = "$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\KeyValueStore"
        }
        else {

            $basePath = $DatabasePath
        }

        Microsoft.PowerShell.Utility\Write-Verbose (
            "Using KeyValueStore directory: $basePath")
    }

    process {

        # ensure store directory structure exists
        if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $basePath)) {

            Microsoft.PowerShell.Utility\Write-Verbose (
                'Store directory not found. Initializing...')

            # copy identical parameter values for Initialize-KeyValueStores
            $initParams = GenXdev.FileSystem\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Data\Initialize-KeyValueStores' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            GenXdev.Data\Initialize-KeyValueStores @initParams
        }

        # get current user identity for audit trail purposes
        $lastModifiedBy = "$env:COMPUTERNAME\$env:USERNAME"

        Microsoft.PowerShell.Utility\Write-Verbose (
            "Setting value as user: $lastModifiedBy")

        # only proceed if user confirms or -WhatIf is not used
        if ($PSCmdlet.ShouldProcess(
                "Store: $StoreName, Key: $KeyName",
                "Set value to: $Value")) {

            Microsoft.PowerShell.Utility\Write-Verbose (
                "Executing upsert for key '$KeyName' in store '$StoreName'")

            # get JSON file path for this store
            $storeFilePath = GenXdev.Data\GetStoreFilePath `
                -SynchronizationKey $SynchronizationKey `
                -StoreName $StoreName `
                -BasePath $basePath

            # read existing store data with retry logic
            $storeData = GenXdev.FileSystem\ReadJsonWithRetry -FilePath $storeFilePath

            # create or update the entry with metadata
            $storeData[$KeyName] = @{
                value          = $Value
                lastModified   = (Microsoft.PowerShell.Utility\Get-Date).ToString('o')
                lastModifiedBy = $lastModifiedBy
                deletedDate    = $null
            }

            # write updated store data atomically with retry logic
            GenXdev.FileSystem\WriteJsonAtomic -FilePath $storeFilePath -Data $storeData

            # handle synchronization for non-local stores
            if ($SynchronizationKey -ne 'Local') {

                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Synchronizing non-local store: $SynchronizationKey")

                # copy identical parameter values for Sync-KeyValueStore
                $syncParams = GenXdev.FileSystem\Copy-IdenticalParamValues `
                    -BoundParameters $PSBoundParameters `
                    -FunctionName 'GenXdev.Data\Sync-KeyValueStore' `
                    -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                        -Scope Local `
                        -ErrorAction SilentlyContinue)

                # assign specific parameters for synchronization
                $syncParams.SynchronizationKey = $SynchronizationKey

                # trigger the synchronization process
                GenXdev.Data\Sync-KeyValueStore @syncParams
            }
        }
    }

    end {
    }
}