<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Data
### SYNOPSIS
    A Windows PowerShell module for enhancing the commandline experience
[![GenXdev.Data](https://img.shields.io/powershellgallery/v/GenXdev.Data.svg?style=flat-square&label=GenXdev.Data)](https://www.powershellgallery.com/packages/GenXdev.Data/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Data?style=flat-square)](./LICENSE)

## MIT License

```text
MIT License

Copyright (c) 2025 GenXdev

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
````

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
### GenXdev.Data.KeyValueStore
| Command | Aliases | Description |
| --- | --- | --- |
| [Get-KeyValueStoreNames](#get-keyvaluestorenames) | getstorenames | Retrieves a list of all available key-value store names from the database. |
| [Get-StoreKeys](#get-storekeys) | getkeys | Retrieves all key names for a given key-value store. |
| [Get-ValueByKeyFromStore](#get-valuebykeyfromstore) | getvalue | Retrieves a value from a key-value store database. |
| [Initialize-KeyValueStores](#initialize-keyvaluestores) | &nbsp; | Initializes and synchronizes KeyValueStore databases between local and OneDrive. |
| [Remove-KeyFromStore](#remove-keyfromstore) | removekey | Deletes a key from the specified key-value store. |
| [Remove-KeyValueStore](#remove-keyvaluestore) | &nbsp; | Removes a key-value store from the database. |
| [Set-ValueByKeyInStore](#set-valuebykeyinstore) | setvalue | Manages key-value pairs in a SQLite database store. |
| [Sync-KeyValueStore](#sync-keyvaluestore) | &nbsp; | Synchronizes local and OneDrive key-value store databases. |

### GenXdev.Data.Preferences
| Command | Aliases | Description |
| --- | --- | --- |
| [Get-GenXdevPreference](#get-genxdevpreference) | getpreference | Retrieves a preference value from the GenXdev preferences store. |
| [Get-GenXdevPreferenceNames](#get-genxdevpreferencenames) | getpreferencenames | Gets all preference names from session storage and database stores. |
| [Get-GenXdevPreferencesDatabasePath](#get-genxdevpreferencesdatabasepath) | &nbsp; | Gets the configured database path for preference data files used in GenXdev.Data operations. |
| [Remove-GenXdevPreference](#remove-genxdevpreference) | removepreference | Removes a preference value from the GenXdev preferences store. |
| [Set-GenXdevDefaultPreference](#set-genxdevdefaultpreference) | setpreferencedefault | Sets a default preference value in the GenXdev preferences store. |
| [Set-GenXdevPreference](#set-genxdevpreference) | setpreference | Sets a preference value in the GenXdev preferences store. |
| [Set-GenXdevPreferencesDatabasePath](#set-genxdevpreferencesdatabasepath) | &nbsp; | Sets the database path for preferences used in GenXdev.Data operations. |

### GenXdev.Data.SQLite
| Command | Aliases | Description |
| --- | --- | --- |
| [EnsureSQLiteStudioInstalled](#ensuresqlitestudioinstalled) | &nbsp; | Ensures SQLiteStudio is installed and accessible from the command line. |
| [Get-SQLiteSchema](#get-sqliteschema) | &nbsp; | Retrieves the complete schema information from a SQLite database. |
| [Get-SQLiteTableColumnData](#get-sqlitetablecolumndata) | &nbsp; | Retrieves data from a specific column in a SQLite database table. |
| [Get-SQLiteTableData](#get-sqlitetabledata) | &nbsp; | Retrieves data from a SQLite database table with optional record limiting. |
| [Get-SQLiteTables](#get-sqlitetables) | &nbsp; | Retrieves a list of table names from a SQLite database. |
| [Get-SQLiteTableSchema](#get-sqlitetableschema) | &nbsp; | Retrieves the schema information for a specified SQLite table. |
| [Get-SQLiteTransaction](#get-sqlitetransaction) | getsqltx, newsqltx | Creates and returns a SQLite transaction object for batch operations. |
| [Get-SQLiteViewColumnData](#get-sqliteviewcolumndata) | &nbsp; | Retrieves column data from a SQLite view with optional record limiting. |
| [Get-SQLiteViewData](#get-sqliteviewdata) | &nbsp; | Retrieves data from a SQLite database view with optional record limiting. |
| [Get-SQLiteViews](#get-sqliteviews) | &nbsp; | Retrieves a list of views from a SQLite database. |
| [Get-SQLiteViewSchema](#get-sqliteviewschema) | &nbsp; | Retrieves the SQL schema definition for a SQLite view. |
| [Invoke-SQLiteQuery](#invoke-sqlitequery) | &nbsp; | Executes one or more SQL queries against a SQLite database with transaction support. |
| [Invoke-SQLiteStudio](#invoke-sqlitestudio) | &nbsp; | Executes SQLite database queries with support for parameters and transactions. |
| [New-SQLiteDatabase](#new-sqlitedatabase) | nsqldb | Creates a new SQLite database file. |

### GenXdev.Data.SqlServer
| Command | Aliases | Description |
| --- | --- | --- |
| [Invoke-SqlServerQuery](#invoke-sqlserverquery) | &nbsp; | Executes SQL queries against a SQL Server database with transaction support. |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/> 

##	Get-KeyValueStoreNames 
````PowerShell 

   Get-KeyValueStoreNames               --> getstorenames  
```` 

### SYNOPSIS 
    Retrieves a list of all available key-value store names from the database.  

### SYNTAX 
````PowerShell 
Get-KeyValueStoreNames [[-SynchronizationKey] <String>] [-DatabasePath <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Queries the SQLite database to get unique store names based on the provided  
    synchronization key. The function handles database initialization if needed and  
    performs synchronization for non-local scopes. Returns store names that are  
    not marked as deleted and match the specified synchronization scope.  

### PARAMETERS 
    -SynchronizationKey <String>  
        Key to identify synchronization scope. Use '%' for all stores, 'Local' for  
        local stores only. Synchronization occurs for non-local scopes. Supports SQL  
        LIKE pattern matching for flexible store filtering.  
        Required?                    false  
        Position?                    1  
        Default value                %  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabasePath <String>  
        Directory path for preferences database files. When specified, overrides the  
        default database location for storing key-value store configurations.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language,  
        Database paths, etc. When enabled, retrieves settings from session variables  
        instead of persistent storage.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear the session setting (Global variable) before retrieving. Forces a fresh  
        retrieval of settings by clearing any cached session data before processing.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Dont use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc. Forces retrieval from persistent storage,  
        bypassing any session-cached settings.  
        Required?                    false  
        Position?                    named  
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
 

##	Get-StoreKeys 
````PowerShell 

   Get-StoreKeys                        --> getkeys  
```` 

### SYNOPSIS 
    Retrieves all key names for a given key-value store.  

### SYNTAX 
````PowerShell 
Get-StoreKeys [-StoreName] <String> [[-SynchronizationKey] <String>] [-DatabasePath <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Queries the KeyValueStore SQLite database to retrieve all active (non-deleted)  
    keys for a specified store. Can optionally filter by synchronization scope.  
    Automatically initializes the database if not found and handles synchronization  
    for non-local stores.  

### PARAMETERS 
    -StoreName <String>  
        The name of the key-value store to query. This identifies the logical grouping  
        of keys and values in the database.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SynchronizationKey <String>  
        Optional scope identifier for synchronization. Use "Local" for local-only data.  
        Defaults to "%" which matches all scopes. Triggers sync for non-local scopes.  
        Required?                    false  
        Position?                    2  
        Default value                %  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabasePath <String>  
        Directory path for keyvalue database files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language,  
        Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear the session setting (Global variable) before retrieving.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Do not use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc.  
        Required?                    false  
        Position?                    named  
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
 

##	Get-ValueByKeyFromStore 
````PowerShell 

   Get-ValueByKeyFromStore              --> getvalue  
```` 

### SYNOPSIS 
    Retrieves a value from a key-value store database.  

### SYNTAX 
````PowerShell 
Get-ValueByKeyFromStore [-StoreName] <String> [-KeyName] <String> [[-DefaultValue] <String>] [[-SynchronizationKey] <String>] [-DatabasePath <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Retrieves a value for a specified key from a SQLite-based key-value store. The  
    function supports optional default values and synchronization across different  
    scopes. It can use session-based settings or direct database access and  
    provides automatic database initialization and synchronization capabilities.  

### PARAMETERS 
    -StoreName <String>  
        The name of the key-value store to query.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeyName <String>  
        The key whose value should be retrieved.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DefaultValue <String>  
        Optional default value to return if the key is not found.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SynchronizationKey <String>  
        Optional key to identify synchronization scope. Defaults to "Local".  
        Required?                    false  
        Position?                    4  
        Default value                Local  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabasePath <String>  
        Database path for key-value store data files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language,  
        Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear the session setting (Global variable) before retrieving.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Dont use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc.  
        Required?                    false  
        Position?                    named  
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
 

##	Initialize-KeyValueStores 
````PowerShell 

   Initialize-KeyValueStores  
```` 

### SYNOPSIS 
    Initializes and synchronizes KeyValueStore databases between local and OneDrive.  

### SYNTAX 
````PowerShell 
Initialize-KeyValueStores [-SessionOnly] [-ClearSession] [[-DatabasePath] <String>] [-SkipSession] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates SQLite databases with required schema in two locations if they do not  
    exist:  
    1. Local machine for immediate access  
    2. OneDrive folder for cloud synchronization  
    The function ensures both databases have identical schema with synchronization  
    support.  

### PARAMETERS 
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language,  
        Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear the session setting (Global variable) before retrieving.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabasePath <String>  
        Database path for key-value store data files.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Dont use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc.  
        Required?                    false  
        Position?                    named  
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
 

##	Remove-KeyFromStore 
````PowerShell 

   Remove-KeyFromStore                  --> removekey  
```` 

### SYNOPSIS 
    Deletes a key from the specified key-value store.  

### SYNTAX 
````PowerShell 
Remove-KeyFromStore [-StoreName] <String> [-KeyName] <String> [[-SynchronizationKey] <String>] [-SessionOnly] [-ClearSession] [-DatabasePath <String>] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Removes a key-value pair from the SQLite database store. For local stores,  
    performs a hard delete removing the record permanently. For synchronized stores,  
    marks the record as deleted with a timestamp and triggers synchronization to  
    propagate the deletion across all synchronized instances.  

### PARAMETERS 
    -StoreName <String>  
        The name of the key-value store to delete from.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeyName <String>  
        The key to be deleted from the store.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SynchronizationKey <String>  
        Optional synchronization scope identifier. Defaults to "Local". When not "Local",  
        triggers synchronization after marking record as deleted.  
        Required?                    false  
        Position?                    3  
        Default value                Local  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language,  
        Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear the session setting (Global variable) before retrieving.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabasePath <String>  
        Database path for key-value store data files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Dont use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
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
 

##	Remove-KeyValueStore 
````PowerShell 

   Remove-KeyValueStore  
```` 

### SYNOPSIS 
    Removes a key-value store from the database.  

### SYNTAX 
````PowerShell 
Remove-KeyValueStore [-StoreName] <String> [[-SynchronizationKey] <String>] [-DatabasePath <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Removes all entries for a specified store from the database. For local stores,  
    performs a physical delete. For synchronized stores, marks entries as deleted  
    and triggers synchronization. This function supports both local and cloud-  
    synchronized stores with proper audit trail maintenance.  

### PARAMETERS 
    -StoreName <String>  
        The name of the key-value store to remove.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SynchronizationKey <String>  
        The synchronization scope identifier. Defaults to "Local" for non-synchronized  
        stores.  
        Required?                    false  
        Position?                    2  
        Default value                Local  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabasePath <String>  
        Database path for key-value store data files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language,  
        Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear the session setting (Global variable) before retrieving.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Dont use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
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
 

##	Set-ValueByKeyInStore 
````PowerShell 

   Set-ValueByKeyInStore                --> setvalue  
```` 

### SYNOPSIS 
    Manages key-value pairs in a SQLite database store.  

### SYNTAX 
````PowerShell 
Set-ValueByKeyInStore [-StoreName] <String> [-KeyName] <String> [[-Value] <String>] [[-SynchronizationKey] <String>] [-DatabasePath <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Provides persistent storage for key-value pairs using SQLite. Handles both  
    insertion of new entries and updates to existing ones. Supports optional  
    synchronization for non-local stores. This function implements an upsert  
    operation that either inserts new key-value pairs or updates existing ones  
    based on the combination of synchronization key, store name, and key name.  

### PARAMETERS 
    -StoreName <String>  
        The name of the store where the key-value pair will be saved.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeyName <String>  
        The unique identifier for the value within the specified store.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Value <String>  
        The data to be stored, associated with the specified key.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SynchronizationKey <String>  
        Identifies the synchronization scope. Use "Local" for local-only storage.  
        Defaults to "Local". Non-local values trigger store synchronization.  
        Required?                    false  
        Position?                    4  
        Default value                Local  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabasePath <String>  
        Database path for key-value store data files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language,  
        Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear the session setting (Global variable) before retrieving.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Dont use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
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
 

##	Sync-KeyValueStore 
````PowerShell 

   Sync-KeyValueStore  
```` 

### SYNOPSIS 
    Synchronizes local and OneDrive key-value store databases.  

### SYNTAX 
````PowerShell 
Sync-KeyValueStore [[-SynchronizationKey] <String>] [-DatabasePath <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Performs two-way synchronization between local and OneDrive shadow databases using  
    a last-modified timestamp strategy. Records are merged based on their last  
    modification time, with newer versions taking precedence.  

### PARAMETERS 
    -SynchronizationKey <String>  
        Identifies the synchronization scope for the operation. Using "Local" will skip  
        synchronization as it indicates local-only records.  
        Required?                    false  
        Position?                    1  
        Default value                Local  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabasePath <String>  
        Database path for key-value store data files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language,  
        Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear the session setting (Global variable) before retrieving.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Dont use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc.  
        Required?                    false  
        Position?                    named  
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
Get-GenXdevPreference [-Name] <String> [[-DefaultValue] <String>] [-PreferencesDatabasePath <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### DESCRIPTION 
    The function implements a two-tier preference retrieval system. It first checks  
    the local store for a preference value. If not found, it falls back to the  
    default store. If still not found, returns the provided default value.  

### PARAMETERS 
    -Name <String>  
        The name of the preference to retrieve from the preference stores.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -DefaultValue <String>  
        The fallback value to return if the preference is not found in any store.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Database path for preference data files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language,  
        Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear the session setting (Global variable) before retrieving.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Dont use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc.  
        Required?                    false  
        Position?                    named  
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
 

##	Get-GenXdevPreferenceNames 
````PowerShell 

   Get-GenXdevPreferenceNames           --> getPreferenceNames  
```` 

### SYNOPSIS 
    Gets all preference names from session storage and database stores.  

### SYNTAX 
````PowerShell 
Get-GenXdevPreferenceNames [-SessionOnly] [-ClearSession] [[-PreferencesDatabasePath] <String>] [-SkipSession] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Retrieves a unique list of preference names by combining keys from session  
    storage (global variables) and both the local and default preference stores.  
    The function respects session management parameters to control which sources  
    are queried.  
    The function first checks session storage (unless SkipSession is specified),  
    then falls back to database stores (unless SessionOnly is specified). It  
    merges all keys, removes duplicates, sorts them alphabetically, and returns  
    the combined list.  
    This function is useful when you need to see all available preference settings,  
    regardless of whether they are stored in session or persistent storage.  

### PARAMETERS 
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language,  
        Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear the session setting (Global variable) before retrieving.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Database path for preference data files.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Dont use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc.  
        Required?                    false  
        Position?                    named  
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
 

##	Get-GenXdevPreferencesDatabasePath 
````PowerShell 

   Get-GenXdevPreferencesDatabasePath  
```` 

### SYNOPSIS 
    Gets the configured database path for preference data files used in GenXdev.Data operations.  

### SYNTAX 
````PowerShell 
Get-GenXdevPreferencesDatabasePath [[-PreferencesDatabasePath] <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function retrieves the global database path used by the GenXdev.Data module for various preference storage and data operations. It checks Global variables first (unless SkipSession is specified), then uses system defaults.  

### PARAMETERS 
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        When specified, clears the session database path setting (Global variable) before retrieving the configuration.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        When specified, skips checking the session setting (Global variable) and retrieves only from persistent preferences.  
        Required?                    false  
        Position?                    named  
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
 

##	Remove-GenXdevPreference 
````PowerShell 

   Remove-GenXdevPreference             --> removePreference  
```` 

### SYNOPSIS 
    Removes a preference value from the GenXdev preferences store.  

### SYNTAX 
````PowerShell 
Remove-GenXdevPreference [-Name] <String> [[-RemoveDefault]] [-PreferencesDatabasePath <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function removes a preference value from both the local store and  
    optionally from the default store. It provides two parameter sets - one for  
    local removal only and another for removing from both local and default stores.  
    The function ensures proper synchronization when modifying the default store.  

### PARAMETERS 
    -Name <String>  
        Specifies the name of the preference to remove. This is required and can be  
        provided via pipeline input.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -RemoveDefault [<SwitchParameter>]  
        When specified, removes the preference from both the local and default stores.  
        If not specified, only removes from the local store.  
        Required?                    false  
        Position?                    2  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Database path for preference data files.  
        Alias: DatabasePath  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language,  
        Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear the session setting (Global variable) before retrieving.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Dont use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
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
 

##	Set-GenXdevDefaultPreference 
````PowerShell 

   Set-GenXdevDefaultPreference         --> setPreferenceDefault  
```` 

### SYNOPSIS 
    Sets a default preference value in the GenXdev preferences store.  

### SYNTAX 
````PowerShell 
Set-GenXdevDefaultPreference [-Name] <String> [[-Value] <String>] [[-PreferencesDatabasePath] <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function manages default preferences in the GenXdev preference system. It  
    handles storing values, removing preferences when values are empty, and ensures  
    changes are synchronized across the system. The function supports null values by  
    removing the preference entirely in such cases. When a value is provided, it is  
    stored in the key-value store and synchronized across all consumers.  

### PARAMETERS 
    -Name <String>  
        Specifies the name (key) of the preference to set in the default store. This  
        parameter is required and cannot be null or empty.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Value <String>  
        Specifies the value to store for the preference. Can be null or empty, which  
        will result in removing the preference from the store.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Database path for preference data files. This parameter is optional and can  
        be used to override the default database path.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language,  
        Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear the session setting (Global variable) before retrieving.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Dont use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
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
 

##	Set-GenXdevPreference 
````PowerShell 

   Set-GenXdevPreference                --> setPreference  
```` 

### SYNOPSIS 
    Sets a preference value in the GenXdev preferences store.  

### SYNTAX 
````PowerShell 
Set-GenXdevPreference [-Name] <String> [[-Value] <String>] [-SessionOnly] [-ClearSession] [-PreferencesDatabasePath <String>] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function manages preferences in the GenXdev local store. It can set new  
    preferences, update existing ones, or remove them when a null/empty value is  
    provided. The preferences are stored with synchronization set to "Local".  

### PARAMETERS 
    -Name <String>  
        Specifies the name (key) of the preference to set. This is required and must not  
        be null or empty.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Value <String>  
        Specifies the value to store for the preference. If null or empty, the preference  
        will be removed instead of being set.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for Data preferences like Language,  
        Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear the session setting (Global variable) before retrieving.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Database path for preference data files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Dont use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
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
 

##	Set-GenXdevPreferencesDatabasePath 
````PowerShell 

   Set-GenXdevPreferencesDatabasePath  
```` 

### SYNOPSIS 
    Sets the database path for preferences used in GenXdev.Data operations.  

### SYNTAX 
````PowerShell 
Set-GenXdevPreferencesDatabasePath [[-PreferencesDatabasePath] <String>] [-SkipSession] [-SessionOnly] [-ClearSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function configures the global database path used by the GenXdev.Data  
    module for various preference storage and data operations. Settings are  
    stored in the current session (using Global variables) and can be cleared  
    from the session (using -ClearSession).  

### PARAMETERS 
    -PreferencesDatabasePath <String>  
        A database path where preference data files are located. This path will be used  
        by GenXdev.Data functions for preference storage and processing operations.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Dont use alternative settings stored in session for Data preferences like  
        Language, Database paths, etc.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        When specified, stores the setting only in the current session (Global  
        variable) without persisting to preferences. Setting will be lost when the  
        session ends.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        When specified, clears only the session setting (Global variable) without  
        affecting persistent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
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
###	GenXdev.Data.SQLite<hr/> 

##	EnsureSQLiteStudioInstalled 
````PowerShell 

   EnsureSQLiteStudioInstalled  
```` 

### SYNOPSIS 
    Ensures SQLiteStudio is installed and accessible from the command line.  

### SYNTAX 
````PowerShell 
EnsureSQLiteStudioInstalled [<CommonParameters>] 
```` 

### DESCRIPTION 
    Verifies if SQLiteStudio is installed and available in the system PATH. If not  
    found, it first checks if the PATH environment variable needs updating. If that  
    doesn't resolve the issue, it installs SQLiteStudio using WinGet and configures  
    the PATH environment variable.  

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
    Retrieves the complete schema information from a SQLite database.  

### SYNTAX 
````PowerShell 
Get-SQLiteSchema [<CommonParameters>]  
   Get-SQLiteSchema [-ConnectionString] <String> [<CommonParameters>]  
   Get-SQLiteSchema [-DatabaseFilePath] <String> [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function queries the sqlite_master table to obtain the complete schema  
    definition of a SQLite database, including tables, views, indexes and triggers.  
    It accepts either a connection string or a direct path to the database file.  

### PARAMETERS 
    -ConnectionString <String>  
        The SQLite connection string that specifies the database location and any  
        additional connection parameters.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabaseFilePath <String>  
        The direct filesystem path to the SQLite database file.  
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
Get-SQLiteTableColumnData [-TableName] <String> [-ColumnName] <String> [[-Count] <Int32>] [<CommonParameters>]  
   Get-SQLiteTableColumnData [-ConnectionString] <String> [-TableName] <String> [-ColumnName] <String> [[-Count] <Int32>] [<CommonParameters>]  
   Get-SQLiteTableColumnData [-DatabaseFilePath] <String> [-TableName] <String> [-ColumnName] <String> [[-Count] <Int32>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function provides a convenient way to extract data from a single column in a  
    SQLite database table. It supports two connection methods: direct database file  
    path or connection string. The function includes options to limit the number of  
    returned records and uses proper SQLite query construction for optimal  
    performance.  

### PARAMETERS 
    -ConnectionString <String>  
        The connection string to connect to the SQLite database. This parameter is  
        mutually exclusive with DatabaseFilePath.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabaseFilePath <String>  
        The file path to the SQLite database file. This parameter is mutually exclusive  
        with ConnectionString.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TableName <String>  
        The name of the table from which to retrieve the column data.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ColumnName <String>  
        The name of the column whose data should be retrieved.  
        Required?                    true  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Count <Int32>  
        The maximum number of records to return. Default is 100. Use -1 to return all  
        records without limit.  
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
    Retrieves data from a SQLite database table with optional record limiting.  

### SYNTAX 
````PowerShell 
Get-SQLiteTableData [-TableName] <String> [[-Count] <Int32>] [<CommonParameters>]  
   Get-SQLiteTableData [-ConnectionString] <String> [-TableName] <String> [[-Count] <Int32>] [<CommonParameters>]  
   Get-SQLiteTableData [-DatabaseFilePath] <String> [-TableName] <String> [[-Count] <Int32>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function queries data from a SQLite database table using either a connection  
    string or database file path. It provides flexibility in connecting to the  
    database and controlling the amount of data retrieved through the Count parameter.  

### PARAMETERS 
    -ConnectionString <String>  
        Specifies the SQLite connection string in the format:  
        "Data Source=path_to_database_file"  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabaseFilePath <String>  
        Specifies the full file system path to the SQLite database file.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TableName <String>  
        Specifies the name of the table to query data from. The table must exist in the  
        database.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Count <Int32>  
        Specifies the maximum number of records to return. Default is 100.  
        Use -1 to return all records. Must be -1 or a positive integer.  
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
    Queries the sqlite_master system table to retrieve all user-defined table names  
    from a SQLite database. Supports connecting via either a direct connection string  
    or a database file path. Returns the table names as a collection of strings.  

### PARAMETERS 
    -ConnectionString <String>  
        The full connection string to connect to the SQLite database. Should include the  
        Data Source and Version parameters at minimum.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabaseFilePath <String>  
        The full filesystem path to the SQLite database file. The function will create  
        an appropriate connection string internally.  
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
   Get-SQLiteTableSchema [-ConnectionString] <String> [-TableName] <String> [<CommonParameters>]  
   Get-SQLiteTableSchema [-DatabaseFilePath] <String> [-TableName] <String> [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function queries the SQLite database to get detailed schema information for  
    a specified table. It uses the SQLite PRAGMA table_info command to return column  
    definitions including names, types, nullable status, and default values.  

### PARAMETERS 
    -ConnectionString <String>  
        Specifies the SQLite connection string in the format:  
        "Data Source=path_to_database_file"  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabaseFilePath <String>  
        Specifies the direct file path to the SQLite database file. This is converted  
        internally to a connection string.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TableName <String>  
        Specifies the name of the table for which to retrieve schema information.  
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
 

##	Get-SQLiteTransaction 
````PowerShell 

   Get-SQLiteTransaction                --> getsqltx, newsqltx  
```` 

### SYNOPSIS 
    Creates and returns a SQLite transaction object for batch operations.  

### SYNTAX 
````PowerShell 
Get-SQLiteTransaction [-DatabaseFilePath] <String> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [-CreateDatabaseIfNotExists <Boolean>] [<CommonParameters>]  
   Get-SQLiteTransaction [-ConnectionString] <String> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [-CreateDatabaseIfNotExists <Boolean>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates a SQLite database connection and transaction object that can be used  
    for batch operations. The caller is responsible for committing or rolling back  
    the transaction. The connection will be automatically created if the database  
    file doesn't exist.  

### PARAMETERS 
    -ConnectionString <String>  
        The SQLite connection string for database access.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabaseFilePath <String>  
        The file path to the SQLite database. Will be converted to a connection string.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IsolationLevel  
        Transaction isolation level. Defaults to ReadCommitted.  
        Required?                    false  
        Position?                    named  
        Default value                ReadCommitted  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CreateDatabaseIfNotExists <Boolean>  
        Whether to create the database file if it doesn't exist. Defaults to true.  
        Required?                    false  
        Position?                    named  
        Default value                True  
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
    Retrieves column data from a SQLite view with optional record limiting.  

### SYNTAX 
````PowerShell 
Get-SQLiteViewColumnData [-ViewName] <String> [-ColumnName] <String> [[-Count] <Int32>] [<CommonParameters>]  
   Get-SQLiteViewColumnData [-ConnectionString] <String> [-ViewName] <String> [-ColumnName] <String> [[-Count] <Int32>] [<CommonParameters>]  
   Get-SQLiteViewColumnData [-DatabaseFilePath] <String> [-ViewName] <String> [-ColumnName] <String> [[-Count] <Int32>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Executes a SELECT query against a specified SQLite view to retrieve data from a  
    single column. Supports connecting via either a connection string or database file  
    path. Allows limiting the number of returned records or retrieving all records.  

### PARAMETERS 
    -ConnectionString <String>  
        The SQLite database connection string. This parameter is mutually exclusive with  
        DatabaseFilePath.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabaseFilePath <String>  
        The full path to the SQLite database file. This parameter is mutually exclusive  
        with ConnectionString.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ViewName <String>  
        The name of the SQLite view to query data from.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ColumnName <String>  
        The name of the column within the view to retrieve data from.  
        Required?                    true  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Count <Int32>  
        The maximum number of records to return. Use -1 to return all records. Defaults  
        to 100 if not specified.  
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
    Retrieves data from a SQLite database view with optional record limiting.  

### SYNTAX 
````PowerShell 
Get-SQLiteViewData [-DatabaseFilePath] <String> [-ViewName] <String> [[-Count] <Int32>] [<CommonParameters>]  
   Get-SQLiteViewData [-ConnectionString] <String> [-ViewName] <String> [[-Count] <Int32>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Queries a SQLite database view using either a connection string or database file  
    path. The function supports limiting the number of returned records and provides  
    verbose output for tracking query execution.  

### PARAMETERS 
    -ConnectionString <String>  
        The connection string to connect to the SQLite database. This parameter is  
        mutually exclusive with DatabaseFilePath.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabaseFilePath <String>  
        The file path to the SQLite database file. This parameter is mutually exclusive  
        with ConnectionString.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ViewName <String>  
        The name of the view from which to retrieve data.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Count <Int32>  
        The maximum number of records to return. Use -1 to return all records.  
        Defaults to 100 if not specified.  
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
    Gets all view names from the specified SQLite database file or connection string.  
    Returns an array of view names that can be used for further database operations.  
    The function supports two parameter sets for flexibility: providing either a  
    connection string or a direct path to the database file.  

### PARAMETERS 
    -ConnectionString <String>  
        The connection string to connect to the SQLite database. Use this when you need  
        to specify custom connection parameters.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabaseFilePath <String>  
        The full path to the SQLite database file. Use this for simple file-based  
        connections.  
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
    This function queries the SQLite database's system tables to extract the SQL  
    definition of a specified view. It supports connecting via either a connection  
    string or direct database file path and returns the complete SQL schema that  
    defines the requested view.  

### PARAMETERS 
    -ConnectionString <String>  
        The connection string used to connect to the SQLite database. This parameter is  
        mutually exclusive with DatabaseFilePath.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabaseFilePath <String>  
        The full path to the SQLite database file. This parameter is mutually exclusive  
        with ConnectionString.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ViewName <String>  
        The name of the view whose schema definition should be retrieved.  
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
    Executes one or more SQL queries against a SQLite database with transaction support.  

### SYNTAX 
````PowerShell 
Invoke-SQLiteQuery [[-ConnectionString] <String>] [[-DatabaseFilePath] <String>] [[-Transaction] <SQLiteTransaction>] [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Executes SQL queries against a SQLite database with parameter support and  
    configurable transaction isolation. Can use an external transaction for batch  
    operations or create its own internal transaction. When using an external  
    transaction, the caller is responsible for committing/rolling back.  
    Connection priority: Transaction > ConnectionString > DatabaseFilePath.  

### PARAMETERS 
    -ConnectionString <String>  
        The SQLite connection string for database access. Used if no Transaction is provided.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabaseFilePath <String>  
        The file path to the SQLite database. Will be converted to a connection string.  
        Used if no Transaction or ConnectionString is provided.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Transaction <SQLiteTransaction>  
        An existing SQLite transaction to use. When provided, the function will not  
        commit or rollback the transaction - that's the caller's responsibility.  
        Takes priority over ConnectionString and DatabaseFilePath.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Queries <String[]>  
        One or more SQL queries to execute. Can be passed via pipeline.  
        Required?                    true  
        Position?                    4  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -SqlParameters <Hashtable[]>  
        Optional parameters for the queries as hashtables. Format: @{"param"="value"}  
        Required?                    false  
        Position?                    5  
        Default value                @()  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -IsolationLevel  
        Transaction isolation level. Defaults to ReadCommitted. Only used when creating  
        an internal transaction.  
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
    Executes SQLite database queries with support for parameters and transactions.  

### SYNTAX 
````PowerShell 
Invoke-SQLiteStudio [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]  
   Invoke-SQLiteStudio [-ConnectionString] <String> [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]  
   Invoke-SQLiteStudio [-DatabaseFilePath] <String> [-Queries] <String[]> [[-SqlParameters] <Hashtable[]>] [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Provides a PowerShell interface for executing SQLite queries with support for:  
    - Connection via connection string or database file path  
    - Parameterized queries to prevent SQL injection  
    - Transaction isolation level control  
    - Multiple query execution in a single transaction  
    - Pipeline input for queries and parameters  

### PARAMETERS 
    -ConnectionString <String>  
        The SQLite connection string for connecting to the database.  
        Format: "Data Source=mydb.sqlite"  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DatabaseFilePath <String>  
        The direct file system path to the SQLite database file.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Queries <String[]>  
        One or more SQL queries to execute. Can be provided via pipeline.  
        Each query can be parameterized using @parameter notation.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -SqlParameters <Hashtable[]>  
        Hashtable of parameters to use in queries. Format: @{"param" = "value"}  
        Multiple parameter sets can be provided for multiple queries.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -IsolationLevel  
        Controls the transaction isolation. Default is ReadCommitted.  
        Available levels: ReadUncommitted, ReadCommitted, RepeatableRead, Serializable  
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

   New-SQLiteDatabase                   --> nsqldb  
```` 

### SYNOPSIS 
    Creates a new SQLite database file.  

### SYNTAX 
````PowerShell 
New-SQLiteDatabase [-DatabaseFilePath] <String> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates a new SQLite database file at the specified path if it does not already  
    exist. The function ensures the target directory exists and creates a valid  
    SQLite database by establishing and closing a connection.  

### PARAMETERS 
    -DatabaseFilePath <String>  
        The full path where the SQLite database file should be created. If the directory  
        path does not exist, it will be created automatically.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
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
###	GenXdev.Data.SqlServer<hr/> 

##	Invoke-SqlServerQuery 
````PowerShell 

   Invoke-SqlServerQuery  
```` 

### SYNOPSIS 
    Executes SQL queries against a SQL Server database with transaction support.  

### SYNTAX 
````PowerShell 
Invoke-SqlServerQuery [-Queries] <String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]  
   Invoke-SqlServerQuery [-ConnectionString] <String> [-Queries] <String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]  
   Invoke-SqlServerQuery [-HostName] <String> [-Queries] <String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]  
   Invoke-SqlServerQuery [-HostName] <String> [-User] <String> [-Password] <String> [-Queries] <String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>]  
   Invoke-SqlServerQuery [-HostName] <String> [-Queries] <String[]> [-SqlParameters] <Hashtable[]> [-IsolationLevel {Chaos | ReadUncommitted | ReadCommitted | RepeatableRead | Serializable | Snapshot | Unspecified}] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Executes one or more SQL queries against a SQL Server database, supporting  
    parameters and configurable transaction isolation levels. All queries execute  
    within a single transaction that rolls back on error.  

### PARAMETERS 
    -ConnectionString <String>  
        The complete connection string for connecting to the SQL Server database.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HostName <String>  
        The SQL Server host name or IP address. Defaults to "." (local server).  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -User <String>  
        The username for SQL Server authentication.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Password <String>  
        The password for SQL Server authentication.  
        Required?                    true  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Queries <String[]>  
        One or more SQL queries to execute. Accepts pipeline input.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -SqlParameters <Hashtable[]>  
        Optional hashtable of parameters for the queries. Format: @{"param"="value"}.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -IsolationLevel  
        Transaction isolation level. Defaults to ReadCommitted.  
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
