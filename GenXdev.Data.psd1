#
# Module manifest for module 'GenXdev.Data'
#
# Generated by: genXdev
#
# Generated on: 27/03/2025
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'GenXdev.Data.psm1'

# Version number of this module.
ModuleVersion = '1.158.2025'

# Supported PSEditions
CompatiblePSEditions = 'Core'

# ID used to uniquely identify this module
GUID = '2a32080f-0483-4421-8497-b3d433b65172'

# Author of this module
Author = 'genXdev'

# Company or vendor of this module
CompanyName = 'GenXdev'

# Copyright statement for this module
Copyright = 'Copyright 2021-2025 GenXdev'

# Description of the functionality provided by this module
Description = 'A Windows PowerShell module with helpers for working with data and databases'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '7.5.0'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
ClrVersion = '9.0.1'

# Processor architecture (None, X86, Amd64) required by this module
ProcessorArchitecture = 'Amd64'

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(@{ModuleName = 'GenXdev.Helpers'; ModuleVersion = '1.158.2025'; }, 
               @{ModuleName = 'GenXdev.FileSystem'; ModuleVersion = '1.158.2025'; })

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('GenXdev.Data.KeyValueStore.psm1', 
               'GenXdev.Data.Preferences.psm1', 
               'GenXdev.Data.SQLite.psm1', 
               'GenXdev.Data.SqlServer.psm1')

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'AssureSQLiteStudioInstalled', 'Get-GenXdevPreference', 
               'Get-GenXdevPreferenceNames', 'Get-KeyValueStoreNames', 
               'Get-SQLiteSchema', 'Get-SQLiteTableColumnData', 
               'Get-SQLiteTableData', 'Get-SQLiteTables', 'Get-SQLiteTableSchema', 
               'Get-SQLiteViewColumnData', 'Get-SQLiteViewData', 'Get-SQLiteViews', 
               'Get-SQLiteViewSchema', 'Get-StoreKeys', 'Get-ValueByKeyFromStore', 
               'Initialize-KeyValueStores', 'Invoke-SQLiteQuery', 
               'Invoke-SQLiteStudio', 'Invoke-SqlServerQuery', 'New-SQLiteDatabase', 
               'Remove-GenXdevPreference', 'Remove-KeyFromStore', 
               'Remove-KeyValueStore', 'Set-GenXdevDefaultPreference', 
               'Set-GenXdevPreference', 'Set-ValueByKeyInStore', 
               'Sync-KeyValueStore'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'getkeys', 'getPreference', 'getPreferenceNames', 'getstorenames', 
               'getvalue', 'nsqldb', 'removekey', 'removePreference', 'setPreference', 
               'setPreferenceDefault', 'setvalue'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
ModuleList = @('GenXdev.Data')

