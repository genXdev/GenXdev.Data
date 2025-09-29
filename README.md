<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Data
### SYNOPSIS
    A Windows PowerShell module for enhancing the commandline experience
[![GenXdev.Data](https://img.shields.io/powershellgallery/v/GenXdev.Data.svg?style=flat-square&label=GenXdev.Data)](https://www.powershellgallery.com/packages/GenXdev.Data/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Data?style=flat-square)](./LICENSE)

## MIT License

````text
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
```PowerShell
Install-Module "GenXdev.Data"
Import-Module "GenXdev.Data"
```
### UPDATE
```PowerShell
Update-Module
```

<br/><hr/><br/>

# Cmdlet Index
### GenXdev.Data.KeyValueStore
| Command | Aliases | Description |
| :--- | :--- | :--- |
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
| :--- | :--- | :--- |
| [Get-GenXdevPreference](#get-genxdevpreference) | getPreference | Retrieves a preference value from the GenXdev preferences store. |
| [Get-GenXdevPreferenceNames](#get-genxdevpreferencenames) | getPreferenceNames | Gets all preference names from session storage and database stores. |
| [Get-GenXdevPreferencesDatabasePath](#get-genxdevpreferencesdatabasepath) | &nbsp; | Gets the configured database path for preference data files used in GenXdev.Data operations. |
| [Remove-GenXdevPreference](#remove-genxdevpreference) | removePreference | Removes a preference value from the GenXdev preferences store. |
| [Set-GenXdevDefaultPreference](#set-genxdevdefaultpreference) | setPreferenceDefault | Sets a default preference value in the GenXdev preferences store. |
| [Set-GenXdevPreference](#set-genxdevpreference) | setPreference | Sets a preference value in the GenXdev preferences store. |
| [Set-GenXdevPreferencesDatabasePath](#set-genxdevpreferencesdatabasepath) | &nbsp; | Sets the database path for preferences used in GenXdev.Data operations. |

### GenXdev.Data.SQLite
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [EnsureSQLiteStudioInstalled](#ensuresqlitestudioinstalled) | &nbsp; | Ensures SQLiteStudio is installed and accessible from the command line. |
| [Get-SQLiteSchema](#get-sqliteschema) | &nbsp; | Retrieves the complete schema information from a SQLite database. |
| [Get-SQLiteTableColumnData](#get-sqlitetablecolumndata) | &nbsp; | Retrieves data from a specific column in a SQLite database table. |
| [Get-SQLiteTableData](#get-sqlitetabledata) | &nbsp; | Retrieves data from a SQLite database table with optional record limiting. |
| [Get-SQLiteTables](#get-sqlitetables) | &nbsp; | Retrieves a list of table names from a SQLite database. |
| [Get-SQLiteTableSchema](#get-sqlitetableschema) | &nbsp; | Retrieves the schema information for a specified SQLite table. |
| [Get-SQLiteTransaction](#get-sqlitetransaction) | &nbsp; | Creates and returns a SQLite transaction object for batch operations. |
| [Get-SQLiteViewColumnData](#get-sqliteviewcolumndata) | &nbsp; | Retrieves column data from a SQLite view with optional record limiting. |
| [Get-SQLiteViewData](#get-sqliteviewdata) | &nbsp; | Retrieves data from a SQLite database view with optional record limiting. |
| [Get-SQLiteViews](#get-sqliteviews) | &nbsp; | Retrieves a list of views from a SQLite database. |
| [Get-SQLiteViewSchema](#get-sqliteviewschema) | &nbsp; | Retrieves the SQL schema definition for a SQLite view. |
| [Invoke-SQLiteQuery](#invoke-sqlitequery) | &nbsp; | Executes one or more SQL queries against a SQLite database with transaction support. |
| [Invoke-SQLiteStudio](#invoke-sqlitestudio) | &nbsp; | Executes SQLite database queries with support for parameters and transactions. |
| [New-SQLiteDatabase](#new-sqlitedatabase) | &nbsp; | Creates a new SQLite database file. |

### GenXdev.Data.SqlServer
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [EnsureSSMSInstalled](#ensuressmsinstalled) | &nbsp; | Ensures SSMS is installed and accessible from the command line. |
| [Get-SQLServerSchema](#get-sqlserverschema) | &nbsp; | Retrieves the complete schema information from a SQL Server database. |
| [Get-SQLServerTableColumnData](#get-sqlservertablecolumndata) | &nbsp; | Retrieves data from a specific column in a SQL database table. |
| [Get-SQLServerTableData](#get-sqlservertabledata) | &nbsp; | Retrieves data from a SQL database table with optional record limiting. |
| [Get-SQLServerTables](#get-sqlservertables) | &nbsp; | Retrieves a list of table names from a SQL Server database. |
| [Get-SQLServerTableSchema](#get-sqlservertableschema) | &nbsp; | Retrieves the schema information for a specified SQL Server table. |
| [Get-SQLServerTransaction](#get-sqlservertransaction) | getsqltx, newsqltx | Creates and returns a SQL Server transaction object for batch operations. |
| [Get-SQLServerViewColumnData](#get-sqlserverviewcolumndata) | &nbsp; | Retrieves column data from a SQL view with optional record limiting. |
| [Get-SQLServerViewData](#get-sqlserverviewdata) | &nbsp; | Retrieves data from a SQL database view with optional record limiting. |
| [Get-SQLServerViews](#get-sqlserverviews) | &nbsp; | Retrieves a list of views from a SQL Server database. |
| [Get-SQLServerViewSchema](#get-sqlserverviewschema) | &nbsp; | Retrieves the SQL schema definition for a SQL Server view. |
| [Invoke-SqlServerQuery](#invoke-sqlserverquery) | &nbsp; | Executes one or more SQL queries against a SQL Server database with transaction support. |
| [Invoke-SSMS](#invoke-ssms) | sqlservermanagementstudio, ssms | Executes SQL Server database queries with support for parameters and transactions. |
| [New-SQLServerDatabase](#new-sqlserverdatabase) | nsqldb | Creates a new SQL Server database. |

<br/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/> 

##	Get-KeyValueStoreNames 
```PowerShell 

   Get-KeyValueStoreNames               --> getstorenames  
```` 

### SYNTAX 
```PowerShell 
Get-KeyValueStoreNames [[-SynchronizationKey] <string>]
    [-DatabasePath <string>] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope, defaults to all  
        Required?                    false  
        Position?                    0  
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

<br/><hr/><br/>
 

##	Get-StoreKeys 
```PowerShell 

   Get-StoreKeys                        --> getkeys  
```` 

### SYNTAX 
```PowerShell 
Get-StoreKeys [-StoreName] <string> [[-SynchronizationKey]
    <string>] [-DatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store whose keys should be retrieved  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope, defaults to all  
        Required?                    false  
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

<br/><hr/><br/>
 

##	Get-ValueByKeyFromStore 
```PowerShell 

   Get-ValueByKeyFromStore              --> getvalue  
```` 

### SYNTAX 
```PowerShell 
Get-ValueByKeyFromStore [-StoreName] <string> [-KeyName]
    <string> [[-DefaultValue] <string>]
    [[-SynchronizationKey] <string>] [-DatabasePath
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        A optional default value  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Key to retrieve from the specified store  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store to retrieve the key from  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Initialize-KeyValueStores 
```PowerShell 

   Initialize-KeyValueStores  
```` 

### SYNTAX 
```PowerShell 
Initialize-KeyValueStores [[-DatabasePath] <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-KeyFromStore 
```PowerShell 

   Remove-KeyFromStore                  --> removekey  
```` 

### SYNTAX 
```PowerShell 
Remove-KeyFromStore [-StoreName] <string> [-KeyName]
    <string> [[-SynchronizationKey] <string>] [-SessionOnly]
    [-ClearSession] [-DatabasePath <string>] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Key to be deleted  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-KeyValueStore 
```PowerShell 

   Remove-KeyValueStore  
```` 

### SYNTAX 
```PowerShell 
Remove-KeyValueStore [-StoreName] <string>
    [[-SynchronizationKey] <string>] [-DatabasePath
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store to delete  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-ValueByKeyInStore 
```PowerShell 

   Set-ValueByKeyInStore                --> setvalue  
```` 

### SYNTAX 
```PowerShell 
Set-ValueByKeyInStore [-StoreName] <string> [-KeyName]
    <string> [[-Value] <string>] [[-SynchronizationKey]
    <string>] [-DatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Name of the key to set or update  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Store name for the key-value pair  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        Value to be stored  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Sync-KeyValueStore 
```PowerShell 

   Sync-KeyValueStore  
```` 

### SYNTAX 
```PowerShell 
Sync-KeyValueStore [[-SynchronizationKey] <string>]
    [-DatabasePath <string>] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    0  
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

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/> 

##	Get-GenXdevPreference 
```PowerShell 

   Get-GenXdevPreference                --> getPreference  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreference [-Name] <string> [[-DefaultValue]
    <string>] [-PreferencesDatabasePath <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to retrieve  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXdevPreferenceNames 
```PowerShell 

   Get-GenXdevPreferenceNames           --> getPreferenceNames  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreferenceNames [[-PreferencesDatabasePath]
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXdevPreferencesDatabasePath 
```PowerShell 

   Get-GenXdevPreferencesDatabasePath  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreferencesDatabasePath
    [[-PreferencesDatabasePath] <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-GenXdevPreference 
```PowerShell 

   Remove-GenXdevPreference             --> removePreference  
```` 

### SYNTAX 
```PowerShell 
Remove-GenXdevPreference [-Name] <string> [[-RemoveDefault]]
    [-PreferencesDatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to remove  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RemoveDefault  
        Switch to also remove the preference from defaults  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           All  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevDefaultPreference 
```PowerShell 

   Set-GenXdevDefaultPreference         --> setPreferenceDefault  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevDefaultPreference [-Name] <string> [[-Value]
    <string>] [[-PreferencesDatabasePath] <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to set in defaults  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        The value to store for the preference  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceValue  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevPreference 
```PowerShell 

   Set-GenXdevPreference                --> setPreference  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevPreference [-Name] <string> [[-Value] <string>]
    [-SessionOnly] [-ClearSession] [-PreferencesDatabasePath
    <string>] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to set  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        The value to store for the preference  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceValue  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevPreferencesDatabasePath 
```PowerShell 

   Set-GenXdevPreferencesDatabasePath  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevPreferencesDatabasePath
    [[-PreferencesDatabasePath] <string>] [-SkipSession]
    [-SessionOnly] [-ClearSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SQLite<hr/> 

##	EnsureSQLiteStudioInstalled 
```PowerShell 

   EnsureSQLiteStudioInstalled  
```` 

### SYNTAX 
```PowerShell 
EnsureSQLiteStudioInstalled [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLiteSchema 
```PowerShell 

   Get-SQLiteSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteSchema [<CommonParameters>]
Get-SQLiteSchema [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteSchema [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteTableColumnData 
```PowerShell 

   Get-SQLiteTableColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableColumnData [-TableName] <string>
    [-ColumnName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableColumnData [-ConnectionString] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>]
Get-SQLiteTableColumnData [-DatabaseFilePath] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column to retrieve  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQLite database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. Default 100. Use -1 for all  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseFilePath  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query  
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

<br/><hr/><br/>
 

##	Get-SQLiteTableData 
```PowerShell 

   Get-SQLiteTableData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableData [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableData [-ConnectionString] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableData [-DatabaseFilePath] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>] 
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
        The maximum number of records to return. -1 for all.  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query data from.  
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

<br/><hr/><br/>
 

##	Get-SQLiteTables 
```PowerShell 

   Get-SQLiteTables  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTables [<CommonParameters>]
Get-SQLiteTables [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteTables [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteTableSchema 
```PowerShell 

   Get-SQLiteTableSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableSchema [-TableName] <string>
    [<CommonParameters>]
Get-SQLiteTableSchema [-ConnectionString] <string>
    [-TableName] <string> [<CommonParameters>]
Get-SQLiteTableSchema [-DatabaseFilePath] <string>
    [-TableName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQLite database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseFilePath  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table  
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

<br/><hr/><br/>
 

##	Get-SQLiteTransaction 
```PowerShell 

   Get-SQLiteTransaction  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTransaction [-DatabaseFilePath] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-CreateDatabaseIfNotExists <bool>] [<CommonParameters>]
Get-SQLiteTransaction [-ConnectionString] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-CreateDatabaseIfNotExists <bool>] [<CommonParameters>] 
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
    -CreateDatabaseIfNotExists <bool>  
        Whether to create the database file if it does not exist.  
        Required?                    false  
        Position?                    Named  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        Transaction isolation level.  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Get-SQLiteViewColumnData 
```PowerShell 

   Get-SQLiteViewColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewColumnData [-ViewName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLiteViewColumnData [-ConnectionString] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>]
Get-SQLiteViewColumnData [-DatabaseFilePath] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
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
        The number of records to return. Default is 100. -1 for all.  
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
        Aliases                      dbpath, indexpath  
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

<br/><hr/><br/>
 

##	Get-SQLiteViewData 
```PowerShell 

   Get-SQLiteViewData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewData [-DatabaseFilePath] <string> [-ViewName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLiteViewData [-ConnectionString] <string> [-ViewName]
    <string> [[-Count] <int>] [<CommonParameters>] 
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
        Number of records to return. -1 for all records.  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view to query.  
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

<br/><hr/><br/>
 

##	Get-SQLiteViews 
```PowerShell 

   Get-SQLiteViews  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViews [<CommonParameters>]
Get-SQLiteViews [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteViews [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteViewSchema 
```PowerShell 

   Get-SQLiteViewSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewSchema [-ViewName] <string>
    [<CommonParameters>]
Get-SQLiteViewSchema [-ConnectionString] <string>
    [-ViewName] <string> [<CommonParameters>]
Get-SQLiteViewSchema [-DatabaseFilePath] <string>
    [-ViewName] <string> [<CommonParameters>] 
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
        Aliases                      dbpath, indexpath  
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

<br/><hr/><br/>
 

##	Invoke-SQLiteQuery 
```PowerShell 

   Invoke-SQLiteQuery  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteQuery [[-ConnectionString] <string>]
    [[-DatabaseFilePath] <string>] [[-Transaction] <Object>]
    [-Queries] <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQLite database.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Transaction <Object>  
        An existing SQLite transaction to use for the queries.  
        Required?                    false  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Invoke-SQLiteStudio 
```PowerShell 

   Invoke-SQLiteStudio  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteStudio [-Queries] <string[]> [[-SqlParameters]
    <hashtable[]>] [-IsolationLevel {ReadCommitted |
    ReadUncommitted | RepeatableRead | Serializable |
    Snapshot | Chaos}] [<CommonParameters>]
Invoke-SQLiteStudio [-ConnectionString] <string> [-Queries]
    <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>]
Invoke-SQLiteStudio [-DatabaseFilePath] <string> [-Queries]
    <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. Default is ReadCommitted.  
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
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Optional parameters for the query.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      parameters  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-SQLiteDatabase 
```PowerShell 

   New-SQLiteDatabase  
```` 

### SYNTAX 
```PowerShell 
New-SQLiteDatabase [-DatabaseFilePath] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/> 

##	EnsureSSMSInstalled 
```PowerShell 

   EnsureSSMSInstalled  
```` 

### SYNTAX 
```PowerShell 
EnsureSSMSInstalled [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerSchema 
```PowerShell 

   Get-SQLServerSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerSchema [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerSchema [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerTableColumnData 
```PowerShell 

   Get-SQLServerTableColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableColumnData [-DatabaseName] <string>
    [[-Server] <string>] [-TableName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLServerTableColumnData [-ConnectionString] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column to retrieve  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. Default 100. Use -1 for all  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTableData 
```PowerShell 

   Get-SQLServerTableData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableData [-DatabaseName] <string> [[-Server]
    <string>] [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLServerTableData [-ConnectionString] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        The maximum number of records to return. -1 for all.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query data from.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTables 
```PowerShell 

   Get-SQLServerTables  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTables [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerTables [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerTableSchema 
```PowerShell 

   Get-SQLServerTableSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableSchema [-DatabaseName] <string> [[-Server]
    <string>] [-TableName] <string> [<CommonParameters>]
Get-SQLServerTableSchema [-ConnectionString] <string>
    [-TableName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTransaction 
```PowerShell 

   Get-SQLServerTransaction             --> getsqltx, newsqltx  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTransaction [-DatabaseName] <string> [[-Server]
    <string>] [-IsolationLevel {ReadCommitted |
    ReadUncommitted | RepeatableRead | Serializable |
    Snapshot | Chaos}] [<CommonParameters>]
Get-SQLServerTransaction [-ConnectionString] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        Transaction isolation level.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerViewColumnData 
```PowerShell 

   Get-SQLServerViewColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewColumnData [-DatabaseName] <string>
    [[-Server] <string>] [-ViewName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLServerViewColumnData [-ConnectionString] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        The number of records to return. Default is 100. -1 for all.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerViewData 
```PowerShell 

   Get-SQLServerViewData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewData [-DatabaseName] <string> [[-Server]
    <string>] [-ViewName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLServerViewData [-ConnectionString] <string>
    [-ViewName] <string> [[-Count] <int>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. -1 for all records.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view to query.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerViews 
```PowerShell 

   Get-SQLServerViews  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViews [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerViews [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerViewSchema 
```PowerShell 

   Get-SQLServerViewSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewSchema [-DatabaseName] <string> [[-Server]
    <string>] [-ViewName] <string> [<CommonParameters>]
Get-SQLServerViewSchema [-ConnectionString] <string>
    [-ViewName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Invoke-SqlServerQuery 
```PowerShell 

   Invoke-SQLServerQuery  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLServerQuery [[-Queries] <string[]>]
    [[-DatabaseName] <string>] [[-Server] <string>]
    [[-Transaction] <Object>] [[-ConnectionString] <string>]
    [[-SqlParameters] <hashtable[]>] [-IsolationLevel
    {ReadCommitted | ReadUncommitted | RepeatableRead |
    Serializable | Snapshot | Chaos}] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL database.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Transaction <Object>  
        An existing SQL Server transaction to use for the queries.  
        Required?                    false  
        Position?                    3  
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

<br/><hr/><br/>
 

##	Invoke-SSMS 
```PowerShell 

   Invoke-SSMS                          --> sqlservermanagementstudio, ssms  
```` 

### SYNTAX 
```PowerShell 
Invoke-SSMS [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-SQLServerDatabase 
```PowerShell 

   New-SQLServerDatabase                --> nsqldb  
```` 

### SYNTAX 
```PowerShell 
New-SQLServerDatabase [-DatabaseName] <string> [[-Server]
    <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
New-SQLServerDatabase [-ConnectionString] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to connect to SQL Server  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database to create  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/> 

##	Get-KeyValueStoreNames 
```PowerShell 

   Get-KeyValueStoreNames               --> getstorenames  
```` 

### SYNTAX 
```PowerShell 
Get-KeyValueStoreNames [[-SynchronizationKey] <string>]
    [-DatabasePath <string>] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope, defaults to all  
        Required?                    false  
        Position?                    0  
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

<br/><hr/><br/>
 

##	Get-StoreKeys 
```PowerShell 

   Get-StoreKeys                        --> getkeys  
```` 

### SYNTAX 
```PowerShell 
Get-StoreKeys [-StoreName] <string> [[-SynchronizationKey]
    <string>] [-DatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store whose keys should be retrieved  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope, defaults to all  
        Required?                    false  
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

<br/><hr/><br/>
 

##	Get-ValueByKeyFromStore 
```PowerShell 

   Get-ValueByKeyFromStore              --> getvalue  
```` 

### SYNTAX 
```PowerShell 
Get-ValueByKeyFromStore [-StoreName] <string> [-KeyName]
    <string> [[-DefaultValue] <string>]
    [[-SynchronizationKey] <string>] [-DatabasePath
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        A optional default value  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Key to retrieve from the specified store  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store to retrieve the key from  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Initialize-KeyValueStores 
```PowerShell 

   Initialize-KeyValueStores  
```` 

### SYNTAX 
```PowerShell 
Initialize-KeyValueStores [[-DatabasePath] <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-KeyFromStore 
```PowerShell 

   Remove-KeyFromStore                  --> removekey  
```` 

### SYNTAX 
```PowerShell 
Remove-KeyFromStore [-StoreName] <string> [-KeyName]
    <string> [[-SynchronizationKey] <string>] [-SessionOnly]
    [-ClearSession] [-DatabasePath <string>] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Key to be deleted  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-KeyValueStore 
```PowerShell 

   Remove-KeyValueStore  
```` 

### SYNTAX 
```PowerShell 
Remove-KeyValueStore [-StoreName] <string>
    [[-SynchronizationKey] <string>] [-DatabasePath
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store to delete  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-ValueByKeyInStore 
```PowerShell 

   Set-ValueByKeyInStore                --> setvalue  
```` 

### SYNTAX 
```PowerShell 
Set-ValueByKeyInStore [-StoreName] <string> [-KeyName]
    <string> [[-Value] <string>] [[-SynchronizationKey]
    <string>] [-DatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Name of the key to set or update  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Store name for the key-value pair  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        Value to be stored  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Sync-KeyValueStore 
```PowerShell 

   Sync-KeyValueStore  
```` 

### SYNTAX 
```PowerShell 
Sync-KeyValueStore [[-SynchronizationKey] <string>]
    [-DatabasePath <string>] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    0  
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

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/> 

##	Get-GenXdevPreference 
```PowerShell 

   Get-GenXdevPreference                --> getPreference  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreference [-Name] <string> [[-DefaultValue]
    <string>] [-PreferencesDatabasePath <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to retrieve  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXdevPreferenceNames 
```PowerShell 

   Get-GenXdevPreferenceNames           --> getPreferenceNames  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreferenceNames [[-PreferencesDatabasePath]
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXdevPreferencesDatabasePath 
```PowerShell 

   Get-GenXdevPreferencesDatabasePath  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreferencesDatabasePath
    [[-PreferencesDatabasePath] <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-GenXdevPreference 
```PowerShell 

   Remove-GenXdevPreference             --> removePreference  
```` 

### SYNTAX 
```PowerShell 
Remove-GenXdevPreference [-Name] <string> [[-RemoveDefault]]
    [-PreferencesDatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to remove  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RemoveDefault  
        Switch to also remove the preference from defaults  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           All  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevDefaultPreference 
```PowerShell 

   Set-GenXdevDefaultPreference         --> setPreferenceDefault  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevDefaultPreference [-Name] <string> [[-Value]
    <string>] [[-PreferencesDatabasePath] <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to set in defaults  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        The value to store for the preference  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceValue  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevPreference 
```PowerShell 

   Set-GenXdevPreference                --> setPreference  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevPreference [-Name] <string> [[-Value] <string>]
    [-SessionOnly] [-ClearSession] [-PreferencesDatabasePath
    <string>] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to set  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        The value to store for the preference  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceValue  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevPreferencesDatabasePath 
```PowerShell 

   Set-GenXdevPreferencesDatabasePath  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevPreferencesDatabasePath
    [[-PreferencesDatabasePath] <string>] [-SkipSession]
    [-SessionOnly] [-ClearSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SQLite<hr/> 

##	EnsureSQLiteStudioInstalled 
```PowerShell 

   EnsureSQLiteStudioInstalled  
```` 

### SYNTAX 
```PowerShell 
EnsureSQLiteStudioInstalled [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLiteSchema 
```PowerShell 

   Get-SQLiteSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteSchema [<CommonParameters>]
Get-SQLiteSchema [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteSchema [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteTableColumnData 
```PowerShell 

   Get-SQLiteTableColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableColumnData [-TableName] <string>
    [-ColumnName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableColumnData [-ConnectionString] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>]
Get-SQLiteTableColumnData [-DatabaseFilePath] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column to retrieve  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQLite database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. Default 100. Use -1 for all  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseFilePath  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query  
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

<br/><hr/><br/>
 

##	Get-SQLiteTableData 
```PowerShell 

   Get-SQLiteTableData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableData [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableData [-ConnectionString] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableData [-DatabaseFilePath] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>] 
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
        The maximum number of records to return. -1 for all.  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query data from.  
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

<br/><hr/><br/>
 

##	Get-SQLiteTables 
```PowerShell 

   Get-SQLiteTables  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTables [<CommonParameters>]
Get-SQLiteTables [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteTables [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteTableSchema 
```PowerShell 

   Get-SQLiteTableSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableSchema [-TableName] <string>
    [<CommonParameters>]
Get-SQLiteTableSchema [-ConnectionString] <string>
    [-TableName] <string> [<CommonParameters>]
Get-SQLiteTableSchema [-DatabaseFilePath] <string>
    [-TableName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQLite database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseFilePath  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table  
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

<br/><hr/><br/>
 

##	Get-SQLiteTransaction 
```PowerShell 

   Get-SQLiteTransaction  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTransaction [-DatabaseFilePath] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-CreateDatabaseIfNotExists <bool>] [<CommonParameters>]
Get-SQLiteTransaction [-ConnectionString] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-CreateDatabaseIfNotExists <bool>] [<CommonParameters>] 
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
    -CreateDatabaseIfNotExists <bool>  
        Whether to create the database file if it does not exist.  
        Required?                    false  
        Position?                    Named  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        Transaction isolation level.  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Get-SQLiteViewColumnData 
```PowerShell 

   Get-SQLiteViewColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewColumnData [-ViewName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLiteViewColumnData [-ConnectionString] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>]
Get-SQLiteViewColumnData [-DatabaseFilePath] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
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
        The number of records to return. Default is 100. -1 for all.  
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
        Aliases                      dbpath, indexpath  
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

<br/><hr/><br/>
 

##	Get-SQLiteViewData 
```PowerShell 

   Get-SQLiteViewData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewData [-DatabaseFilePath] <string> [-ViewName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLiteViewData [-ConnectionString] <string> [-ViewName]
    <string> [[-Count] <int>] [<CommonParameters>] 
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
        Number of records to return. -1 for all records.  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view to query.  
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

<br/><hr/><br/>
 

##	Get-SQLiteViews 
```PowerShell 

   Get-SQLiteViews  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViews [<CommonParameters>]
Get-SQLiteViews [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteViews [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteViewSchema 
```PowerShell 

   Get-SQLiteViewSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewSchema [-ViewName] <string>
    [<CommonParameters>]
Get-SQLiteViewSchema [-ConnectionString] <string>
    [-ViewName] <string> [<CommonParameters>]
Get-SQLiteViewSchema [-DatabaseFilePath] <string>
    [-ViewName] <string> [<CommonParameters>] 
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
        Aliases                      dbpath, indexpath  
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

<br/><hr/><br/>
 

##	Invoke-SQLiteQuery 
```PowerShell 

   Invoke-SQLiteQuery  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteQuery [[-ConnectionString] <string>]
    [[-DatabaseFilePath] <string>] [[-Transaction] <Object>]
    [-Queries] <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQLite database.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Transaction <Object>  
        An existing SQLite transaction to use for the queries.  
        Required?                    false  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Invoke-SQLiteStudio 
```PowerShell 

   Invoke-SQLiteStudio  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteStudio [-Queries] <string[]> [[-SqlParameters]
    <hashtable[]>] [-IsolationLevel {ReadCommitted |
    ReadUncommitted | RepeatableRead | Serializable |
    Snapshot | Chaos}] [<CommonParameters>]
Invoke-SQLiteStudio [-ConnectionString] <string> [-Queries]
    <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>]
Invoke-SQLiteStudio [-DatabaseFilePath] <string> [-Queries]
    <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. Default is ReadCommitted.  
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
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Optional parameters for the query.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      parameters  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-SQLiteDatabase 
```PowerShell 

   New-SQLiteDatabase  
```` 

### SYNTAX 
```PowerShell 
New-SQLiteDatabase [-DatabaseFilePath] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/> 

##	EnsureSSMSInstalled 
```PowerShell 

   EnsureSSMSInstalled  
```` 

### SYNTAX 
```PowerShell 
EnsureSSMSInstalled [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerSchema 
```PowerShell 

   Get-SQLServerSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerSchema [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerSchema [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerTableColumnData 
```PowerShell 

   Get-SQLServerTableColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableColumnData [-DatabaseName] <string>
    [[-Server] <string>] [-TableName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLServerTableColumnData [-ConnectionString] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column to retrieve  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. Default 100. Use -1 for all  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTableData 
```PowerShell 

   Get-SQLServerTableData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableData [-DatabaseName] <string> [[-Server]
    <string>] [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLServerTableData [-ConnectionString] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        The maximum number of records to return. -1 for all.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query data from.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTables 
```PowerShell 

   Get-SQLServerTables  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTables [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerTables [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerTableSchema 
```PowerShell 

   Get-SQLServerTableSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableSchema [-DatabaseName] <string> [[-Server]
    <string>] [-TableName] <string> [<CommonParameters>]
Get-SQLServerTableSchema [-ConnectionString] <string>
    [-TableName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTransaction 
```PowerShell 

   Get-SQLServerTransaction             --> getsqltx, newsqltx  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTransaction [-DatabaseName] <string> [[-Server]
    <string>] [-IsolationLevel {ReadCommitted |
    ReadUncommitted | RepeatableRead | Serializable |
    Snapshot | Chaos}] [<CommonParameters>]
Get-SQLServerTransaction [-ConnectionString] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        Transaction isolation level.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerViewColumnData 
```PowerShell 

   Get-SQLServerViewColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewColumnData [-DatabaseName] <string>
    [[-Server] <string>] [-ViewName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLServerViewColumnData [-ConnectionString] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        The number of records to return. Default is 100. -1 for all.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerViewData 
```PowerShell 

   Get-SQLServerViewData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewData [-DatabaseName] <string> [[-Server]
    <string>] [-ViewName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLServerViewData [-ConnectionString] <string>
    [-ViewName] <string> [[-Count] <int>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. -1 for all records.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view to query.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerViews 
```PowerShell 

   Get-SQLServerViews  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViews [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerViews [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerViewSchema 
```PowerShell 

   Get-SQLServerViewSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewSchema [-DatabaseName] <string> [[-Server]
    <string>] [-ViewName] <string> [<CommonParameters>]
Get-SQLServerViewSchema [-ConnectionString] <string>
    [-ViewName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Invoke-SqlServerQuery 
```PowerShell 

   Invoke-SQLServerQuery  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLServerQuery [[-Queries] <string[]>]
    [[-DatabaseName] <string>] [[-Server] <string>]
    [[-Transaction] <Object>] [[-ConnectionString] <string>]
    [[-SqlParameters] <hashtable[]>] [-IsolationLevel
    {ReadCommitted | ReadUncommitted | RepeatableRead |
    Serializable | Snapshot | Chaos}] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL database.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Transaction <Object>  
        An existing SQL Server transaction to use for the queries.  
        Required?                    false  
        Position?                    3  
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

<br/><hr/><br/>
 

##	Invoke-SSMS 
```PowerShell 

   Invoke-SSMS                          --> sqlservermanagementstudio, ssms  
```` 

### SYNTAX 
```PowerShell 
Invoke-SSMS [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-SQLServerDatabase 
```PowerShell 

   New-SQLServerDatabase                --> nsqldb  
```` 

### SYNTAX 
```PowerShell 
New-SQLServerDatabase [-DatabaseName] <string> [[-Server]
    <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
New-SQLServerDatabase [-ConnectionString] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to connect to SQL Server  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database to create  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/> 

##	Get-KeyValueStoreNames 
```PowerShell 

   Get-KeyValueStoreNames               --> getstorenames  
```` 

### SYNTAX 
```PowerShell 
Get-KeyValueStoreNames [[-SynchronizationKey] <string>]
    [-DatabasePath <string>] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope, defaults to all  
        Required?                    false  
        Position?                    0  
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

<br/><hr/><br/>
 

##	Get-StoreKeys 
```PowerShell 

   Get-StoreKeys                        --> getkeys  
```` 

### SYNTAX 
```PowerShell 
Get-StoreKeys [-StoreName] <string> [[-SynchronizationKey]
    <string>] [-DatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store whose keys should be retrieved  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope, defaults to all  
        Required?                    false  
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

<br/><hr/><br/>
 

##	Get-ValueByKeyFromStore 
```PowerShell 

   Get-ValueByKeyFromStore              --> getvalue  
```` 

### SYNTAX 
```PowerShell 
Get-ValueByKeyFromStore [-StoreName] <string> [-KeyName]
    <string> [[-DefaultValue] <string>]
    [[-SynchronizationKey] <string>] [-DatabasePath
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        A optional default value  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Key to retrieve from the specified store  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store to retrieve the key from  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Initialize-KeyValueStores 
```PowerShell 

   Initialize-KeyValueStores  
```` 

### SYNTAX 
```PowerShell 
Initialize-KeyValueStores [[-DatabasePath] <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-KeyFromStore 
```PowerShell 

   Remove-KeyFromStore                  --> removekey  
```` 

### SYNTAX 
```PowerShell 
Remove-KeyFromStore [-StoreName] <string> [-KeyName]
    <string> [[-SynchronizationKey] <string>] [-SessionOnly]
    [-ClearSession] [-DatabasePath <string>] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Key to be deleted  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-KeyValueStore 
```PowerShell 

   Remove-KeyValueStore  
```` 

### SYNTAX 
```PowerShell 
Remove-KeyValueStore [-StoreName] <string>
    [[-SynchronizationKey] <string>] [-DatabasePath
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store to delete  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-ValueByKeyInStore 
```PowerShell 

   Set-ValueByKeyInStore                --> setvalue  
```` 

### SYNTAX 
```PowerShell 
Set-ValueByKeyInStore [-StoreName] <string> [-KeyName]
    <string> [[-Value] <string>] [[-SynchronizationKey]
    <string>] [-DatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Name of the key to set or update  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Store name for the key-value pair  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        Value to be stored  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Sync-KeyValueStore 
```PowerShell 

   Sync-KeyValueStore  
```` 

### SYNTAX 
```PowerShell 
Sync-KeyValueStore [[-SynchronizationKey] <string>]
    [-DatabasePath <string>] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    0  
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

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/> 

##	Get-GenXdevPreference 
```PowerShell 

   Get-GenXdevPreference                --> getPreference  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreference [-Name] <string> [[-DefaultValue]
    <string>] [-PreferencesDatabasePath <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to retrieve  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXdevPreferenceNames 
```PowerShell 

   Get-GenXdevPreferenceNames           --> getPreferenceNames  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreferenceNames [[-PreferencesDatabasePath]
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXdevPreferencesDatabasePath 
```PowerShell 

   Get-GenXdevPreferencesDatabasePath  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreferencesDatabasePath
    [[-PreferencesDatabasePath] <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-GenXdevPreference 
```PowerShell 

   Remove-GenXdevPreference             --> removePreference  
```` 

### SYNTAX 
```PowerShell 
Remove-GenXdevPreference [-Name] <string> [[-RemoveDefault]]
    [-PreferencesDatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to remove  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RemoveDefault  
        Switch to also remove the preference from defaults  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           All  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevDefaultPreference 
```PowerShell 

   Set-GenXdevDefaultPreference         --> setPreferenceDefault  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevDefaultPreference [-Name] <string> [[-Value]
    <string>] [[-PreferencesDatabasePath] <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to set in defaults  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        The value to store for the preference  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceValue  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevPreference 
```PowerShell 

   Set-GenXdevPreference                --> setPreference  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevPreference [-Name] <string> [[-Value] <string>]
    [-SessionOnly] [-ClearSession] [-PreferencesDatabasePath
    <string>] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to set  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        The value to store for the preference  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceValue  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevPreferencesDatabasePath 
```PowerShell 

   Set-GenXdevPreferencesDatabasePath  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevPreferencesDatabasePath
    [[-PreferencesDatabasePath] <string>] [-SkipSession]
    [-SessionOnly] [-ClearSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SQLite<hr/> 

##	EnsureSQLiteStudioInstalled 
```PowerShell 

   EnsureSQLiteStudioInstalled  
```` 

### SYNTAX 
```PowerShell 
EnsureSQLiteStudioInstalled [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLiteSchema 
```PowerShell 

   Get-SQLiteSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteSchema [<CommonParameters>]
Get-SQLiteSchema [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteSchema [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteTableColumnData 
```PowerShell 

   Get-SQLiteTableColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableColumnData [-TableName] <string>
    [-ColumnName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableColumnData [-ConnectionString] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>]
Get-SQLiteTableColumnData [-DatabaseFilePath] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column to retrieve  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQLite database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. Default 100. Use -1 for all  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseFilePath  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query  
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

<br/><hr/><br/>
 

##	Get-SQLiteTableData 
```PowerShell 

   Get-SQLiteTableData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableData [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableData [-ConnectionString] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableData [-DatabaseFilePath] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>] 
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
        The maximum number of records to return. -1 for all.  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query data from.  
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

<br/><hr/><br/>
 

##	Get-SQLiteTables 
```PowerShell 

   Get-SQLiteTables  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTables [<CommonParameters>]
Get-SQLiteTables [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteTables [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteTableSchema 
```PowerShell 

   Get-SQLiteTableSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableSchema [-TableName] <string>
    [<CommonParameters>]
Get-SQLiteTableSchema [-ConnectionString] <string>
    [-TableName] <string> [<CommonParameters>]
Get-SQLiteTableSchema [-DatabaseFilePath] <string>
    [-TableName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQLite database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseFilePath  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table  
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

<br/><hr/><br/>
 

##	Get-SQLiteTransaction 
```PowerShell 

   Get-SQLiteTransaction  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTransaction [-DatabaseFilePath] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-CreateDatabaseIfNotExists <bool>] [<CommonParameters>]
Get-SQLiteTransaction [-ConnectionString] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-CreateDatabaseIfNotExists <bool>] [<CommonParameters>] 
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
    -CreateDatabaseIfNotExists <bool>  
        Whether to create the database file if it does not exist.  
        Required?                    false  
        Position?                    Named  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        Transaction isolation level.  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Get-SQLiteViewColumnData 
```PowerShell 

   Get-SQLiteViewColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewColumnData [-ViewName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLiteViewColumnData [-ConnectionString] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>]
Get-SQLiteViewColumnData [-DatabaseFilePath] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
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
        The number of records to return. Default is 100. -1 for all.  
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
        Aliases                      dbpath, indexpath  
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

<br/><hr/><br/>
 

##	Get-SQLiteViewData 
```PowerShell 

   Get-SQLiteViewData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewData [-DatabaseFilePath] <string> [-ViewName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLiteViewData [-ConnectionString] <string> [-ViewName]
    <string> [[-Count] <int>] [<CommonParameters>] 
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
        Number of records to return. -1 for all records.  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view to query.  
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

<br/><hr/><br/>
 

##	Get-SQLiteViews 
```PowerShell 

   Get-SQLiteViews  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViews [<CommonParameters>]
Get-SQLiteViews [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteViews [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteViewSchema 
```PowerShell 

   Get-SQLiteViewSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewSchema [-ViewName] <string>
    [<CommonParameters>]
Get-SQLiteViewSchema [-ConnectionString] <string>
    [-ViewName] <string> [<CommonParameters>]
Get-SQLiteViewSchema [-DatabaseFilePath] <string>
    [-ViewName] <string> [<CommonParameters>] 
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
        Aliases                      dbpath, indexpath  
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

<br/><hr/><br/>
 

##	Invoke-SQLiteQuery 
```PowerShell 

   Invoke-SQLiteQuery  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteQuery [[-ConnectionString] <string>]
    [[-DatabaseFilePath] <string>] [[-Transaction] <Object>]
    [-Queries] <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQLite database.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Transaction <Object>  
        An existing SQLite transaction to use for the queries.  
        Required?                    false  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Invoke-SQLiteStudio 
```PowerShell 

   Invoke-SQLiteStudio  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteStudio [-Queries] <string[]> [[-SqlParameters]
    <hashtable[]>] [-IsolationLevel {ReadCommitted |
    ReadUncommitted | RepeatableRead | Serializable |
    Snapshot | Chaos}] [<CommonParameters>]
Invoke-SQLiteStudio [-ConnectionString] <string> [-Queries]
    <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>]
Invoke-SQLiteStudio [-DatabaseFilePath] <string> [-Queries]
    <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. Default is ReadCommitted.  
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
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Optional parameters for the query.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      parameters  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-SQLiteDatabase 
```PowerShell 

   New-SQLiteDatabase  
```` 

### SYNTAX 
```PowerShell 
New-SQLiteDatabase [-DatabaseFilePath] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/> 

##	EnsureSSMSInstalled 
```PowerShell 

   EnsureSSMSInstalled  
```` 

### SYNTAX 
```PowerShell 
EnsureSSMSInstalled [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerSchema 
```PowerShell 

   Get-SQLServerSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerSchema [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerSchema [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerTableColumnData 
```PowerShell 

   Get-SQLServerTableColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableColumnData [-DatabaseName] <string>
    [[-Server] <string>] [-TableName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLServerTableColumnData [-ConnectionString] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column to retrieve  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. Default 100. Use -1 for all  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTableData 
```PowerShell 

   Get-SQLServerTableData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableData [-DatabaseName] <string> [[-Server]
    <string>] [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLServerTableData [-ConnectionString] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        The maximum number of records to return. -1 for all.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query data from.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTables 
```PowerShell 

   Get-SQLServerTables  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTables [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerTables [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerTableSchema 
```PowerShell 

   Get-SQLServerTableSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableSchema [-DatabaseName] <string> [[-Server]
    <string>] [-TableName] <string> [<CommonParameters>]
Get-SQLServerTableSchema [-ConnectionString] <string>
    [-TableName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTransaction 
```PowerShell 

   Get-SQLServerTransaction             --> getsqltx, newsqltx  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTransaction [-DatabaseName] <string> [[-Server]
    <string>] [-IsolationLevel {ReadCommitted |
    ReadUncommitted | RepeatableRead | Serializable |
    Snapshot | Chaos}] [<CommonParameters>]
Get-SQLServerTransaction [-ConnectionString] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        Transaction isolation level.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerViewColumnData 
```PowerShell 

   Get-SQLServerViewColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewColumnData [-DatabaseName] <string>
    [[-Server] <string>] [-ViewName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLServerViewColumnData [-ConnectionString] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        The number of records to return. Default is 100. -1 for all.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerViewData 
```PowerShell 

   Get-SQLServerViewData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewData [-DatabaseName] <string> [[-Server]
    <string>] [-ViewName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLServerViewData [-ConnectionString] <string>
    [-ViewName] <string> [[-Count] <int>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. -1 for all records.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view to query.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerViews 
```PowerShell 

   Get-SQLServerViews  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViews [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerViews [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerViewSchema 
```PowerShell 

   Get-SQLServerViewSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewSchema [-DatabaseName] <string> [[-Server]
    <string>] [-ViewName] <string> [<CommonParameters>]
Get-SQLServerViewSchema [-ConnectionString] <string>
    [-ViewName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Invoke-SqlServerQuery 
```PowerShell 

   Invoke-SQLServerQuery  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLServerQuery [[-Queries] <string[]>]
    [[-DatabaseName] <string>] [[-Server] <string>]
    [[-Transaction] <Object>] [[-ConnectionString] <string>]
    [[-SqlParameters] <hashtable[]>] [-IsolationLevel
    {ReadCommitted | ReadUncommitted | RepeatableRead |
    Serializable | Snapshot | Chaos}] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL database.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Transaction <Object>  
        An existing SQL Server transaction to use for the queries.  
        Required?                    false  
        Position?                    3  
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

<br/><hr/><br/>
 

##	Invoke-SSMS 
```PowerShell 

   Invoke-SSMS                          --> sqlservermanagementstudio, ssms  
```` 

### SYNTAX 
```PowerShell 
Invoke-SSMS [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-SQLServerDatabase 
```PowerShell 

   New-SQLServerDatabase                --> nsqldb  
```` 

### SYNTAX 
```PowerShell 
New-SQLServerDatabase [-DatabaseName] <string> [[-Server]
    <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
New-SQLServerDatabase [-ConnectionString] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to connect to SQL Server  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database to create  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/> 

##	Get-KeyValueStoreNames 
```PowerShell 

   Get-KeyValueStoreNames               --> getstorenames  
```` 

### SYNTAX 
```PowerShell 
Get-KeyValueStoreNames [[-SynchronizationKey] <string>]
    [-DatabasePath <string>] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope, defaults to all  
        Required?                    false  
        Position?                    0  
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

<br/><hr/><br/>
 

##	Get-StoreKeys 
```PowerShell 

   Get-StoreKeys                        --> getkeys  
```` 

### SYNTAX 
```PowerShell 
Get-StoreKeys [-StoreName] <string> [[-SynchronizationKey]
    <string>] [-DatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store whose keys should be retrieved  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope, defaults to all  
        Required?                    false  
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

<br/><hr/><br/>
 

##	Get-ValueByKeyFromStore 
```PowerShell 

   Get-ValueByKeyFromStore              --> getvalue  
```` 

### SYNTAX 
```PowerShell 
Get-ValueByKeyFromStore [-StoreName] <string> [-KeyName]
    <string> [[-DefaultValue] <string>]
    [[-SynchronizationKey] <string>] [-DatabasePath
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        A optional default value  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Key to retrieve from the specified store  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store to retrieve the key from  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Initialize-KeyValueStores 
```PowerShell 

   Initialize-KeyValueStores  
```` 

### SYNTAX 
```PowerShell 
Initialize-KeyValueStores [[-DatabasePath] <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-KeyFromStore 
```PowerShell 

   Remove-KeyFromStore                  --> removekey  
```` 

### SYNTAX 
```PowerShell 
Remove-KeyFromStore [-StoreName] <string> [-KeyName]
    <string> [[-SynchronizationKey] <string>] [-SessionOnly]
    [-ClearSession] [-DatabasePath <string>] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Key to be deleted  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-KeyValueStore 
```PowerShell 

   Remove-KeyValueStore  
```` 

### SYNTAX 
```PowerShell 
Remove-KeyValueStore [-StoreName] <string>
    [[-SynchronizationKey] <string>] [-DatabasePath
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store to delete  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-ValueByKeyInStore 
```PowerShell 

   Set-ValueByKeyInStore                --> setvalue  
```` 

### SYNTAX 
```PowerShell 
Set-ValueByKeyInStore [-StoreName] <string> [-KeyName]
    <string> [[-Value] <string>] [[-SynchronizationKey]
    <string>] [-DatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Name of the key to set or update  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Store name for the key-value pair  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        Value to be stored  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Sync-KeyValueStore 
```PowerShell 

   Sync-KeyValueStore  
```` 

### SYNTAX 
```PowerShell 
Sync-KeyValueStore [[-SynchronizationKey] <string>]
    [-DatabasePath <string>] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    0  
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

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/> 

##	Get-GenXdevPreference 
```PowerShell 

   Get-GenXdevPreference                --> getPreference  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreference [-Name] <string> [[-DefaultValue]
    <string>] [-PreferencesDatabasePath <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to retrieve  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXdevPreferenceNames 
```PowerShell 

   Get-GenXdevPreferenceNames           --> getPreferenceNames  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreferenceNames [[-PreferencesDatabasePath]
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXdevPreferencesDatabasePath 
```PowerShell 

   Get-GenXdevPreferencesDatabasePath  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreferencesDatabasePath
    [[-PreferencesDatabasePath] <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-GenXdevPreference 
```PowerShell 

   Remove-GenXdevPreference             --> removePreference  
```` 

### SYNTAX 
```PowerShell 
Remove-GenXdevPreference [-Name] <string> [[-RemoveDefault]]
    [-PreferencesDatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to remove  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RemoveDefault  
        Switch to also remove the preference from defaults  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           All  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevDefaultPreference 
```PowerShell 

   Set-GenXdevDefaultPreference         --> setPreferenceDefault  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevDefaultPreference [-Name] <string> [[-Value]
    <string>] [[-PreferencesDatabasePath] <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to set in defaults  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        The value to store for the preference  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceValue  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevPreference 
```PowerShell 

   Set-GenXdevPreference                --> setPreference  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevPreference [-Name] <string> [[-Value] <string>]
    [-SessionOnly] [-ClearSession] [-PreferencesDatabasePath
    <string>] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to set  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        The value to store for the preference  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceValue  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevPreferencesDatabasePath 
```PowerShell 

   Set-GenXdevPreferencesDatabasePath  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevPreferencesDatabasePath
    [[-PreferencesDatabasePath] <string>] [-SkipSession]
    [-SessionOnly] [-ClearSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SQLite<hr/> 

##	EnsureSQLiteStudioInstalled 
```PowerShell 

   EnsureSQLiteStudioInstalled  
```` 

### SYNTAX 
```PowerShell 
EnsureSQLiteStudioInstalled [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLiteSchema 
```PowerShell 

   Get-SQLiteSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteSchema [<CommonParameters>]
Get-SQLiteSchema [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteSchema [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteTableColumnData 
```PowerShell 

   Get-SQLiteTableColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableColumnData [-TableName] <string>
    [-ColumnName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableColumnData [-ConnectionString] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>]
Get-SQLiteTableColumnData [-DatabaseFilePath] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column to retrieve  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQLite database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. Default 100. Use -1 for all  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseFilePath  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query  
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

<br/><hr/><br/>
 

##	Get-SQLiteTableData 
```PowerShell 

   Get-SQLiteTableData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableData [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableData [-ConnectionString] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableData [-DatabaseFilePath] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>] 
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
        The maximum number of records to return. -1 for all.  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query data from.  
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

<br/><hr/><br/>
 

##	Get-SQLiteTables 
```PowerShell 

   Get-SQLiteTables  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTables [<CommonParameters>]
Get-SQLiteTables [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteTables [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteTableSchema 
```PowerShell 

   Get-SQLiteTableSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableSchema [-TableName] <string>
    [<CommonParameters>]
Get-SQLiteTableSchema [-ConnectionString] <string>
    [-TableName] <string> [<CommonParameters>]
Get-SQLiteTableSchema [-DatabaseFilePath] <string>
    [-TableName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQLite database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseFilePath  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table  
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

<br/><hr/><br/>
 

##	Get-SQLiteTransaction 
```PowerShell 

   Get-SQLiteTransaction  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTransaction [-DatabaseFilePath] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-CreateDatabaseIfNotExists <bool>] [<CommonParameters>]
Get-SQLiteTransaction [-ConnectionString] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-CreateDatabaseIfNotExists <bool>] [<CommonParameters>] 
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
    -CreateDatabaseIfNotExists <bool>  
        Whether to create the database file if it does not exist.  
        Required?                    false  
        Position?                    Named  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        Transaction isolation level.  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Get-SQLiteViewColumnData 
```PowerShell 

   Get-SQLiteViewColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewColumnData [-ViewName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLiteViewColumnData [-ConnectionString] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>]
Get-SQLiteViewColumnData [-DatabaseFilePath] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
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
        The number of records to return. Default is 100. -1 for all.  
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
        Aliases                      dbpath, indexpath  
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

<br/><hr/><br/>
 

##	Get-SQLiteViewData 
```PowerShell 

   Get-SQLiteViewData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewData [-DatabaseFilePath] <string> [-ViewName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLiteViewData [-ConnectionString] <string> [-ViewName]
    <string> [[-Count] <int>] [<CommonParameters>] 
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
        Number of records to return. -1 for all records.  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view to query.  
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

<br/><hr/><br/>
 

##	Get-SQLiteViews 
```PowerShell 

   Get-SQLiteViews  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViews [<CommonParameters>]
Get-SQLiteViews [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteViews [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteViewSchema 
```PowerShell 

   Get-SQLiteViewSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewSchema [-ViewName] <string>
    [<CommonParameters>]
Get-SQLiteViewSchema [-ConnectionString] <string>
    [-ViewName] <string> [<CommonParameters>]
Get-SQLiteViewSchema [-DatabaseFilePath] <string>
    [-ViewName] <string> [<CommonParameters>] 
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
        Aliases                      dbpath, indexpath  
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

<br/><hr/><br/>
 

##	Invoke-SQLiteQuery 
```PowerShell 

   Invoke-SQLiteQuery  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteQuery [[-ConnectionString] <string>]
    [[-DatabaseFilePath] <string>] [[-Transaction] <Object>]
    [-Queries] <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQLite database.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Transaction <Object>  
        An existing SQLite transaction to use for the queries.  
        Required?                    false  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Invoke-SQLiteStudio 
```PowerShell 

   Invoke-SQLiteStudio  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteStudio [-Queries] <string[]> [[-SqlParameters]
    <hashtable[]>] [-IsolationLevel {ReadCommitted |
    ReadUncommitted | RepeatableRead | Serializable |
    Snapshot | Chaos}] [<CommonParameters>]
Invoke-SQLiteStudio [-ConnectionString] <string> [-Queries]
    <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>]
Invoke-SQLiteStudio [-DatabaseFilePath] <string> [-Queries]
    <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. Default is ReadCommitted.  
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
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Optional parameters for the query.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      parameters  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-SQLiteDatabase 
```PowerShell 

   New-SQLiteDatabase  
```` 

### SYNTAX 
```PowerShell 
New-SQLiteDatabase [-DatabaseFilePath] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/> 

##	EnsureSSMSInstalled 
```PowerShell 

   EnsureSSMSInstalled  
```` 

### SYNTAX 
```PowerShell 
EnsureSSMSInstalled [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerSchema 
```PowerShell 

   Get-SQLServerSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerSchema [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerSchema [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerTableColumnData 
```PowerShell 

   Get-SQLServerTableColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableColumnData [-DatabaseName] <string>
    [[-Server] <string>] [-TableName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLServerTableColumnData [-ConnectionString] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column to retrieve  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. Default 100. Use -1 for all  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTableData 
```PowerShell 

   Get-SQLServerTableData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableData [-DatabaseName] <string> [[-Server]
    <string>] [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLServerTableData [-ConnectionString] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        The maximum number of records to return. -1 for all.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query data from.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTables 
```PowerShell 

   Get-SQLServerTables  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTables [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerTables [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerTableSchema 
```PowerShell 

   Get-SQLServerTableSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableSchema [-DatabaseName] <string> [[-Server]
    <string>] [-TableName] <string> [<CommonParameters>]
Get-SQLServerTableSchema [-ConnectionString] <string>
    [-TableName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTransaction 
```PowerShell 

   Get-SQLServerTransaction             --> getsqltx, newsqltx  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTransaction [-DatabaseName] <string> [[-Server]
    <string>] [-IsolationLevel {ReadCommitted |
    ReadUncommitted | RepeatableRead | Serializable |
    Snapshot | Chaos}] [<CommonParameters>]
Get-SQLServerTransaction [-ConnectionString] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        Transaction isolation level.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerViewColumnData 
```PowerShell 

   Get-SQLServerViewColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewColumnData [-DatabaseName] <string>
    [[-Server] <string>] [-ViewName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLServerViewColumnData [-ConnectionString] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        The number of records to return. Default is 100. -1 for all.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerViewData 
```PowerShell 

   Get-SQLServerViewData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewData [-DatabaseName] <string> [[-Server]
    <string>] [-ViewName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLServerViewData [-ConnectionString] <string>
    [-ViewName] <string> [[-Count] <int>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. -1 for all records.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view to query.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerViews 
```PowerShell 

   Get-SQLServerViews  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViews [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerViews [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerViewSchema 
```PowerShell 

   Get-SQLServerViewSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewSchema [-DatabaseName] <string> [[-Server]
    <string>] [-ViewName] <string> [<CommonParameters>]
Get-SQLServerViewSchema [-ConnectionString] <string>
    [-ViewName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Invoke-SqlServerQuery 
```PowerShell 

   Invoke-SQLServerQuery  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLServerQuery [[-Queries] <string[]>]
    [[-DatabaseName] <string>] [[-Server] <string>]
    [[-Transaction] <Object>] [[-ConnectionString] <string>]
    [[-SqlParameters] <hashtable[]>] [-IsolationLevel
    {ReadCommitted | ReadUncommitted | RepeatableRead |
    Serializable | Snapshot | Chaos}] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL database.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Transaction <Object>  
        An existing SQL Server transaction to use for the queries.  
        Required?                    false  
        Position?                    3  
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

<br/><hr/><br/>
 

##	Invoke-SSMS 
```PowerShell 

   Invoke-SSMS                          --> sqlservermanagementstudio, ssms  
```` 

### SYNTAX 
```PowerShell 
Invoke-SSMS [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-SQLServerDatabase 
```PowerShell 

   New-SQLServerDatabase                --> nsqldb  
```` 

### SYNTAX 
```PowerShell 
New-SQLServerDatabase [-DatabaseName] <string> [[-Server]
    <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
New-SQLServerDatabase [-ConnectionString] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to connect to SQL Server  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database to create  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/> 

##	Get-KeyValueStoreNames 
```PowerShell 

   Get-KeyValueStoreNames               --> getstorenames  
```` 

### SYNTAX 
```PowerShell 
Get-KeyValueStoreNames [[-SynchronizationKey] <string>]
    [-DatabasePath <string>] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope, defaults to all  
        Required?                    false  
        Position?                    0  
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

<br/><hr/><br/>
 

##	Get-StoreKeys 
```PowerShell 

   Get-StoreKeys                        --> getkeys  
```` 

### SYNTAX 
```PowerShell 
Get-StoreKeys [-StoreName] <string> [[-SynchronizationKey]
    <string>] [-DatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store whose keys should be retrieved  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope, defaults to all  
        Required?                    false  
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

<br/><hr/><br/>
 

##	Get-ValueByKeyFromStore 
```PowerShell 

   Get-ValueByKeyFromStore              --> getvalue  
```` 

### SYNTAX 
```PowerShell 
Get-ValueByKeyFromStore [-StoreName] <string> [-KeyName]
    <string> [[-DefaultValue] <string>]
    [[-SynchronizationKey] <string>] [-DatabasePath
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        A optional default value  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Key to retrieve from the specified store  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store to retrieve the key from  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Initialize-KeyValueStores 
```PowerShell 

   Initialize-KeyValueStores  
```` 

### SYNTAX 
```PowerShell 
Initialize-KeyValueStores [[-DatabasePath] <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-KeyFromStore 
```PowerShell 

   Remove-KeyFromStore                  --> removekey  
```` 

### SYNTAX 
```PowerShell 
Remove-KeyFromStore [-StoreName] <string> [-KeyName]
    <string> [[-SynchronizationKey] <string>] [-SessionOnly]
    [-ClearSession] [-DatabasePath <string>] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Key to be deleted  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-KeyValueStore 
```PowerShell 

   Remove-KeyValueStore  
```` 

### SYNTAX 
```PowerShell 
Remove-KeyValueStore [-StoreName] <string>
    [[-SynchronizationKey] <string>] [-DatabasePath
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Name of the store to delete  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-ValueByKeyInStore 
```PowerShell 

   Set-ValueByKeyInStore                --> setvalue  
```` 

### SYNTAX 
```PowerShell 
Set-ValueByKeyInStore [-StoreName] <string> [-KeyName]
    <string> [[-Value] <string>] [[-SynchronizationKey]
    <string>] [-DatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeyName <string>  
        Name of the key to set or update  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StoreName <string>  
        Store name for the key-value pair  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        Value to be stored  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Sync-KeyValueStore 
```PowerShell 

   Sync-KeyValueStore  
```` 

### SYNTAX 
```PowerShell 
Sync-KeyValueStore [[-SynchronizationKey] <string>]
    [-DatabasePath <string>] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabasePath <string>  
        Database path for key-value store data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SynchronizationKey <string>  
        Key to identify synchronization scope  
        Required?                    false  
        Position?                    0  
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

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/> 

##	Get-GenXdevPreference 
```PowerShell 

   Get-GenXdevPreference                --> getPreference  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreference [-Name] <string> [[-DefaultValue]
    <string>] [-PreferencesDatabasePath <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to retrieve  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXdevPreferenceNames 
```PowerShell 

   Get-GenXdevPreferenceNames           --> getPreferenceNames  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreferenceNames [[-PreferencesDatabasePath]
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXdevPreferencesDatabasePath 
```PowerShell 

   Get-GenXdevPreferencesDatabasePath  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevPreferencesDatabasePath
    [[-PreferencesDatabasePath] <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-GenXdevPreference 
```PowerShell 

   Remove-GenXdevPreference             --> removePreference  
```` 

### SYNTAX 
```PowerShell 
Remove-GenXdevPreference [-Name] <string> [[-RemoveDefault]]
    [-PreferencesDatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to remove  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RemoveDefault  
        Switch to also remove the preference from defaults  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           All  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevDefaultPreference 
```PowerShell 

   Set-GenXdevDefaultPreference         --> setPreferenceDefault  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevDefaultPreference [-Name] <string> [[-Value]
    <string>] [[-PreferencesDatabasePath] <string>]
    [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to set in defaults  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        The value to store for the preference  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceValue  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevPreference 
```PowerShell 

   Set-GenXdevPreference                --> setPreference  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevPreference [-Name] <string> [[-Value] <string>]
    [-SessionOnly] [-ClearSession] [-PreferencesDatabasePath
    <string>] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of the preference to set  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Value <string>  
        The value to store for the preference  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceValue  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-GenXdevPreferencesDatabasePath 
```PowerShell 

   Set-GenXdevPreferencesDatabasePath  
```` 

### SYNTAX 
```PowerShell 
Set-GenXdevPreferencesDatabasePath
    [[-PreferencesDatabasePath] <string>] [-SkipSession]
    [-SessionOnly] [-ClearSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SQLite<hr/> 

##	EnsureSQLiteStudioInstalled 
```PowerShell 

   EnsureSQLiteStudioInstalled  
```` 

### SYNTAX 
```PowerShell 
EnsureSQLiteStudioInstalled [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLiteSchema 
```PowerShell 

   Get-SQLiteSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteSchema [<CommonParameters>]
Get-SQLiteSchema [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteSchema [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteTableColumnData 
```PowerShell 

   Get-SQLiteTableColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableColumnData [-TableName] <string>
    [-ColumnName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableColumnData [-ConnectionString] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>]
Get-SQLiteTableColumnData [-DatabaseFilePath] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column to retrieve  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQLite database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. Default 100. Use -1 for all  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseFilePath  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query  
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

<br/><hr/><br/>
 

##	Get-SQLiteTableData 
```PowerShell 

   Get-SQLiteTableData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableData [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableData [-ConnectionString] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLiteTableData [-DatabaseFilePath] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>] 
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
        The maximum number of records to return. -1 for all.  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query data from.  
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

<br/><hr/><br/>
 

##	Get-SQLiteTables 
```PowerShell 

   Get-SQLiteTables  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTables [<CommonParameters>]
Get-SQLiteTables [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteTables [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteTableSchema 
```PowerShell 

   Get-SQLiteTableSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTableSchema [-TableName] <string>
    [<CommonParameters>]
Get-SQLiteTableSchema [-ConnectionString] <string>
    [-TableName] <string> [<CommonParameters>]
Get-SQLiteTableSchema [-DatabaseFilePath] <string>
    [-TableName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQLite database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseFilePath  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table  
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

<br/><hr/><br/>
 

##	Get-SQLiteTransaction 
```PowerShell 

   Get-SQLiteTransaction  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteTransaction [-DatabaseFilePath] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-CreateDatabaseIfNotExists <bool>] [<CommonParameters>]
Get-SQLiteTransaction [-ConnectionString] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-CreateDatabaseIfNotExists <bool>] [<CommonParameters>] 
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
    -CreateDatabaseIfNotExists <bool>  
        Whether to create the database file if it does not exist.  
        Required?                    false  
        Position?                    Named  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        Transaction isolation level.  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Get-SQLiteViewColumnData 
```PowerShell 

   Get-SQLiteViewColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewColumnData [-ViewName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLiteViewColumnData [-ConnectionString] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>]
Get-SQLiteViewColumnData [-DatabaseFilePath] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
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
        The number of records to return. Default is 100. -1 for all.  
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
        Aliases                      dbpath, indexpath  
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

<br/><hr/><br/>
 

##	Get-SQLiteViewData 
```PowerShell 

   Get-SQLiteViewData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewData [-DatabaseFilePath] <string> [-ViewName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLiteViewData [-ConnectionString] <string> [-ViewName]
    <string> [[-Count] <int>] [<CommonParameters>] 
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
        Number of records to return. -1 for all records.  
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view to query.  
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

<br/><hr/><br/>
 

##	Get-SQLiteViews 
```PowerShell 

   Get-SQLiteViews  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViews [<CommonParameters>]
Get-SQLiteViews [-ConnectionString] <string>
    [<CommonParameters>]
Get-SQLiteViews [-DatabaseFilePath] <string>
    [<CommonParameters>] 
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

<br/><hr/><br/>
 

##	Get-SQLiteViewSchema 
```PowerShell 

   Get-SQLiteViewSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLiteViewSchema [-ViewName] <string>
    [<CommonParameters>]
Get-SQLiteViewSchema [-ConnectionString] <string>
    [-ViewName] <string> [<CommonParameters>]
Get-SQLiteViewSchema [-DatabaseFilePath] <string>
    [-ViewName] <string> [<CommonParameters>] 
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
        Aliases                      dbpath, indexpath  
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

<br/><hr/><br/>
 

##	Invoke-SQLiteQuery 
```PowerShell 

   Invoke-SQLiteQuery  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteQuery [[-ConnectionString] <string>]
    [[-DatabaseFilePath] <string>] [[-Transaction] <Object>]
    [-Queries] <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQLite database.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Transaction <Object>  
        An existing SQLite transaction to use for the queries.  
        Required?                    false  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Invoke-SQLiteStudio 
```PowerShell 

   Invoke-SQLiteStudio  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteStudio [-Queries] <string[]> [[-SqlParameters]
    <hashtable[]>] [-IsolationLevel {ReadCommitted |
    ReadUncommitted | RepeatableRead | Serializable |
    Snapshot | Chaos}] [<CommonParameters>]
Invoke-SQLiteStudio [-ConnectionString] <string> [-Queries]
    <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>]
Invoke-SQLiteStudio [-DatabaseFilePath] <string> [-Queries]
    <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
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
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. Default is ReadCommitted.  
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
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Optional parameters for the query.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      parameters  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-SQLiteDatabase 
```PowerShell 

   New-SQLiteDatabase  
```` 

### SYNTAX 
```PowerShell 
New-SQLiteDatabase [-DatabaseFilePath] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/> 

##	EnsureSSMSInstalled 
```PowerShell 

   EnsureSSMSInstalled  
```` 

### SYNTAX 
```PowerShell 
EnsureSSMSInstalled [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerSchema 
```PowerShell 

   Get-SQLServerSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerSchema [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerSchema [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerTableColumnData 
```PowerShell 

   Get-SQLServerTableColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableColumnData [-DatabaseName] <string>
    [[-Server] <string>] [-TableName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLServerTableColumnData [-ConnectionString] <string>
    [-TableName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column to retrieve  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. Default 100. Use -1 for all  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTableData 
```PowerShell 

   Get-SQLServerTableData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableData [-DatabaseName] <string> [[-Server]
    <string>] [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLServerTableData [-ConnectionString] <string>
    [-TableName] <string> [[-Count] <int>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        The maximum number of records to return. -1 for all.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table to query data from.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTables 
```PowerShell 

   Get-SQLServerTables  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTables [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerTables [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerTableSchema 
```PowerShell 

   Get-SQLServerTableSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTableSchema [-DatabaseName] <string> [[-Server]
    <string>] [-TableName] <string> [<CommonParameters>]
Get-SQLServerTableSchema [-ConnectionString] <string>
    [-TableName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TableName <string>  
        The name of the table  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerTransaction 
```PowerShell 

   Get-SQLServerTransaction             --> getsqltx, newsqltx  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerTransaction [-DatabaseName] <string> [[-Server]
    <string>] [-IsolationLevel {ReadCommitted |
    ReadUncommitted | RepeatableRead | Serializable |
    Snapshot | Chaos}] [<CommonParameters>]
Get-SQLServerTransaction [-ConnectionString] <string>
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        Transaction isolation level.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerViewColumnData 
```PowerShell 

   Get-SQLServerViewColumnData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewColumnData [-DatabaseName] <string>
    [[-Server] <string>] [-ViewName] <string> [-ColumnName]
    <string> [[-Count] <int>] [<CommonParameters>]
Get-SQLServerViewColumnData [-ConnectionString] <string>
    [-ViewName] <string> [-ColumnName] <string> [[-Count]
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ColumnName <string>  
        The name of the column.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        The number of records to return. Default is 100. -1 for all.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerViewData 
```PowerShell 

   Get-SQLServerViewData  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewData [-DatabaseName] <string> [[-Server]
    <string>] [-ViewName] <string> [[-Count] <int>]
    [<CommonParameters>]
Get-SQLServerViewData [-ConnectionString] <string>
    [-ViewName] <string> [[-Count] <int>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Count <int>  
        Number of records to return. -1 for all records.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view to query.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Get-SQLServerViews 
```PowerShell 

   Get-SQLServerViews  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViews [-DatabaseName] <string> [[-Server]
    <string>] [<CommonParameters>]
Get-SQLServerViews [-ConnectionString] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SQLServerViewSchema 
```PowerShell 

   Get-SQLServerViewSchema  
```` 

### SYNTAX 
```PowerShell 
Get-SQLServerViewSchema [-DatabaseName] <string> [[-Server]
    <string>] [-ViewName] <string> [<CommonParameters>]
Get-SQLServerViewSchema [-ConnectionString] <string>
    [-ViewName] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ViewName <string>  
        The name of the view.  
        Required?                    true  
        Position?                    2  
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

<br/><hr/><br/>
 

##	Invoke-SqlServerQuery 
```PowerShell 

   Invoke-SQLServerQuery  
```` 

### SYNTAX 
```PowerShell 
Invoke-SQLServerQuery [[-Queries] <string[]>]
    [[-DatabaseName] <string>] [[-Server] <string>]
    [[-Transaction] <Object>] [[-ConnectionString] <string>]
    [[-SqlParameters] <hashtable[]>] [-IsolationLevel
    {ReadCommitted | ReadUncommitted | RepeatableRead |
    Serializable | Snapshot | Chaos}] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ConnectionString <string>  
        The connection string to the SQL database.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Transaction <Object>  
        An existing SQL Server transaction to use for the queries.  
        Required?                    false  
        Position?                    3  
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

<br/><hr/><br/>
 

##	Invoke-SSMS 
```PowerShell 

   Invoke-SSMS                          --> sqlservermanagementstudio, ssms  
```` 

### SYNTAX 
```PowerShell 
Invoke-SSMS [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-SQLServerDatabase 
```PowerShell 

   New-SQLServerDatabase                --> nsqldb  
```` 

### SYNTAX 
```PowerShell 
New-SQLServerDatabase [-DatabaseName] <string> [[-Server]
    <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
New-SQLServerDatabase [-ConnectionString] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ConnectionString <string>  
        The connection string to connect to SQL Server  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ConnectionString  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DatabaseName <string>  
        The name of the SQL Server database to create  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Server <string>  
        The SQL Server instance name  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           DatabaseName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
