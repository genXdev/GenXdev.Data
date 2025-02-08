<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Data
### SYNOPSIS
    A Windows PowerShell module for enhancing the commandline experience
[![GenXdev.Data](https://img.shields.io/powershellgallery/v/GenXdev.Data.svg?style=flat-square&label=GenXdev.Data)](https://www.powershellgallery.com/packages/GenXdev.Data/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Data?style=flat-square)](./LICENSE)

### FEATURES

    * ✅ Key-Value Store based upon SQLite with OneDrive synchronization
    * ✅ Preferences Store with local and default values
    * ✅ SQLite database schema and data retrieval
    * ✅ SQL Server query execution
    * ✅ SQLite Studio installation assurance
    * ✅ SQLite Studio execution
    * ✅ SQLite database creation

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
| [AssureSQLiteStudioInstalled](#AssureSQLiteStudioInstalled) |  | This function checks if SQLiteStudio is installed and available in the system PATH.If not found, it attempts to install it using WinGet and configures the PATHenvironment variable accordingly. |

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

### GenXdev.Data.SQLite</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [AssureSQLiteStudioInstalled](#AssureSQLiteStudioInstalled) |  | This function checks if SQLiteStudio is installed and available in the system PATH.If not found, it attempts to install it using WinGet and configures the PATHenvironment variable accordingly. |
| [Get-SQLiteSchema](#Get-SQLiteSchema) |  | Get the schema of a SQLite database. |
| [Get-SQLiteTableColumnData](#Get-SQLiteTableColumnData) |  | This function queries a SQLite database and returns the values from a specifiedcolumn in a table. It supports connecting via connection string or database filepath and allows limiting the number of returned records. |
| [Get-SQLiteTableData](#Get-SQLiteTableData) |  | This function allows you to query data from a specified SQLite database tableusing either a connection string or database file path. It supports limiting thenumber of records returned. |
| [Get-SQLiteTables](#Get-SQLiteTables) |  | This function queries a SQLite database to return all table names defined in thesqlite_master table. It supports connecting via either a connection string or adatabase file path. |
| [Get-SQLiteTableSchema](#Get-SQLiteTableSchema) |  | This function queries the SQLite database to get detailed schema information fora specified table using the PRAGMA table_info command. |
| [Get-SQLiteViewColumnData](#Get-SQLiteViewColumnData) |  | This function retrieves data from a specified column in a SQLite view. It supportsconnecting via connection string or database file path and allows limiting thenumber of records returned. |
| [Get-SQLiteViewData](#Get-SQLiteViewData) |  | Gets records from a specified view in a SQLite database, either using a connectionstring or database file path. Allows limiting the number of records returned. |
| [Get-SQLiteViews](#Get-SQLiteViews) |  | Gets all view names from the specified SQLite database using either a connectionstring or database file path. |
| [Get-SQLiteViewSchema](#Get-SQLiteViewSchema) |  | This function queries the SQLite system tables to retrieve the SQL definition ofa specified view. It accepts either a connection string or database file path. |
| [Invoke-SQLiteQuery](#Invoke-SQLiteQuery) |  | Execute a query against a SQLite database with support for parameters and with aconfigurable transaction isolation level.All queries are executed within the same transaction.If an error occurs, the transaction is rollbacked and the error is thrown. |
| [Invoke-SQLiteStudio](#Invoke-SQLiteStudio) |  | This function allows execution of SQLite queries either through a connection stringor direct database file path. It supports parameterized queries and transactionisolation levels. |

<hr/>
&nbsp;

### GenXdev.Data.Preferences</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Set-GenXdevPreference](#Set-GenXdevPreference) | setPreference | This function sets a preference value in the local store. The value can beretrieved later using Get-GenXdevPreference. If the value is null, thepreference will be removed instead. |

<hr/>
&nbsp;

### GenXdev.Data.SQLite</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [New-SQLiteDatabase](#New-SQLiteDatabase) |  | Creates a new SQLite database file if it does not already exist. |

<hr/>
&nbsp;

### GenXdev.Data.Preferences</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Remove-GenXdevPreference](#Remove-GenXdevPreference) | removePreference | This function removes a preference value from the local store and optionally fromthe default store. It supports removing both local and default preferencesthrough parameter sets. |
| [Get-GenXdevPreference](#Get-GenXdevPreference) | getPreference | This function gets a preference value from the local store first, then falls backto the default store if not found. If neither store contains the value, returnsthe provided default value. |

<hr/>
&nbsp;

### GenXdev.Data.SQLite</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-SQLiteSchema](#Get-SQLiteSchema) |  | Get the schema of a SQLite database. |
| [Get-SQLiteTableColumnData](#Get-SQLiteTableColumnData) |  | This function queries a SQLite database and returns the values from a specifiedcolumn in a table. It supports connecting via connection string or database filepath and allows limiting the number of returned records. |
| [Get-SQLiteTableData](#Get-SQLiteTableData) |  | This function allows you to query data from a specified SQLite database tableusing either a connection string or database file path. It supports limiting thenumber of records returned. |
| [Get-SQLiteTables](#Get-SQLiteTables) |  | This function queries a SQLite database to return all table names defined in thesqlite_master table. It supports connecting via either a connection string or adatabase file path. |
| [Get-SQLiteTableSchema](#Get-SQLiteTableSchema) |  | This function queries the SQLite database to get detailed schema information fora specified table using the PRAGMA table_info command. |
| [Get-SQLiteViewColumnData](#Get-SQLiteViewColumnData) |  | This function retrieves data from a specified column in a SQLite view. It supportsconnecting via connection string or database file path and allows limiting thenumber of records returned. |
| [Get-SQLiteViewData](#Get-SQLiteViewData) |  | Gets records from a specified view in a SQLite database, either using a connectionstring or database file path. Allows limiting the number of records returned. |
| [Get-SQLiteViews](#Get-SQLiteViews) |  | Gets all view names from the specified SQLite database using either a connectionstring or database file path. |
| [Get-SQLiteViewSchema](#Get-SQLiteViewSchema) |  | This function queries the SQLite system tables to retrieve the SQL definition ofa specified view. It accepts either a connection string or database file path. |
| [Invoke-SQLiteQuery](#Invoke-SQLiteQuery) |  | Execute a query against a SQLite database with support for parameters and with aconfigurable transaction isolation level.All queries are executed within the same transaction.If an error occurs, the transaction is rollbacked and the error is thrown. |
| [Invoke-SQLiteStudio](#Invoke-SQLiteStudio) |  | This function allows execution of SQLite queries either through a connection stringor direct database file path. It supports parameterized queries and transactionisolation levels. |
| [New-SQLiteDatabase](#New-SQLiteDatabase) |  | Creates a new SQLite database file if it does not already exist. |

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
###	GenXdev.Data.SQLite<hr/>

##	AssureSQLiteStudioInstalled
````PowerShell
AssureSQLiteStudioInstalled
````

### SYNOPSIS
    Ensures SQLiteStudio is installed and accessible from the command line.

### SYNTAX
````PowerShell
AssureSQLiteStudioInstalled [<CommonParameters>]
````

### DESCRIPTION
    This function checks if SQLiteStudio is installed and available in the system PATH.
    If not found, it attempts to install it using WinGet and configures the PATH
    environment variable accordingly.

### PARAMETERS
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
Get-ValueByKeyFromStore [-StoreName] <String> [-KeyName] <String> [[-DefaultValue] 
<String>] [[-SynchronizationKey] <String>] [<CommonParameters>]
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
Remove-KeyFromStore [-StoreName] <String> [-KeyName] <String> [[-SynchronizationKey] 
<String>] [<CommonParameters>]
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
Remove-KeyValueStore [-StoreName] <String> [[-SynchronizationKey] <String>] 
[<CommonParameters>]
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
Set-ValueByKeyInStore [-StoreName] <String> [-KeyName] <String> [[-Value] <String>] 
[[-SynchronizationKey] <String>] [<CommonParameters>]
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
###	GenXdev.Data.SQLite<hr/>

##	AssureSQLiteStudioInstalled
````PowerShell
AssureSQLiteStudioInstalled
````

### SYNOPSIS
    Ensures SQLiteStudio is installed and accessible from the command line.

### SYNTAX
````PowerShell
AssureSQLiteStudioInstalled [<CommonParameters>]
````

### DESCRIPTION
    This function checks if SQLiteStudio is installed and available in the system PATH.
    If not found, it attempts to install it using WinGet and configures the PATH
    environment variable accordingly.

### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SQLiteSchema
````PowerShell
Get-SQLiteSchema
````

### SYNOPSIS
    Get the schema of a SQLite database.

### SYNTAX
````PowerShell
Get-SQLiteSchema [<CommonParameters>]
Get-SQLiteSchema [-ConnectionString] <String> [<CommonParameters>]
Get-SQLiteSchema [-DatabaseFilePath] <String> [<CommonParameters>]
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

##	Get-SQLiteTableColumnData
````PowerShell
Get-SQLiteTableColumnData
````

### SYNOPSIS
    Retrieves data from a specific column in a SQLite database table.

### SYNTAX
````PowerShell
Get-SQLiteTableColumnData [-TableName] <String> [-ColumnName] <String> [[-Count] <Int32>] 
[<CommonParameters>]
Get-SQLiteTableColumnData [-ConnectionString] <String> [-TableName] <String> [-ColumnName] 
<String> [[-Count] <Int32>] [<CommonParameters>]
Get-SQLiteTableColumnData [-DatabaseFilePath] <String> [-TableName] <String> [-ColumnName] 
<String> [[-Count] <Int32>] [<CommonParameters>]
````

### DESCRIPTION
    This function queries a SQLite database and returns the values from a specified
    column in a table. It supports connecting via connection string or database file
    path and allows limiting the number of returned records.

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
    -TableName <String>
        The name of the table to query.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -ColumnName <String>
        The name of the column to retrieve data from.
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Count <Int32>
        The number of records to return. Default is 100. Use -1 to return all records.
        Required?                    false
        Position?                    4
        Default value                100
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SQLiteTableData
````PowerShell
Get-SQLiteTableData
````

### SYNOPSIS
    Retrieves data from a SQLite database table.

### SYNTAX
````PowerShell
Get-SQLiteTableData [-TableName] <String> [[-Count] <Int32>] [<CommonParameters>]
Get-SQLiteTableData [-ConnectionString] <String> [-TableName] <String> [[-Count] <Int32>] 
[<CommonParameters>]
Get-SQLiteTableData [-DatabaseFilePath] <String> [-TableName] <String> [[-Count] <Int32>] 
[<CommonParameters>]
````

### DESCRIPTION
    This function allows you to query data from a specified SQLite database table
    using either a connection string or database file path. It supports limiting the
    number of records returned.

### PARAMETERS
    -ConnectionString <String>
        The connection string to connect to the SQLite database.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -DatabaseFilePath <String>
        The file path to the SQLite database file.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -TableName <String>
        The name of the table to query data from.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Count <Int32>
        The maximum number of records to return. Default is 100. Use -1 to return all
        records.
        Required?                    false
        Position?                    3
        Default value                100
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SQLiteTables
````PowerShell
Get-SQLiteTables
````

### SYNOPSIS
    Retrieves a list of table names from a SQLite database.

### SYNTAX
````PowerShell
Get-SQLiteTables [<CommonParameters>]
Get-SQLiteTables [-ConnectionString] <String> [<CommonParameters>]
Get-SQLiteTables [-DatabaseFilePath] <String> [<CommonParameters>]
````

### DESCRIPTION
    This function queries a SQLite database to return all table names defined in the
    sqlite_master table. It supports connecting via either a connection string or a
    database file path.

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

##	Get-SQLiteTableSchema
````PowerShell
Get-SQLiteTableSchema
````

### SYNOPSIS
    Retrieves the schema information for a specified SQLite table.

### SYNTAX
````PowerShell
Get-SQLiteTableSchema [-TableName] <String> [<CommonParameters>]
Get-SQLiteTableSchema [-ConnectionString] <String> [-TableName] <String> 
[<CommonParameters>]
Get-SQLiteTableSchema [-DatabaseFilePath] <String> [-TableName] <String> 
[<CommonParameters>]
````

### DESCRIPTION
    This function queries the SQLite database to get detailed schema information for
    a specified table using the PRAGMA table_info command.

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
        The file path to the SQLite database file.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -TableName <String>
        The name of the table to get schema information for.
        Required?                    true
        Position?                    2
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

##	Get-SQLiteViewColumnData
````PowerShell
Get-SQLiteViewColumnData
````

### SYNOPSIS
    Retrieves column data from a SQLite view.

### SYNTAX
````PowerShell
Get-SQLiteViewColumnData [-ViewName] <String> [-ColumnName] <String> [[-Count] <Int32>] 
[<CommonParameters>]
Get-SQLiteViewColumnData [-ConnectionString] <String> [-ViewName] <String> [-ColumnName] 
<String> [[-Count] <Int32>] [<CommonParameters>]
Get-SQLiteViewColumnData [-DatabaseFilePath] <String> [-ViewName] <String> [-ColumnName] 
<String> [[-Count] <Int32>] [<CommonParameters>]
````

### DESCRIPTION
    This function retrieves data from a specified column in a SQLite view. It supports
    connecting via connection string or database file path and allows limiting the
    number of records returned.

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
    -ViewName <String>
        The name of the view to query.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -ColumnName <String>
        The name of the column to retrieve data from.
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Count <Int32>
        The number of records to return. Default is 100. Use -1 to return all records.
        Required?                    false
        Position?                    4
        Default value                100
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SQLiteViewData
````PowerShell
Get-SQLiteViewData
````

### SYNOPSIS
    Retrieves data from a SQLite database view.

### SYNTAX
````PowerShell
Get-SQLiteViewData [-DatabaseFilePath] <String> [-ViewName] <String> [[-Count] <Int32>] 
[<CommonParameters>]
Get-SQLiteViewData [-ConnectionString] <String> [-ViewName] <String> [[-Count] <Int32>] 
[<CommonParameters>]
````

### DESCRIPTION
    Gets records from a specified view in a SQLite database, either using a connection
    string or database file path. Allows limiting the number of records returned.

### PARAMETERS
    -ConnectionString <String>
        The connection string to connect to the SQLite database.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -DatabaseFilePath <String>
        The file path to the SQLite database file.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -ViewName <String>
        The name of the view to query data from.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Count <Int32>
        The maximum number of records to return. Use -1 to return all records.
        Default is 100.
        Required?                    false
        Position?                    3
        Default value                100
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SQLiteViews
````PowerShell
Get-SQLiteViews
````

### SYNOPSIS
    Retrieves a list of views from a SQLite database.

### SYNTAX
````PowerShell
Get-SQLiteViews [<CommonParameters>]
Get-SQLiteViews [-ConnectionString] <String> [<CommonParameters>]
Get-SQLiteViews [-DatabaseFilePath] <String> [<CommonParameters>]
````

### DESCRIPTION
    Gets all view names from the specified SQLite database using either a connection
    string or database file path.

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

##	Get-SQLiteViewSchema
````PowerShell
Get-SQLiteViewSchema
````

### SYNOPSIS
    Retrieves the SQL schema definition for a SQLite view.

### SYNTAX
````PowerShell
Get-SQLiteViewSchema [-ViewName] <String> [<CommonParameters>]
Get-SQLiteViewSchema [-ConnectionString] <String> [-ViewName] <String> [<CommonParameters>]
Get-SQLiteViewSchema [-DatabaseFilePath] <String> [-ViewName] <String> [<CommonParameters>]
````

### DESCRIPTION
    This function queries the SQLite system tables to retrieve the SQL definition of
    a specified view. It accepts either a connection string or database file path.

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
    -ViewName <String>
        The name of the view to retrieve the schema for.
        Required?                    true
        Position?                    2
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

##	Invoke-SQLiteQuery
````PowerShell
Invoke-SQLiteQuery
````

### SYNOPSIS
    Execute a query against a SQLite database.

### SYNTAX
````PowerShell
Invoke-SQLiteQuery [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] [-IsolationLevel 
{Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | 
Unspecified}] [<CommonParameters>]
Invoke-SQLiteQuery [-ConnectionString] <String> [-Queries] <String[]> [[-SqlParameters] 
<Hashtable[]>] [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SQLiteQuery [-DatabaseFilePath] <String> [-Queries] <String[]> [[-SqlParameters] 
<Hashtable[]>] [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
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

##	Invoke-SQLiteStudio
````PowerShell
Invoke-SQLiteStudio
````

### SYNOPSIS
    Executes SQLite queries using specified connection parameters.

### SYNTAX
````PowerShell
Invoke-SQLiteStudio [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] [-IsolationLevel 
{Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | 
Unspecified}] [<CommonParameters>]
Invoke-SQLiteStudio [-ConnectionString] <String> [-Queries] <String[]> [[-SqlParameters] 
<Hashtable[]>] [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SQLiteStudio [-DatabaseFilePath] <String> [-Queries] <String[]> [[-SqlParameters] 
<Hashtable[]>] [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
````

### DESCRIPTION
    This function allows execution of SQLite queries either through a connection string
    or direct database file path. It supports parameterized queries and transaction
    isolation levels.

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
        One or more SQL queries to execute against the database.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -SqlParameters <Hashtable[]>
        Optional parameters for the query, provided as hashtables.
        Format: @{"Id" = 1; "Name" = "John"}
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -IsolationLevel
        The transaction isolation level to use. Defaults to ReadCommitted.
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
###	GenXdev.Data.SQLite<hr/>

##	New-SQLiteDatabase
````PowerShell
New-SQLiteDatabase
````

### SYNOPSIS
    Creates a new SQLite database.

### SYNTAX
````PowerShell
New-SQLiteDatabase [-DatabaseFilePath] <String> [<CommonParameters>]
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
###	GenXdev.Data.SQLite<hr/>

##	Get-SQLiteSchema
````PowerShell
Get-SQLiteSchema
````

### SYNOPSIS
    Get the schema of a SQLite database.

### SYNTAX
````PowerShell
Get-SQLiteSchema [<CommonParameters>]
Get-SQLiteSchema [-ConnectionString] <String> [<CommonParameters>]
Get-SQLiteSchema [-DatabaseFilePath] <String> [<CommonParameters>]
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

##	Get-SQLiteTableColumnData
````PowerShell
Get-SQLiteTableColumnData
````

### SYNOPSIS
    Retrieves data from a specific column in a SQLite database table.

### SYNTAX
````PowerShell
Get-SQLiteTableColumnData [-TableName] <String> [-ColumnName] <String> [[-Count] <Int32>] 
[<CommonParameters>]
Get-SQLiteTableColumnData [-ConnectionString] <String> [-TableName] <String> [-ColumnName] 
<String> [[-Count] <Int32>] [<CommonParameters>]
Get-SQLiteTableColumnData [-DatabaseFilePath] <String> [-TableName] <String> [-ColumnName] 
<String> [[-Count] <Int32>] [<CommonParameters>]
````

### DESCRIPTION
    This function queries a SQLite database and returns the values from a specified
    column in a table. It supports connecting via connection string or database file
    path and allows limiting the number of returned records.

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
    -TableName <String>
        The name of the table to query.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -ColumnName <String>
        The name of the column to retrieve data from.
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Count <Int32>
        The number of records to return. Default is 100. Use -1 to return all records.
        Required?                    false
        Position?                    4
        Default value                100
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SQLiteTableData
````PowerShell
Get-SQLiteTableData
````

### SYNOPSIS
    Retrieves data from a SQLite database table.

### SYNTAX
````PowerShell
Get-SQLiteTableData [-TableName] <String> [[-Count] <Int32>] [<CommonParameters>]
Get-SQLiteTableData [-ConnectionString] <String> [-TableName] <String> [[-Count] <Int32>] 
[<CommonParameters>]
Get-SQLiteTableData [-DatabaseFilePath] <String> [-TableName] <String> [[-Count] <Int32>] 
[<CommonParameters>]
````

### DESCRIPTION
    This function allows you to query data from a specified SQLite database table
    using either a connection string or database file path. It supports limiting the
    number of records returned.

### PARAMETERS
    -ConnectionString <String>
        The connection string to connect to the SQLite database.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -DatabaseFilePath <String>
        The file path to the SQLite database file.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -TableName <String>
        The name of the table to query data from.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Count <Int32>
        The maximum number of records to return. Default is 100. Use -1 to return all
        records.
        Required?                    false
        Position?                    3
        Default value                100
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SQLiteTables
````PowerShell
Get-SQLiteTables
````

### SYNOPSIS
    Retrieves a list of table names from a SQLite database.

### SYNTAX
````PowerShell
Get-SQLiteTables [<CommonParameters>]
Get-SQLiteTables [-ConnectionString] <String> [<CommonParameters>]
Get-SQLiteTables [-DatabaseFilePath] <String> [<CommonParameters>]
````

### DESCRIPTION
    This function queries a SQLite database to return all table names defined in the
    sqlite_master table. It supports connecting via either a connection string or a
    database file path.

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

##	Get-SQLiteTableSchema
````PowerShell
Get-SQLiteTableSchema
````

### SYNOPSIS
    Retrieves the schema information for a specified SQLite table.

### SYNTAX
````PowerShell
Get-SQLiteTableSchema [-TableName] <String> [<CommonParameters>]
Get-SQLiteTableSchema [-ConnectionString] <String> [-TableName] <String> 
[<CommonParameters>]
Get-SQLiteTableSchema [-DatabaseFilePath] <String> [-TableName] <String> 
[<CommonParameters>]
````

### DESCRIPTION
    This function queries the SQLite database to get detailed schema information for
    a specified table using the PRAGMA table_info command.

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
        The file path to the SQLite database file.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -TableName <String>
        The name of the table to get schema information for.
        Required?                    true
        Position?                    2
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

##	Get-SQLiteViewColumnData
````PowerShell
Get-SQLiteViewColumnData
````

### SYNOPSIS
    Retrieves column data from a SQLite view.

### SYNTAX
````PowerShell
Get-SQLiteViewColumnData [-ViewName] <String> [-ColumnName] <String> [[-Count] <Int32>] 
[<CommonParameters>]
Get-SQLiteViewColumnData [-ConnectionString] <String> [-ViewName] <String> [-ColumnName] 
<String> [[-Count] <Int32>] [<CommonParameters>]
Get-SQLiteViewColumnData [-DatabaseFilePath] <String> [-ViewName] <String> [-ColumnName] 
<String> [[-Count] <Int32>] [<CommonParameters>]
````

### DESCRIPTION
    This function retrieves data from a specified column in a SQLite view. It supports
    connecting via connection string or database file path and allows limiting the
    number of records returned.

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
    -ViewName <String>
        The name of the view to query.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -ColumnName <String>
        The name of the column to retrieve data from.
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Count <Int32>
        The number of records to return. Default is 100. Use -1 to return all records.
        Required?                    false
        Position?                    4
        Default value                100
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SQLiteViewData
````PowerShell
Get-SQLiteViewData
````

### SYNOPSIS
    Retrieves data from a SQLite database view.

### SYNTAX
````PowerShell
Get-SQLiteViewData [-DatabaseFilePath] <String> [-ViewName] <String> [[-Count] <Int32>] 
[<CommonParameters>]
Get-SQLiteViewData [-ConnectionString] <String> [-ViewName] <String> [[-Count] <Int32>] 
[<CommonParameters>]
````

### DESCRIPTION
    Gets records from a specified view in a SQLite database, either using a connection
    string or database file path. Allows limiting the number of records returned.

### PARAMETERS
    -ConnectionString <String>
        The connection string to connect to the SQLite database.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -DatabaseFilePath <String>
        The file path to the SQLite database file.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -ViewName <String>
        The name of the view to query data from.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Count <Int32>
        The maximum number of records to return. Use -1 to return all records.
        Default is 100.
        Required?                    false
        Position?                    3
        Default value                100
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-SQLiteViews
````PowerShell
Get-SQLiteViews
````

### SYNOPSIS
    Retrieves a list of views from a SQLite database.

### SYNTAX
````PowerShell
Get-SQLiteViews [<CommonParameters>]
Get-SQLiteViews [-ConnectionString] <String> [<CommonParameters>]
Get-SQLiteViews [-DatabaseFilePath] <String> [<CommonParameters>]
````

### DESCRIPTION
    Gets all view names from the specified SQLite database using either a connection
    string or database file path.

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

##	Get-SQLiteViewSchema
````PowerShell
Get-SQLiteViewSchema
````

### SYNOPSIS
    Retrieves the SQL schema definition for a SQLite view.

### SYNTAX
````PowerShell
Get-SQLiteViewSchema [-ViewName] <String> [<CommonParameters>]
Get-SQLiteViewSchema [-ConnectionString] <String> [-ViewName] <String> [<CommonParameters>]
Get-SQLiteViewSchema [-DatabaseFilePath] <String> [-ViewName] <String> [<CommonParameters>]
````

### DESCRIPTION
    This function queries the SQLite system tables to retrieve the SQL definition of
    a specified view. It accepts either a connection string or database file path.

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
    -ViewName <String>
        The name of the view to retrieve the schema for.
        Required?                    true
        Position?                    2
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

##	Invoke-SQLiteQuery
````PowerShell
Invoke-SQLiteQuery
````

### SYNOPSIS
    Execute a query against a SQLite database.

### SYNTAX
````PowerShell
Invoke-SQLiteQuery [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] [-IsolationLevel 
{Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | 
Unspecified}] [<CommonParameters>]
Invoke-SQLiteQuery [-ConnectionString] <String> [-Queries] <String[]> [[-SqlParameters] 
<Hashtable[]>] [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SQLiteQuery [-DatabaseFilePath] <String> [-Queries] <String[]> [[-SqlParameters] 
<Hashtable[]>] [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
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

##	Invoke-SQLiteStudio
````PowerShell
Invoke-SQLiteStudio
````

### SYNOPSIS
    Executes SQLite queries using specified connection parameters.

### SYNTAX
````PowerShell
Invoke-SQLiteStudio [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] [-IsolationLevel 
{Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | 
Unspecified}] [<CommonParameters>]
Invoke-SQLiteStudio [-ConnectionString] <String> [-Queries] <String[]> [[-SqlParameters] 
<Hashtable[]>] [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SQLiteStudio [-DatabaseFilePath] <String> [-Queries] <String[]> [[-SqlParameters] 
<Hashtable[]>] [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
````

### DESCRIPTION
    This function allows execution of SQLite queries either through a connection string
    or direct database file path. It supports parameterized queries and transaction
    isolation levels.

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
        One or more SQL queries to execute against the database.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -SqlParameters <Hashtable[]>
        Optional parameters for the query, provided as hashtables.
        Format: @{"Id" = 1; "Name" = "John"}
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -IsolationLevel
        The transaction isolation level to use. Defaults to ReadCommitted.
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

##	New-SQLiteDatabase
````PowerShell
New-SQLiteDatabase
````

### SYNOPSIS
    Creates a new SQLite database.

### SYNTAX
````PowerShell
New-SQLiteDatabase [-DatabaseFilePath] <String> [<CommonParameters>]
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
Get-ValueByKeyFromStore [-StoreName] <String> [-KeyName] <String> [[-DefaultValue] 
<String>] [[-SynchronizationKey] <String>] [<CommonParameters>]
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
Remove-KeyFromStore [-StoreName] <String> [-KeyName] <String> [[-SynchronizationKey] 
<String>] [<CommonParameters>]
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
Remove-KeyValueStore [-StoreName] <String> [[-SynchronizationKey] <String>] 
[<CommonParameters>]
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
Set-ValueByKeyInStore [-StoreName] <String> [-KeyName] <String> [[-Value] <String>] 
[[-SynchronizationKey] <String>] [<CommonParameters>]
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
Invoke-SqlServerQuery [-Queries] <String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel 
{Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | 
Unspecified}] [<CommonParameters>]
Invoke-SqlServerQuery [-ConnectionString] <String> [-Queries] <String[]> [-SqlParameters] 
<Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlServerQuery [-HostName] <String> [-Queries] <String[]> [-SqlParameters] 
<Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlServerQuery [-HostName] <String> [-User] <String> [-Password] <String> [-Queries] 
<String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | 
ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] 
[<CommonParameters>]
Invoke-SqlServerQuery [-HostName] <String> [-Queries] <String[]> [-SqlParameters] 
<Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
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
Invoke-SqlServerQuery [-Queries] <String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel 
{Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | 
Unspecified}] [<CommonParameters>]
Invoke-SqlServerQuery [-ConnectionString] <String> [-Queries] <String[]> [-SqlParameters] 
<Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlServerQuery [-HostName] <String> [-Queries] <String[]> [-SqlParameters] 
<Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
Invoke-SqlServerQuery [-HostName] <String> [-User] <String> [-Password] <String> [-Queries] 
<String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | 
ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] 
[<CommonParameters>]
Invoke-SqlServerQuery [-HostName] <String> [-Queries] <String[]> [-SqlParameters] 
<Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | 
Serializable | Snapshot | Unspecified}] [<CommonParameters>]
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