# List of all files packaged with this module
FileList = 'GenXdev.Data.KeyValueStore.psm1', 'GenXdev.Data.Preferences.psm1', 
               'GenXdev.Data.psd1', 'GenXdev.Data.psm1', 'GenXdev.Data.SQLite.psm1', 
               'GenXdev.Data.SqlServer.psm1', 'LICENSE', 'license.txt', 
               'powershell.jpg', 'README.md', 
               'Tests\GenXdev.Data.SqlServer\Invoke-SqlServerQuery.Tests.ps1', 
               'Tests\GenXdev.Data.SQLite\AssureSQLiteStudioInstalled.Tests.ps1', 
               'Tests\GenXdev.Data.SQLite\Get-SQLiteSchema.Tests.ps1', 
               'Tests\GenXdev.Data.SQLite\Get-SQLiteTableColumnData.Tests.ps1', 
               'Tests\GenXdev.Data.SQLite\Get-SQLiteTableData.Tests.ps1', 
               'Tests\GenXdev.Data.SQLite\Get-SQLiteTables.Tests.ps1', 
               'Tests\GenXdev.Data.SQLite\Get-SQLiteTableSchema.Tests.ps1', 
               'Tests\GenXdev.Data.SQLite\Get-SQLiteViewColumnData.Tests.ps1', 
               'Tests\GenXdev.Data.SQLite\Get-SQLiteViewData.Tests.ps1', 
               'Tests\GenXdev.Data.SQLite\Get-SQLiteViews.Tests.ps1', 
               'Tests\GenXdev.Data.SQLite\Get-SQLiteViewSchema.Tests.ps1', 
               'Tests\GenXdev.Data.SQLite\Invoke-SQLiteQuery.Tests.ps1', 
               'Tests\GenXdev.Data.SQLite\Invoke-SQLiteStudio.Tests.ps1', 
               'Tests\GenXdev.Data.SQLite\New-SQLiteDatabase.Tests.ps1', 
               'Tests\GenXdev.Data.Preferences\Get-GenXdevPreference.Tests.ps1', 
               'Tests\GenXdev.Data.Preferences\Get-GenXdevPreferenceNames.Tests.ps1', 
               'Tests\GenXdev.Data.Preferences\Remove-GenXdevPreference.Tests.ps1', 
               'Tests\GenXdev.Data.Preferences\Set-GenXdevDefaultPreference.Tests.ps1', 
               'Tests\GenXdev.Data.Preferences\Set-GenXdevPreference.Tests.ps1', 
               'Tests\GenXdev.Data.KeyValueStore\Get-KeyValueStoreNames.Tests.ps1', 
               'Tests\GenXdev.Data.KeyValueStore\Get-StoreKeys.Tests.ps1', 
               'Tests\GenXdev.Data.KeyValueStore\Get-ValueByKeyFromStore.Tests.ps1', 
               'Tests\GenXdev.Data.KeyValueStore\Initialize-KeyValueStores.Tests.ps1', 
               'Tests\GenXdev.Data.KeyValueStore\Remove-KeyFromStore.Tests.ps1', 
               'Tests\GenXdev.Data.KeyValueStore\Remove-KeyValueStore.Tests.ps1', 
               'Tests\GenXdev.Data.KeyValueStore\Set-ValueByKeyInStore.Tests.ps1', 
               'Tests\GenXdev.Data.KeyValueStore\Sync-KeyValueStore.Tests.ps1', 
               'Functions\GenXdev.Data.SqlServer\Invoke-SqlServerQuery.ps1', 
               'Functions\GenXdev.Data.SQLite\AssureSQLiteStudioInstalled.ps1', 
               'Functions\GenXdev.Data.SQLite\Get-SQLiteSchema.ps1', 
               'Functions\GenXdev.Data.SQLite\Get-SQLiteTableColumnData.ps1', 
               'Functions\GenXdev.Data.SQLite\Get-SQLiteTableData.ps1', 
               'Functions\GenXdev.Data.SQLite\Get-SQLiteTables.ps1', 
               'Functions\GenXdev.Data.SQLite\Get-SQLiteTableSchema.ps1', 
               'Functions\GenXdev.Data.SQLite\Get-SQLiteViewColumnData.ps1', 
               'Functions\GenXdev.Data.SQLite\Get-SQLiteViewData.ps1', 
               'Functions\GenXdev.Data.SQLite\Get-SQLiteViews.ps1', 
               'Functions\GenXdev.Data.SQLite\Get-SQLiteViewSchema.ps1', 
               'Functions\GenXdev.Data.SQLite\Invoke-SQLiteQuery.ps1', 
               'Functions\GenXdev.Data.SQLite\Invoke-SQLiteStudio.ps1', 
               'Functions\GenXdev.Data.SQLite\New-SQLiteDatabase.ps1', 
               'Functions\GenXdev.Data.Preferences\Get-GenXdevPreference.ps1', 
               'Functions\GenXdev.Data.Preferences\Get-GenXdevPreferenceNames.ps1', 
               'Functions\GenXdev.Data.Preferences\Remove-GenXdevPreference.ps1', 
               'Functions\GenXdev.Data.Preferences\Set-GenXdevDefaultPreference.ps1', 
               'Functions\GenXdev.Data.Preferences\Set-GenXdevPreference.ps1', 
               'Functions\GenXdev.Data.KeyValueStore\Get-KeyValueStoreNames.ps1', 
               'Functions\GenXdev.Data.KeyValueStore\Get-StoreKeys.ps1', 
               'Functions\GenXdev.Data.KeyValueStore\Get-ValueByKeyFromStore.ps1', 
               'Functions\GenXdev.Data.KeyValueStore\Initialize-KeyValueStores.ps1', 
               'Functions\GenXdev.Data.KeyValueStore\Remove-KeyFromStore.ps1', 
               'Functions\GenXdev.Data.KeyValueStore\Remove-KeyValueStore.ps1', 
               'Functions\GenXdev.Data.KeyValueStore\Set-ValueByKeyInStore.ps1', 
               'Functions\GenXdev.Data.KeyValueStore\Sync-KeyValueStore.ps1'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'DataScience','Data','SqlServer','MWSQLServer','SQLite'

        # A URL to the license for this module.
        LicenseUri = 'https://raw.githubusercontent.com/genXdev/GenXdev.Data/main/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://powershell.genxdev.net/#GenXdev.Data'

        # A URL to an icon representing this module.
        IconUri = 'https://genxdev.net/favicon.ico'

        # ReleaseNotes of this module
        # ReleaseNotes = ''

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

