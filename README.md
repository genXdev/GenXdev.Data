<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Data
### SYNOPSIS
    A Windows PowerShell module for enhancing the commandline experience
[![GenXdev.Data](https://img.shields.io/powershellgallery/v/GenXdev.Data.svg?style=flat-square&label=GenXdev.Data)](https://www.powershellgallery.com/packages/GenXdev.Data/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Data?style=flat-square)](./LICENSE)

### FEATURES

    * ✅ Text-to-speech
    * ✅ Spotify control
    * ✅ Microsoft Shell helpers
    * ✅ after installation, use 'cmds' to see full list of installed GenXdev cmdslets

### DEPENDENCIES
[![WinOS - Windows-10 or later](https://img.shields.io/badge/WinOS-Windows--10--10.0.19041--SP0-brightgreen)](https://www.microsoft.com/en-us/windows/get-windows-10) [![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.FileSystem](https://img.shields.io/powershellgallery/v/GenXdev.Filesystem.svg?style=flat-square&label=GenXdev.FileSystem)](https://www.powershellgallery.com/packages/GenXdev.FileSystem/)
### INSTALLATION
````PowerShell
Install-Module "GenXdev.Data"
Import-Module "GenXdev.Data"
````
### UPDATE
````PowerShell
Update-Module
````

<br/><hr/><hr/><br/>

# Cmdlet Index
### GenXdev.Data<hr/>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [AssureSQLiteStudioInstalled](#AssureSQLiteStudioInstalled) |  |  |

<hr/>
&nbsp;

### GenXdev.Data.Preferences</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Set-GenXdevPreference](#Set-GenXdevPreference) | setPreference | This function sets a preference value in the local store. The value can beretrieved later using Get-GenXdevPreference. If the value is null, thepreference will be removed instead. |

<hr/>
&nbsp;

### GenXdev.Data.KeyValueStore</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-KeyValueStoreNames](#Get-KeyValueStoreNames) | getstorenames | SELECT DISTINCT ensures only unique store names are returned. |
| [Get-StoreKeys](#Get-StoreKeys) | getkeys | Runs a SELECT on the KeyValueStore table filtered by storeName. |
| [Get-ValueByKeyFromStore](#Get-ValueByKeyFromStore) | getvalue | Executes a SELECT statement to fetch the value for a given key in a given store. |
| [Initialize-KeyValueStores](#Initialize-KeyValueStores) |  | Creates SQLite databases with required schema both locally and in OneDrive forsynchronization purposes if they don't exist. |
| [Remove-KeyFromStore](#Remove-KeyFromStore) | removekey | Executes a DELETE statement targeting the given store and key. |
| [Remove-KeyValueStore](#Remove-KeyValueStore) |  | Executes a DELETE statement to remove all entries for the given store. |
| [Set-ValueByKeyInStore](#Set-ValueByKeyInStore) | setvalue | Uses an INSERT with ON CONFLICT to set or overwrite the value. |
| [Sync-KeyValueStore](#Sync-KeyValueStore) |  | Performs two-way sync between local and shadow databases, with last-modifiedwinning strategy. |

<hr/>
&nbsp;

### GenXdev.Data.Preferences</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-GenXdevPreference](#Get-GenXdevPreference) | getPreference | This function gets a preference value from the local store first, then falls backto the default store if not found. If neither store contains the value, returnsthe provided default value. |
| [Get-GenXdevPreferenceNames](#Get-GenXdevPreferenceNames) | getPreferenceNames | Retrieves a unique list of preference names by combining keys from both the localand default preference stores. The function merges the keys from both stores andensures uniqueness in the returned collection. |
| [Remove-GenXdevPreference](#Remove-GenXdevPreference) | removePreference | This function removes a preference value from the local store and optionally fromthe default store. It supports removing both local and default preferencesthrough parameter sets. |
| [Set-GenXdevDefaultPreference](#Set-GenXdevDefaultPreference) | setPreferenceDefault | This function sets a preference value in the default store and synchronizes itto ensure the changes are propagated across the system. |
| [Set-GenXdevDefaultPreference](#Set-GenXdevDefaultPreference) | setPreferenceDefault | This function sets a preference value in the default store and synchronizes itto ensure the changes are propagated across the system. |

<hr/>
&nbsp;

### GenXdev.Data.SqlLite</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [AssureSQLiteStudioInstalled](#AssureSQLiteStudioInstalled) |  |  |
| [Get-SqlLiteSchema](#Get-SqlLiteSchema) |  | Get the schema of a SQLite database. |
| [Get-SqlLiteTableColumnData](#Get-SqlLiteTableColumnData) |  |  |
| [Get-SqlLiteTableData](#Get-SqlLiteTableData) |  |  |
| [Get-SqlLiteTables](#Get-SqlLiteTables) |  |  |
| [Get-SqlLiteTableSchema](#Get-SqlLiteTableSchema) |  |  |
| [Get-SqlLiteViewColumnData](#Get-SqlLiteViewColumnData) |  |  |
| [Get-SqlLiteViewData](#Get-SqlLiteViewData) |  |  |
| [Get-SqlLiteViews](#Get-SqlLiteViews) |  |  |
| [Get-SqlLiteViewSchema](#Get-SqlLiteViewSchema) |  |  |
| [Invoke-SqlLiteQuery](#Invoke-SqlLiteQuery) |  | Execute a query against a SQLite database with support for parameters and with aconfigurable transaction isolation level.All queries are executed within the same transaction.If an error occurs, the transaction is rollbacked and the error is thrown. |
| [Invoke-SqlLiteStudio](#Invoke-SqlLiteStudio) |  |  |

<hr/>
&nbsp;

### GenXdev.Data.Preferences</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Set-GenXdevPreference](#Set-GenXdevPreference) | setPreference | This function sets a preference value in the local store. The value can beretrieved later using Get-GenXdevPreference. If the value is null, thepreference will be removed instead. |

<hr/>
&nbsp;

### GenXdev.Data.SqlLite</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [New-SqlLiteDatabase](#New-SqlLiteDatabase) |  | Creates a new SQLite database file if it does not already exist. |

<hr/>
&nbsp;

### GenXdev.Data.Preferences</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Remove-GenXdevPreference](#Remove-GenXdevPreference) | removePreference | This function removes a preference value from the local store and optionally fromthe default store. It supports removing both local and default preferencesthrough parameter sets. |
| [Get-GenXdevPreference](#Get-GenXdevPreference) | getPreference | This function gets a preference value from the local store first, then falls backto the default store if not found. If neither store contains the value, returnsthe provided default value. |

<hr/>
&nbsp;

### GenXdev.Data.SqlLite</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-SqlLiteSchema](#Get-SqlLiteSchema) |  | Get the schema of a SQLite database. |
| [Get-SqlLiteTableColumnData](#Get-SqlLiteTableColumnData) |  |  |
| [Get-SqlLiteTableData](#Get-SqlLiteTableData) |  |  |
| [Get-SqlLiteTables](#Get-SqlLiteTables) |  |  |
| [Get-SqlLiteTableSchema](#Get-SqlLiteTableSchema) |  |  |
| [Get-SqlLiteViewColumnData](#Get-SqlLiteViewColumnData) |  |  |
| [Get-SqlLiteViewData](#Get-SqlLiteViewData) |  |  |
| [Get-SqlLiteViews](#Get-SqlLiteViews) |  |  |
| [Get-SqlLiteViewSchema](#Get-SqlLiteViewSchema) |  |  |
| [Invoke-SqlLiteQuery](#Invoke-SqlLiteQuery) |  | Execute a query against a SQLite database with support for parameters and with aconfigurable transaction isolation level.All queries are executed within the same transaction.If an error occurs, the transaction is rollbacked and the error is thrown. |
| [Invoke-SqlLiteStudio](#Invoke-SqlLiteStudio) |  |  |
| [New-SqlLiteDatabase](#New-SqlLiteDatabase) |  | Creates a new SQLite database file if it does not already exist. |

<hr/>
&nbsp;

### GenXdev.Data.Preferences</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-GenXdevPreferenceNames](#Get-GenXdevPreferenceNames) | getPreferenceNames | Retrieves a unique list of preference names by combining keys from both the localand default preference stores. The function merges the keys from both stores andensures uniqueness in the returned collection. |

<hr/>
&nbsp;

### GenXdev.Data.KeyValueStore</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-KeyValueStoreNames](#Get-KeyValueStoreNames) | getstorenames | SELECT DISTINCT ensures only unique store names are returned. |
| [Get-ValueByKeyFromStore](#Get-ValueByKeyFromStore) | getvalue | Executes a SELECT statement to fetch the value for a given key in a given store. |
| [Initialize-KeyValueStores](#Initialize-KeyValueStores) |  | Creates SQLite databases with required schema both locally and in OneDrive forsynchronization purposes if they don't exist. |
| [Remove-KeyFromStore](#Remove-KeyFromStore) | removekey | Executes a DELETE statement targeting the given store and key. |
| [Remove-KeyValueStore](#Remove-KeyValueStore) |  | Executes a DELETE statement to remove all entries for the given store. |
| [Set-ValueByKeyInStore](#Set-ValueByKeyInStore) | setvalue | Uses an INSERT with ON CONFLICT to set or overwrite the value. |
| [Sync-KeyValueStore](#Sync-KeyValueStore) |  | Performs two-way sync between local and shadow databases, with last-modifiedwinning strategy. |

<hr/>
&nbsp;

### GenXdev.Data.SqlServer</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Invoke-SqlServerQuery](#Invoke-SqlServerQuery) |  | Execute a query against a SqlServer database with support for parameters and with aconfigurable transaction isolation level.All queries are executed within the same transaction.If an error occurs, the transaction is rollbacked and the error is thrown. |

<hr/>
&nbsp;

### GenXdev.Data.Preferences</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-GenXdevPreference](#Get-GenXdevPreference) | getPreference | This function gets a preference value from the local store first, then falls backto the default store if not found. If neither store contains the value, returnsthe provided default value. |
| [Get-GenXdevPreferenceNames](#Get-GenXdevPreferenceNames) | getPreferenceNames | Retrieves a unique list of preference names by combining keys from both the localand default preference stores. The function merges the keys from both stores andensures uniqueness in the returned collection. |
| [Remove-GenXdevPreference](#Remove-GenXdevPreference) | removePreference | This function removes a preference value from the local store and optionally fromthe default store. It supports removing both local and default preferencesthrough parameter sets. |
| [Set-GenXdevDefaultPreference](#Set-GenXdevDefaultPreference) | setPreferenceDefault | This function sets a preference value in the default store and synchronizes itto ensure the changes are propagated across the system. |
| [Set-GenXdevPreference](#Set-GenXdevPreference) | setPreference | This function sets a preference value in the local store. The value can beretrieved later using Get-GenXdevPreference. If the value is null, thepreference will be removed instead. |

<hr/>
&nbsp;

### GenXdev.Data.KeyValueStore</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-StoreKeys](#Get-StoreKeys) | getkeys | Runs a SELECT on the KeyValueStore table filtered by storeName. |

<hr/>
&nbsp;

### GenXdev.Data.SqlServer</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Invoke-SqlServerQuery](#Invoke-SqlServerQuery) |  | Execute a query against a SqlServer database with support for parameters and with aconfigurable transaction isolation level.All queries are executed within the same transaction.If an error occurs, the transaction is rollbacked and the error is thrown. |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Data.SqlLite<hr/>

##	AssureSQLiteStudioInstalled
````PowerShell
AssureSQLiteStudioInstalled
````

### SYNTAX
````PowerShell
AssureSQLiteStudioInstalled 
````

### PARAMETERS
    None

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/>

##	Set-GenXdevPreference
````PowerShell
Set-GenXdevPreference                --> setPreference
````

### SYNOPSIS
    Sets a preference value in the GenXdev preferences store.

### SYNTAX
````PowerShell
Set-GenXdevPreference [-Name] <String> [[-Value] <String>] [<CommonParameters>]
````

### DESCRIPTION
    This function sets a preference value in the local store. The value can be
    retrieved later using Get-GenXdevPreference. If the value is null, the
    preference will be removed instead.

### PARAMETERS
    -Name <String>
        The name of the preference to set.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Value <String>
        The value to store for the preference.
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/>

##	Get-KeyValueStoreNames
````PowerShell
Get-KeyValueStoreNames               --> getstorenames
````

### SYNOPSIS
    Gets a list of all store names.

### SYNTAX
````PowerShell
Get-KeyValueStoreNames [[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    SELECT DISTINCT ensures only unique store names are returned.

### PARAMETERS
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    1
        Default value                %
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-StoreKeys
````PowerShell
Get-StoreKeys                        --> getkeys
````

### SYNOPSIS
    Retrieves all key names for a given store.

### SYNTAX
````PowerShell
Get-StoreKeys [-StoreName] <String> [[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    Runs a SELECT on the KeyValueStore table filtered by storeName.

### PARAMETERS
    -StoreName <String>
        Name of the store whose keys should be retrieved.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    2
        Default value                %
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-ValueByKeyFromStore
````PowerShell
Get-ValueByKeyFromStore              --> getvalue
````

### SYNOPSIS
    Retrieves a value by the specified key and store from the database.

### SYNTAX
````PowerShell
Get-ValueByKeyFromStore [-StoreName] <String> [-KeyName] <String> [[-DefaultValue] <String>] 
[[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    Executes a SELECT statement to fetch the value for a given key in a given store.

### PARAMETERS
    -StoreName <String>
        Name of the store to retrieve the key from.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -KeyName <String>
        Key to retrieve from the specified store.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -DefaultValue <String>
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    4
        Default value                Local
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Initialize-KeyValueStores
````PowerShell
Initialize-KeyValueStores
````

### SYNOPSIS
    Initializes KeyValueStore databases locally and in OneDrive for synchronization.

### SYNTAX
````PowerShell
Initialize-KeyValueStores [[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    Creates SQLite databases with required schema both locally and in OneDrive for
    synchronization purposes if they do not exist.

### PARAMETERS
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    1
        Default value                Local
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Remove-KeyFromStore
````PowerShell
Remove-KeyFromStore                  --> removekey
````

### SYNOPSIS
    Deletes a key from the specified store.

### SYNTAX
````PowerShell
Remove-KeyFromStore [-StoreName] <String> [-KeyName] <String> [[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    Executes a DELETE statement targeting the given store and key.

### PARAMETERS
    -StoreName <String>
        Name of the store.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -KeyName <String>
        Key to be deleted.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    3
        Default value                Local
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Remove-KeyValueStore
````PowerShell
Remove-KeyValueStore
````

### SYNOPSIS
    Removes an entire store from the database.

### SYNTAX
````PowerShell
Remove-KeyValueStore [-StoreName] <String> [[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    Executes a DELETE statement to remove all entries for the given store.

### PARAMETERS
    -StoreName <String>
        Name of the store to delete.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    2
        Default value                Local
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Set-ValueByKeyInStore
````PowerShell
Set-ValueByKeyInStore                --> setvalue
````

### SYNOPSIS
    Inserts or updates a key-value pair in the database.

### SYNTAX
````PowerShell
Set-ValueByKeyInStore [-StoreName] <String> [-KeyName] <String> [[-Value] <String>] [[-SynchronizationKey] 
<String>] [<CommonParameters>]
````

### DESCRIPTION
    Uses an INSERT with ON CONFLICT to set or overwrite the value.

### PARAMETERS
    -StoreName <String>
        Store name for the key-value pair.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -KeyName <String>
        Name of the key to set or update.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Value <String>
        Value to be stored.
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    4
        Default value                Local
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Sync-KeyValueStore
````PowerShell
Sync-KeyValueStore
````

### SYNOPSIS
    Synchronizes local and OneDrive shadow databases.

### SYNTAX
````PowerShell
Sync-KeyValueStore [[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    Performs two-way sync between local and shadow databases, with last-modified
    winning strategy.

### PARAMETERS
    -SynchronizationKey <String>
        Optional key to identify sync scope, defaults to "Local".
        Required?                    false
        Position?                    1
        Default value                Local
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/>

##	Get-GenXdevPreference
````PowerShell
Get-GenXdevPreference                --> getPreference
````

### SYNOPSIS
    Retrieves a preference value from the GenXdev preferences store.

### SYNTAX
````PowerShell
Get-GenXdevPreference [-Name] <String> [[-DefaultValue] <String>] [<CommonParameters>]
````

### DESCRIPTION
    This function gets a preference value from the local store first, then falls back
    to the default store if not found. If neither store contains the value, returns
    the provided default value.

### PARAMETERS
    -Name <String>
        The name of the preference to retrieve.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -DefaultValue <String>
        The default value to return if the preference is not found in any store.
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-GenXdevPreferenceNames
````PowerShell
Get-GenXdevPreferenceNames           --> getPreferenceNames
````

### SYNOPSIS
    Gets all preference names from both local and default stores.

### SYNTAX
````PowerShell
Get-GenXdevPreferenceNames [<CommonParameters>]
````

### DESCRIPTION
    Retrieves a unique list of preference names by combining keys from both the local
    and default preference stores. The function merges the keys from both stores and
    ensures uniqueness in the returned collection.

### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Remove-GenXdevPreference
````PowerShell
Remove-GenXdevPreference             --> removePreference
````

### SYNOPSIS
    Removes a preference value from the GenXdev preferences store.

### SYNTAX
````PowerShell
Remove-GenXdevPreference [-Name] <String> [<CommonParameters>]
Remove-GenXdevPreference [-Name] <String> [[-RemoveDefault]] [<CommonParameters>]
````

### DESCRIPTION
    This function removes a preference value from the local store and optionally from
    the default store. It supports removing both local and default preferences
    through parameter sets.

### PARAMETERS
    -Name <String>
        The name of the preference to remove.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -RemoveDefault [<SwitchParameter>]
        Switch to also remove the preference from the default store.
        Required?                    false
        Position?                    2
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Set-GenXdevDefaultPreference
````PowerShell
Set-GenXdevDefaultPreference         --> setPreferenceDefault
````

### SYNOPSIS
    Sets a default preference value in the GenXdev preferences store.

### SYNTAX
````PowerShell
Set-GenXdevDefaultPreference [-Name] <String> [[-Value] <String>] [<CommonParameters>]
````

### DESCRIPTION
    This function sets a preference value in the default store and synchronizes it
    to ensure the changes are propagated across the system.

### PARAMETERS
    -Name <String>
        The name of the preference to set in the default store.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Value <String>
        The value to store for the preference.
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Set-GenXdevDefaultPreference
````PowerShell
Set-GenXdevDefaultPreference         --> setPreferenceDefault
````

### SYNOPSIS
    Sets a default preference value in the GenXdev preferences store.

### SYNTAX
````PowerShell
Set-GenXdevDefaultPreference [-Name] <String> [[-Value] <String>] [<CommonParameters>]
````

### DESCRIPTION
    This function sets a preference value in the default store and synchronizes it
    to ensure the changes are propagated across the system.

### PARAMETERS
    -Name <String>
        The name of the preference to set in the default store.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Value <String>
        The value to store for the preference.
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.SqlLite<hr/>

##	AssureSQLiteStudioInstalled
````PowerShell
AssureSQLiteStudioInstalled
````

### SYNTAX
````PowerShell
AssureSQLiteStudioInstalled 
````

### PARAMETERS
    None

<br/><hr/><hr/><br/>

##	Get-SqlLiteSchema
````PowerShell
Get-SqlLiteSchema
````

### SYNOPSIS
    Get the schema of a SQLite database.

### SYNTAX
````PowerShell
Get-SqlLiteSchema [<CommonParameters>]
Get-SqlLiteSchema [-ConnectionString] <String> [<CommonParameters>]
Get-SqlLiteSchema [-DatabaseFilePath] <String> [<CommonParameters>]
````

### DESCRIPTION
    Get the schema of a SQLite database.

### PARAMETERS
    -ConnectionString <String>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -DatabaseFilePath <String>
        The path to the SQLite database file.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteTableColumnData
````PowerShell
Get-SqlLiteTableColumnData
````

### SYNTAX
````PowerShell
Get-SqlLiteTableColumnData [-TableName] <string> [-ColumnName] <string> [[-Count] <int>] [<CommonParameters>]
Get-SqlLiteTableColumnData [-ConnectionString] <string> [-TableName] <string> [-ColumnName] <string> [[-Count] 
<int>] [<CommonParameters>]
Get-SqlLiteTableColumnData [-DatabaseFilePath] <string> [-TableName] <string> [-ColumnName] <string> [[-Count] 
<int>] [<CommonParameters>]
````

### PARAMETERS
    -ColumnName <string>
        The name of the column.
        Required?                    true
        Position?                    2
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Count <int>
        The number of records to return. default is 100. -1 to return all records.
        Required?                    false
        Position?                    3
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -TableName <string>
        The name of the table.
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteTableData
````PowerShell
Get-SqlLiteTableData
````

### SYNTAX
````PowerShell
Get-SqlLiteTableData [-TableName] <string> [[-Count] <int>] [<CommonParameters>]
Get-SqlLiteTableData [-ConnectionString] <string> [-TableName] <string> [[-Count] <int>] [<CommonParameters>]
Get-SqlLiteTableData [-DatabaseFilePath] <string> [-TableName] <string> [[-Count] <int>] [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Count <int>
        The number of records to return. default is 100. -1 to return all records.
        Required?                    false
        Position?                    2
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -TableName <string>
        The name of the table.
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteTables
````PowerShell
Get-SqlLiteTables
````

### SYNTAX
````PowerShell
Get-SqlLiteTables [<CommonParameters>]
Get-SqlLiteTables [-ConnectionString] <string> [<CommonParameters>]
Get-SqlLiteTables [-DatabaseFilePath] <string> [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteTableSchema
````PowerShell
Get-SqlLiteTableSchema
````

### SYNTAX
````PowerShell
Get-SqlLiteTableSchema [-TableName] <string> [<CommonParameters>]
Get-SqlLiteTableSchema [-ConnectionString] <string> [-TableName] <string> [<CommonParameters>]
Get-SqlLiteTableSchema [-DatabaseFilePath] <string> [-TableName] <string> [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -TableName <string>
        The name of the table.
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteViewColumnData
````PowerShell
Get-SqlLiteViewColumnData
````

### SYNTAX
````PowerShell
Get-SqlLiteViewColumnData [-ViewName] <string> [-ColumnName] <string> [[-Count] <int>] [<CommonParameters>]
Get-SqlLiteViewColumnData [-ConnectionString] <string> [-ViewName] <string> [-ColumnName] <string> [[-Count] 
<int>] [<CommonParameters>]
Get-SqlLiteViewColumnData [-DatabaseFilePath] <string> [-ViewName] <string> [-ColumnName] <string> [[-Count] 
<int>] [<CommonParameters>]
````

### PARAMETERS
    -ColumnName <string>
        The name of the column.
        Required?                    true
        Position?                    2
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Count <int>
        The number of records to return. default is 100. -1 to return all records.
        Required?                    false
        Position?                    3
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -ViewName <string>
        The name of the view.
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteViewData
````PowerShell
Get-SqlLiteViewData
````

### SYNTAX
````PowerShell
Get-SqlLiteViewData [-ViewName] <string> [[-Count] <int>] [<CommonParameters>]
Get-SqlLiteViewData [-ConnectionString] <string> [-ViewName] <string> [[-Count] <int>] [<CommonParameters>]
Get-SqlLiteViewData [-DatabaseFilePath] <string> [-ViewName] <string> [[-Count] <int>] [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Count <int>
        The number of records to return. default is 100. -1 to return all records.
        Required?                    false
        Position?                    2
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -ViewName <string>
        The name of the view.
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteViews
````PowerShell
Get-SqlLiteViews
````

### SYNTAX
````PowerShell
Get-SqlLiteViews [<CommonParameters>]
Get-SqlLiteViews [-ConnectionString] <string> [<CommonParameters>]
Get-SqlLiteViews [-DatabaseFilePath] <string> [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteViewSchema
````PowerShell
Get-SqlLiteViewSchema
````

### SYNTAX
````PowerShell
Get-SqlLiteViewSchema [-ViewName] <string> [<CommonParameters>]
Get-SqlLiteViewSchema [-ConnectionString] <string> [-ViewName] <string> [<CommonParameters>]
Get-SqlLiteViewSchema [-DatabaseFilePath] <string> [-ViewName] <string> [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -ViewName <string>
        The name of the view.
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Invoke-SqlLiteQuery
````PowerShell
Invoke-SqlLiteQuery
````

### SYNOPSIS
    Execute a query against a SQLite database.

### SYNTAX
````PowerShell
Invoke-SqlLiteQuery [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] [-IsolationLevel {Chaos | 
ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlLiteQuery [-ConnectionString] <String> [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] 
[-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | 
Unspecified}] [<CommonParameters>]
Invoke-SqlLiteQuery [-DatabaseFilePath] <String> [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] 
[-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | 
Unspecified}] [<CommonParameters>]
````

### DESCRIPTION
    Execute a query against a SQLite database with support for parameters and with a
    configurable transaction isolation level.
    All queries are executed within the same transaction.
    If an error occurs, the transaction is rollbacked and the error is thrown.

### PARAMETERS
    -ConnectionString <String>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -DatabaseFilePath <String>
        The path to the SQLite database file.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Queries <String[]>
        The query or queries to execute.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -SqlParameters <Hashtable[]>
        Required?                    false
        Position?                    2
        Default value                @()
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -IsolationLevel
        Required?                    false
        Position?                    named
        Default value                ReadCommitted
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Invoke-SqlLiteStudio
````PowerShell
Invoke-SqlLiteStudio
````

### SYNTAX
````PowerShell
Invoke-SqlLiteStudio [-SqlParameters] <hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | 
RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlLiteStudio [-ConnectionString] <string> [-SqlParameters] <hashtable[]> [-IsolationLevel {Chaos | 
ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlLiteStudio [-DatabaseFilePath] <string> [-SqlParameters] <hashtable[]> [-IsolationLevel {Chaos | 
ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -IsolationLevel <IsolationLevel>
        The isolation level to use. default is ReadCommitted.
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to execute.
        Required?                    true
        Position?                    1
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -SqlParameters <hashtable[]>
        Optional parameters for the query. like @{"Id" = 1; "Name" = "John"}
        Required?                    true
        Position?                    1
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      parameters
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/>

##	Set-GenXdevPreference
````PowerShell
Set-GenXdevPreference                --> setPreference
````

### SYNOPSIS
    Sets a preference value in the GenXdev preferences store.

### SYNTAX
````PowerShell
Set-GenXdevPreference [-Name] <String> [[-Value] <String>] [<CommonParameters>]
````

### DESCRIPTION
    This function sets a preference value in the local store. The value can be
    retrieved later using Get-GenXdevPreference. If the value is null, the
    preference will be removed instead.

### PARAMETERS
    -Name <String>
        The name of the preference to set.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Value <String>
        The value to store for the preference.
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.SqlLite<hr/>

##	New-SqlLiteDatabase
````PowerShell
New-SqlLiteDatabase
````

### SYNOPSIS
    Creates a new SQLite database.

### SYNTAX
````PowerShell
New-SqlLiteDatabase [-DatabaseFilePath] <String> [<CommonParameters>]
````

### DESCRIPTION
    Creates a new SQLite database file if it does not already exist.

### PARAMETERS
    -DatabaseFilePath <String>
        Path to the SQLite database file to be created.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/>

##	Remove-GenXdevPreference
````PowerShell
Remove-GenXdevPreference             --> removePreference
````

### SYNOPSIS
    Removes a preference value from the GenXdev preferences store.

### SYNTAX
````PowerShell
Remove-GenXdevPreference [-Name] <String> [<CommonParameters>]
Remove-GenXdevPreference [-Name] <String> [[-RemoveDefault]] [<CommonParameters>]
````

### DESCRIPTION
    This function removes a preference value from the local store and optionally from
    the default store. It supports removing both local and default preferences
    through parameter sets.

### PARAMETERS
    -Name <String>
        The name of the preference to remove.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -RemoveDefault [<SwitchParameter>]
        Switch to also remove the preference from the default store.
        Required?                    false
        Position?                    2
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-GenXdevPreference
````PowerShell
Get-GenXdevPreference                --> getPreference
````

### SYNOPSIS
    Retrieves a preference value from the GenXdev preferences store.

### SYNTAX
````PowerShell
Get-GenXdevPreference [-Name] <String> [[-DefaultValue] <String>] [<CommonParameters>]
````

### DESCRIPTION
    This function gets a preference value from the local store first, then falls back
    to the default store if not found. If neither store contains the value, returns
    the provided default value.

### PARAMETERS
    -Name <String>
        The name of the preference to retrieve.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -DefaultValue <String>
        The default value to return if the preference is not found in any store.
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.SqlLite<hr/>

##	Get-SqlLiteSchema
````PowerShell
Get-SqlLiteSchema
````

### SYNOPSIS
    Get the schema of a SQLite database.

### SYNTAX
````PowerShell
Get-SqlLiteSchema [<CommonParameters>]
Get-SqlLiteSchema [-ConnectionString] <String> [<CommonParameters>]
Get-SqlLiteSchema [-DatabaseFilePath] <String> [<CommonParameters>]
````

### DESCRIPTION
    Get the schema of a SQLite database.

### PARAMETERS
    -ConnectionString <String>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -DatabaseFilePath <String>
        The path to the SQLite database file.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteTableColumnData
````PowerShell
Get-SqlLiteTableColumnData
````

### SYNTAX
````PowerShell
Get-SqlLiteTableColumnData [-TableName] <string> [-ColumnName] <string> [[-Count] <int>] [<CommonParameters>]
Get-SqlLiteTableColumnData [-ConnectionString] <string> [-TableName] <string> [-ColumnName] <string> [[-Count] 
<int>] [<CommonParameters>]
Get-SqlLiteTableColumnData [-DatabaseFilePath] <string> [-TableName] <string> [-ColumnName] <string> [[-Count] 
<int>] [<CommonParameters>]
````

### PARAMETERS
    -ColumnName <string>
        The name of the column.
        Required?                    true
        Position?                    2
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Count <int>
        The number of records to return. default is 100. -1 to return all records.
        Required?                    false
        Position?                    3
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -TableName <string>
        The name of the table.
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteTableData
````PowerShell
Get-SqlLiteTableData
````

### SYNTAX
````PowerShell
Get-SqlLiteTableData [-TableName] <string> [[-Count] <int>] [<CommonParameters>]
Get-SqlLiteTableData [-ConnectionString] <string> [-TableName] <string> [[-Count] <int>] [<CommonParameters>]
Get-SqlLiteTableData [-DatabaseFilePath] <string> [-TableName] <string> [[-Count] <int>] [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Count <int>
        The number of records to return. default is 100. -1 to return all records.
        Required?                    false
        Position?                    2
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -TableName <string>
        The name of the table.
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteTables
````PowerShell
Get-SqlLiteTables
````

### SYNTAX
````PowerShell
Get-SqlLiteTables [<CommonParameters>]
Get-SqlLiteTables [-ConnectionString] <string> [<CommonParameters>]
Get-SqlLiteTables [-DatabaseFilePath] <string> [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteTableSchema
````PowerShell
Get-SqlLiteTableSchema
````

### SYNTAX
````PowerShell
Get-SqlLiteTableSchema [-TableName] <string> [<CommonParameters>]
Get-SqlLiteTableSchema [-ConnectionString] <string> [-TableName] <string> [<CommonParameters>]
Get-SqlLiteTableSchema [-DatabaseFilePath] <string> [-TableName] <string> [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -TableName <string>
        The name of the table.
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteViewColumnData
````PowerShell
Get-SqlLiteViewColumnData
````

### SYNTAX
````PowerShell
Get-SqlLiteViewColumnData [-ViewName] <string> [-ColumnName] <string> [[-Count] <int>] [<CommonParameters>]
Get-SqlLiteViewColumnData [-ConnectionString] <string> [-ViewName] <string> [-ColumnName] <string> [[-Count] 
<int>] [<CommonParameters>]
Get-SqlLiteViewColumnData [-DatabaseFilePath] <string> [-ViewName] <string> [-ColumnName] <string> [[-Count] 
<int>] [<CommonParameters>]
````

### PARAMETERS
    -ColumnName <string>
        The name of the column.
        Required?                    true
        Position?                    2
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Count <int>
        The number of records to return. default is 100. -1 to return all records.
        Required?                    false
        Position?                    3
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -ViewName <string>
        The name of the view.
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteViewData
````PowerShell
Get-SqlLiteViewData
````

### SYNTAX
````PowerShell
Get-SqlLiteViewData [-ViewName] <string> [[-Count] <int>] [<CommonParameters>]
Get-SqlLiteViewData [-ConnectionString] <string> [-ViewName] <string> [[-Count] <int>] [<CommonParameters>]
Get-SqlLiteViewData [-DatabaseFilePath] <string> [-ViewName] <string> [[-Count] <int>] [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Count <int>
        The number of records to return. default is 100. -1 to return all records.
        Required?                    false
        Position?                    2
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -ViewName <string>
        The name of the view.
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteViews
````PowerShell
Get-SqlLiteViews
````

### SYNTAX
````PowerShell
Get-SqlLiteViews [<CommonParameters>]
Get-SqlLiteViews [-ConnectionString] <string> [<CommonParameters>]
Get-SqlLiteViews [-DatabaseFilePath] <string> [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SqlLiteViewSchema
````PowerShell
Get-SqlLiteViewSchema
````

### SYNTAX
````PowerShell
Get-SqlLiteViewSchema [-ViewName] <string> [<CommonParameters>]
Get-SqlLiteViewSchema [-ConnectionString] <string> [-ViewName] <string> [<CommonParameters>]
Get-SqlLiteViewSchema [-DatabaseFilePath] <string> [-ViewName] <string> [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -ViewName <string>
        The name of the view.
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Invoke-SqlLiteQuery
````PowerShell
Invoke-SqlLiteQuery
````

### SYNOPSIS
    Execute a query against a SQLite database.

### SYNTAX
````PowerShell
Invoke-SqlLiteQuery [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] [-IsolationLevel {Chaos | 
ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlLiteQuery [-ConnectionString] <String> [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] 
[-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | 
Unspecified}] [<CommonParameters>]
Invoke-SqlLiteQuery [-DatabaseFilePath] <String> [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] 
[-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | 
Unspecified}] [<CommonParameters>]
````

### DESCRIPTION
    Execute a query against a SQLite database with support for parameters and with a
    configurable transaction isolation level.
    All queries are executed within the same transaction.
    If an error occurs, the transaction is rollbacked and the error is thrown.

### PARAMETERS
    -ConnectionString <String>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -DatabaseFilePath <String>
        The path to the SQLite database file.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Queries <String[]>
        The query or queries to execute.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -SqlParameters <Hashtable[]>
        Required?                    false
        Position?                    2
        Default value                @()
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -IsolationLevel
        Required?                    false
        Position?                    named
        Default value                ReadCommitted
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Invoke-SqlLiteStudio
````PowerShell
Invoke-SqlLiteStudio
````

### SYNTAX
````PowerShell
Invoke-SqlLiteStudio [-SqlParameters] <hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | 
RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlLiteStudio [-ConnectionString] <string> [-SqlParameters] <hashtable[]> [-IsolationLevel {Chaos | 
ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlLiteStudio [-DatabaseFilePath] <string> [-SqlParameters] <hashtable[]> [-IsolationLevel {Chaos | 
ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]
````

### PARAMETERS
    -ConnectionString <string>
        The connection string to the SQLite database.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           ConnectionString
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -DatabaseFilePath <string>
        The path to the SQLite database file.
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           DatabaseFilePath
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -IsolationLevel <IsolationLevel>
        The isolation level to use. default is ReadCommitted.
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to execute.
        Required?                    true
        Position?                    1
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -SqlParameters <hashtable[]>
        Optional parameters for the query. like @{"Id" = 1; "Name" = "John"}
        Required?                    true
        Position?                    1
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      parameters
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	New-SqlLiteDatabase
````PowerShell
New-SqlLiteDatabase
````

### SYNOPSIS
    Creates a new SQLite database.

### SYNTAX
````PowerShell
New-SqlLiteDatabase [-DatabaseFilePath] <String> [<CommonParameters>]
````

### DESCRIPTION
    Creates a new SQLite database file if it does not already exist.

### PARAMETERS
    -DatabaseFilePath <String>
        Path to the SQLite database file to be created.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/>

##	Get-GenXdevPreferenceNames
````PowerShell
Get-GenXdevPreferenceNames           --> getPreferenceNames
````

### SYNOPSIS
    Gets all preference names from both local and default stores.

### SYNTAX
````PowerShell
Get-GenXdevPreferenceNames [<CommonParameters>]
````

### DESCRIPTION
    Retrieves a unique list of preference names by combining keys from both the local
    and default preference stores. The function merges the keys from both stores and
    ensures uniqueness in the returned collection.

### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/>

##	Get-KeyValueStoreNames
````PowerShell
Get-KeyValueStoreNames               --> getstorenames
````

### SYNOPSIS
    Gets a list of all store names.

### SYNTAX
````PowerShell
Get-KeyValueStoreNames [[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    SELECT DISTINCT ensures only unique store names are returned.

### PARAMETERS
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    1
        Default value                %
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-ValueByKeyFromStore
````PowerShell
Get-ValueByKeyFromStore              --> getvalue
````

### SYNOPSIS
    Retrieves a value by the specified key and store from the database.

### SYNTAX
````PowerShell
Get-ValueByKeyFromStore [-StoreName] <String> [-KeyName] <String> [[-DefaultValue] <String>] 
[[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    Executes a SELECT statement to fetch the value for a given key in a given store.

### PARAMETERS
    -StoreName <String>
        Name of the store to retrieve the key from.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -KeyName <String>
        Key to retrieve from the specified store.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -DefaultValue <String>
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    4
        Default value                Local
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Initialize-KeyValueStores
````PowerShell
Initialize-KeyValueStores
````

### SYNOPSIS
    Initializes KeyValueStore databases locally and in OneDrive for synchronization.

### SYNTAX
````PowerShell
Initialize-KeyValueStores [[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    Creates SQLite databases with required schema both locally and in OneDrive for
    synchronization purposes if they do not exist.

### PARAMETERS
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    1
        Default value                Local
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Remove-KeyFromStore
````PowerShell
Remove-KeyFromStore                  --> removekey
````

### SYNOPSIS
    Deletes a key from the specified store.

### SYNTAX
````PowerShell
Remove-KeyFromStore [-StoreName] <String> [-KeyName] <String> [[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    Executes a DELETE statement targeting the given store and key.

### PARAMETERS
    -StoreName <String>
        Name of the store.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -KeyName <String>
        Key to be deleted.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    3
        Default value                Local
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Remove-KeyValueStore
````PowerShell
Remove-KeyValueStore
````

### SYNOPSIS
    Removes an entire store from the database.

### SYNTAX
````PowerShell
Remove-KeyValueStore [-StoreName] <String> [[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    Executes a DELETE statement to remove all entries for the given store.

### PARAMETERS
    -StoreName <String>
        Name of the store to delete.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    2
        Default value                Local
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Set-ValueByKeyInStore
````PowerShell
Set-ValueByKeyInStore                --> setvalue
````

### SYNOPSIS
    Inserts or updates a key-value pair in the database.

### SYNTAX
````PowerShell
Set-ValueByKeyInStore [-StoreName] <String> [-KeyName] <String> [[-Value] <String>] [[-SynchronizationKey] 
<String>] [<CommonParameters>]
````

### DESCRIPTION
    Uses an INSERT with ON CONFLICT to set or overwrite the value.

### PARAMETERS
    -StoreName <String>
        Store name for the key-value pair.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -KeyName <String>
        Name of the key to set or update.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Value <String>
        Value to be stored.
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    4
        Default value                Local
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Sync-KeyValueStore
````PowerShell
Sync-KeyValueStore
````

### SYNOPSIS
    Synchronizes local and OneDrive shadow databases.

### SYNTAX
````PowerShell
Sync-KeyValueStore [[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    Performs two-way sync between local and shadow databases, with last-modified
    winning strategy.

### PARAMETERS
    -SynchronizationKey <String>
        Optional key to identify sync scope, defaults to "Local".
        Required?                    false
        Position?                    1
        Default value                Local
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/>

##	Invoke-SqlServerQuery
````PowerShell
Invoke-SqlServerQuery
````

### SYNOPSIS
    Execute a query against a SqlServer database.

### SYNTAX
````PowerShell
Invoke-SqlServerQuery [-Queries] <String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel {Chaos | 
ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlServerQuery [-ConnectionString] <String> [-Queries] <String[]> [-SqlParameters] <Hashtable[]> 
[-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | 
Unspecified}] [<CommonParameters>]
Invoke-SqlServerQuery [-HostName] <String> [-Queries] <String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel 
{Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] 
[<CommonParameters>]
Invoke-SqlServerQuery [-HostName] <String> [-User] <String> [-Password] <String> [-Queries] <String[]> 
[-SqlParameters] <Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlServerQuery [-HostName] <String> [-Queries] <String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel 
{Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] 
[<CommonParameters>]
````

### DESCRIPTION
    Execute a query against a SqlServer database with support for parameters and with a
    configurable transaction isolation level.
    All queries are executed within the same transaction.
    If an error occurs, the transaction is rollbacked and the error is thrown.

### PARAMETERS
    -ConnectionString <String>
        The connection string to the SqlServer database.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -HostName <String>
        Required?                    true
        Position?                    1
        Default value                .
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -User <String>
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Password <String>
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Queries <String[]>
        The query or queries to execute.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -SqlParameters <Hashtable[]>
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -IsolationLevel
        Required?                    false
        Position?                    named
        Default value                ReadCommitted
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/>

##	Get-GenXdevPreference
````PowerShell
Get-GenXdevPreference                --> getPreference
````

### SYNOPSIS
    Retrieves a preference value from the GenXdev preferences store.

### SYNTAX
````PowerShell
Get-GenXdevPreference [-Name] <String> [[-DefaultValue] <String>] [<CommonParameters>]
````

### DESCRIPTION
    This function gets a preference value from the local store first, then falls back
    to the default store if not found. If neither store contains the value, returns
    the provided default value.

### PARAMETERS
    -Name <String>
        The name of the preference to retrieve.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -DefaultValue <String>
        The default value to return if the preference is not found in any store.
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-GenXdevPreferenceNames
````PowerShell
Get-GenXdevPreferenceNames           --> getPreferenceNames
````

### SYNOPSIS
    Gets all preference names from both local and default stores.

### SYNTAX
````PowerShell
Get-GenXdevPreferenceNames [<CommonParameters>]
````

### DESCRIPTION
    Retrieves a unique list of preference names by combining keys from both the local
    and default preference stores. The function merges the keys from both stores and
    ensures uniqueness in the returned collection.

### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Remove-GenXdevPreference
````PowerShell
Remove-GenXdevPreference             --> removePreference
````

### SYNOPSIS
    Removes a preference value from the GenXdev preferences store.

### SYNTAX
````PowerShell
Remove-GenXdevPreference [-Name] <String> [<CommonParameters>]
Remove-GenXdevPreference [-Name] <String> [[-RemoveDefault]] [<CommonParameters>]
````

### DESCRIPTION
    This function removes a preference value from the local store and optionally from
    the default store. It supports removing both local and default preferences
    through parameter sets.

### PARAMETERS
    -Name <String>
        The name of the preference to remove.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -RemoveDefault [<SwitchParameter>]
        Switch to also remove the preference from the default store.
        Required?                    false
        Position?                    2
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Set-GenXdevDefaultPreference
````PowerShell
Set-GenXdevDefaultPreference         --> setPreferenceDefault
````

### SYNOPSIS
    Sets a default preference value in the GenXdev preferences store.

### SYNTAX
````PowerShell
Set-GenXdevDefaultPreference [-Name] <String> [[-Value] <String>] [<CommonParameters>]
````

### DESCRIPTION
    This function sets a preference value in the default store and synchronizes it
    to ensure the changes are propagated across the system.

### PARAMETERS
    -Name <String>
        The name of the preference to set in the default store.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Value <String>
        The value to store for the preference.
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Set-GenXdevPreference
````PowerShell
Set-GenXdevPreference                --> setPreference
````

### SYNOPSIS
    Sets a preference value in the GenXdev preferences store.

### SYNTAX
````PowerShell
Set-GenXdevPreference [-Name] <String> [[-Value] <String>] [<CommonParameters>]
````

### DESCRIPTION
    This function sets a preference value in the local store. The value can be
    retrieved later using Get-GenXdevPreference. If the value is null, the
    preference will be removed instead.

### PARAMETERS
    -Name <String>
        The name of the preference to set.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Value <String>
        The value to store for the preference.
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/>

##	Get-StoreKeys
````PowerShell
Get-StoreKeys                        --> getkeys
````

### SYNOPSIS
    Retrieves all key names for a given store.

### SYNTAX
````PowerShell
Get-StoreKeys [-StoreName] <String> [[-SynchronizationKey] <String>] [<CommonParameters>]
````

### DESCRIPTION
    Runs a SELECT on the KeyValueStore table filtered by storeName.

### PARAMETERS
    -StoreName <String>
        Name of the store whose keys should be retrieved.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -SynchronizationKey <String>
        Optional key to identify synchronization scope, defaults to "Local".
        Required?                    false
        Position?                    2
        Default value                %
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/>

##	Invoke-SqlServerQuery
````PowerShell
Invoke-SqlServerQuery
````

### SYNOPSIS
    Execute a query against a SqlServer database.

### SYNTAX
````PowerShell
Invoke-SqlServerQuery [-Queries] <String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel {Chaos | 
ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlServerQuery [-ConnectionString] <String> [-Queries] <String[]> [-SqlParameters] <Hashtable[]> 
[-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | 
Unspecified}] [<CommonParameters>]
Invoke-SqlServerQuery [-HostName] <String> [-Queries] <String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel 
{Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] 
[<CommonParameters>]
Invoke-SqlServerQuery [-HostName] <String> [-User] <String> [-Password] <String> [-Queries] <String[]> 
[-SqlParameters] <Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlServerQuery [-HostName] <String> [-Queries] <String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel 
{Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] 
[<CommonParameters>]
````

### DESCRIPTION
    Execute a query against a SqlServer database with support for parameters and with a
    configurable transaction isolation level.
    All queries are executed within the same transaction.
    If an error occurs, the transaction is rollbacked and the error is thrown.

### PARAMETERS
    -ConnectionString <String>
        The connection string to the SqlServer database.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -HostName <String>
        Required?                    true
        Position?                    1
        Default value                .
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -User <String>
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Password <String>
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Queries <String[]>
        The query or queries to execute.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -SqlParameters <Hashtable[]>
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -IsolationLevel
        Required?                    false
        Position?                    named
        Default value                ReadCommitted
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>
