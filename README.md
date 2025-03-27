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
| [Get-KeyValueStoreNames](#Get-KeyValueStoreNames) | getstorenames | Retrieves a list of all available key-value store names from the database. |
| [Get-StoreKeys](#Get-StoreKeys) | getkeys | Retrieves all key names for a given key-value store. |
| [Get-ValueByKeyFromStore](#Get-ValueByKeyFromStore) | getvalue | Retrieves a value from a key-value store database. |
| [Initialize-KeyValueStores](#Initialize-KeyValueStores) |  | Initializes and synchronizes KeyValueStore databases between local and OneDrive. |
| [Remove-KeyFromStore](#Remove-KeyFromStore) | removekey | Deletes a key from the specified key-value store. |
| [Remove-KeyValueStore](#Remove-KeyValueStore) |  | Removes a key-value store from the database. |
| [Set-ValueByKeyInStore](#Set-ValueByKeyInStore) | setvalue | Manages key-value pairs in a SQLite database store. |
| [Sync-KeyValueStore](#Sync-KeyValueStore) |  | Synchronizes local and OneDrive key-value store databases. |

<hr/>
&nbsp;

### GenXdev.Data.Preferences</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-GenXdevPreference](#Get-GenXdevPreference) | getpreference | Retrieves a preference value from the GenXdev preferences store. |
| [Get-GenXdevPreferenceNames](#Get-GenXdevPreferenceNames) | getpreferencenames | Gets all preference names from both local and default stores. |
| [Remove-GenXdevPreference](#Remove-GenXdevPreference) | removepreference | Removes a preference value from the GenXdev preferences store. |
| [Set-GenXdevDefaultPreference](#Set-GenXdevDefaultPreference) | setpreferencedefault | Sets a default preference value in the GenXdev preferences store. |
| [Set-GenXdevPreference](#Set-GenXdevPreference) | setpreference | Sets a preference value in the GenXdev preferences store. |

<hr/>
&nbsp;

### GenXdev.Data.SQLite</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [AssureSQLiteStudioInstalled](#AssureSQLiteStudioInstalled) |  | Ensures SQLiteStudio is installed and accessible from the command line. |
| [Get-SQLiteSchema](#Get-SQLiteSchema) |  | Retrieves the complete schema information from a SQLite database. |
| [Get-SQLiteTableColumnData](#Get-SQLiteTableColumnData) |  | Retrieves data from a specific column in a SQLite database table. |
| [Get-SQLiteTableData](#Get-SQLiteTableData) |  | Retrieves data from a SQLite database table with optional record limiting. |
| [Get-SQLiteTables](#Get-SQLiteTables) |  | Retrieves a list of table names from a SQLite database. |
| [Get-SQLiteTableSchema](#Get-SQLiteTableSchema) |  | Retrieves the schema information for a specified SQLite table. |
| [Get-SQLiteViewColumnData](#Get-SQLiteViewColumnData) |  | Retrieves column data from a SQLite view with optional record limiting. |
| [Get-SQLiteViewData](#Get-SQLiteViewData) |  | Retrieves data from a SQLite database view with optional record limiting. |
| [Get-SQLiteViews](#Get-SQLiteViews) |  | Retrieves a list of views from a SQLite database. |
| [Get-SQLiteViewSchema](#Get-SQLiteViewSchema) |  | Retrieves the SQL schema definition for a SQLite view. |
| [Invoke-SQLiteQuery](#Invoke-SQLiteQuery) |  | Executes one or more SQL queries against a SQLite database with transaction support. |
| [Invoke-SQLiteStudio](#Invoke-SQLiteStudio) |  | Executes SQLite database queries with support for parameters and transactions. |
| [New-SQLiteDatabase](#New-SQLiteDatabase) | nsqldb | Creates a new SQLite database file. |

<hr/>
&nbsp;

### GenXdev.Data.SqlServer</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Invoke-SqlServerQuery](#Invoke-SqlServerQuery) |  | Executes SQL queries against a SQL Server database with transaction support. |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/> 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/> 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SQLite<hr/> 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/> 

<br/><hr/><hr/><br/>
