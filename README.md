<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Data
### SYNOPSIS
    A Windows PowerShell module for enhancing the commandline experience
[![GenXdev.Data](https://img.shields.io/powershellgallery/v/GenXdev.Data.svg?style=flat-square&label=GenXdev.Data)](https://www.powershellgallery.com/packages/GenXdev.Data/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Data?style=flat-square)](./LICENSE)

## APACHE 2.0 License

````text
Copyright (c) 2025 René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

````

### FEATURES

    * Key-Value Store based upon SQLite with OneDrive synchronization
    * Preferences Store with local and default values
    * SQLite database schema and data retrieval
    * SQL Server query execution
    * SQLite Studio installation assurance
    * SQLite Studio execution
    * SQLite database creation

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
| [Get-KeyValueStoreNames](#get-keyvaluestorenames) | getstorenames | Retrieves the names of available key-value stores. |
| [Get-KeyValueStorePath](#get-keyvaluestorepath) | &nbsp; | Gets the file path for a key-value store. |
| [Get-StoreKeys](#get-storekeys) | getkeys | Retrieves all key names for a given key-value store. |
| [Get-ValueByKeyFromStore](#get-valuebykeyfromstore) | getvalue | Retrieves a value from a JSON-based key-value store. |
| [Initialize-KeyValueStores](#initialize-keyvaluestores) | &nbsp; | Initializes KeyValueStore directory structure for local and OneDrive storage. |
| [Remove-KeyFromStore](#remove-keyfromstore) | removekey | Removes a key from a key-value store. |
| [Remove-KeyValueStore](#remove-keyvaluestore) | &nbsp; | Removes a key-value store. |
| [Set-ValueByKeyInStore](#set-valuebykeyinstore) | setvalue | Manages key-value pairs in a JSON file-based store. |
| [Sync-KeyValueStore](#sync-keyvaluestore) | &nbsp; | Synchronizes local and OneDrive key-value store JSON files. |

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
| [EnsureSQLiteStudioInstalled](#ensuresqlitestudioinstalled) | &nbsp; | &nbsp; |
| [Get-SQLiteSchema](#get-sqliteschema) | &nbsp; | Retrieves the complete schema information from a SQLite database. |
| [Get-SQLiteTableColumnData](#get-sqlitetablecolumndata) | &nbsp; | Retrieves data from a specific column in a SQLite database table. |
| [Get-SQLiteTableData](#get-sqlitetabledata) | &nbsp; | Retrieves data from a SQLite database table with optional record limiting. |
| [Get-SQLiteTables](#get-sqlitetables) | &nbsp; | Retrieves a list of table names from a SQLite database. |
| [Get-SQLiteTableSchema](#get-sqlitetableschema) | &nbsp; | Retrieves the schema information for a specified SQLite table. |
| [Get-SQLiteTransaction](#get-sqlitetransaction) | &nbsp; | &nbsp; |
| [Get-SQLiteViewColumnData](#get-sqliteviewcolumndata) | &nbsp; | Retrieves column data from a SQLite view with optional record limiting. |
| [Get-SQLiteViewData](#get-sqliteviewdata) | &nbsp; | Retrieves data from a SQLite database view with optional record limiting. |
| [Get-SQLiteViews](#get-sqliteviews) | &nbsp; | Retrieves a list of views from a SQLite database. |
| [Get-SQLiteViewSchema](#get-sqliteviewschema) | &nbsp; | Retrieves the SQL schema definition for a SQLite view. |
| [Invoke-SQLiteQuery](#invoke-sqlitequery) | &nbsp; | &nbsp; |
| [Invoke-SQLiteStudio](#invoke-sqlitestudio) | &nbsp; | Executes SQLite database queries with support for parameters and transactions. |
| [New-SQLiteDatabase](#new-sqlitedatabase) | &nbsp; | &nbsp; |

### GenXdev.Data.SqlServer
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [EnsureSSMSInstalled](#ensuressmsinstalled) | &nbsp; | &nbsp; |
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
| [Invoke-SqlServerQuery](#invoke-sqlserverquery) | &nbsp; | &nbsp; |
| [Invoke-SSMS](#invoke-ssms) | sqlservermanagementstudio, ssms | Launches SQL Server Management Studio (SSMS) after ensuring it is installed. |
| [New-SQLServerDatabase](#new-sqlserverdatabase) | nsqldb | Creates a new SQL Server database. |

<br/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Data.SQLite<hr/> 

##	EnsureSQLiteStudioInstalled 
```PowerShell 

   EnsureSQLiteStudioInstalled  
``` 

### SYNTAX 
```PowerShell 
EnsureSQLiteStudioInstalled [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTransaction 
```PowerShell 

   Get-SQLiteTransaction  
``` 

### SYNOPSIS 
    Creates and returns a SQLite transaction object for batch operations.  

### SYNTAX 
```PowerShell 
Get-SQLiteTransaction [-DatabaseFilePath] <String>
    [-IsolationLevel <String>] [-CreateDatabaseIfNotExists
    <Boolean>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>]
Get-SQLiteTransaction [-ConnectionString] <String>
    [-IsolationLevel <String>] [-CreateDatabaseIfNotExists
    <Boolean>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a SQLite database connection and transaction object that can be used  
    for batch operations. The caller is responsible for committing or rolling back  
    the transaction. The connection will be automatically created if the database  
    file doesn't exist.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <String>  
        The SQLite connection string for database access.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <String>  
        The file path to the SQLite database. Will be converted to a connection string.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <String>  
        Transaction isolation level. Defaults to ReadCommitted.  
        Required?                    false  
        Position?                    named  
        Default value                ReadCommitted  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -CreateDatabaseIfNotExists <Boolean>  
        Whether to create the database file if it doesn't exist. Defaults to true.  
        Required?                    false  
        Position?                    named  
        Default value                True  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQLite package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQLite package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-SQLiteQuery 
```PowerShell 

   Invoke-SQLiteQuery  
``` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteQuery [[-ConnectionString] <string>]
    [[-DatabaseFilePath] <string>] [[-Transaction] <Object>]
    [-Queries] <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <string>  
        The connection string to the SQLite database.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQLite package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <string>  
        The path to the SQLite database file.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQLite package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Transaction <Object>  
        An existing SQLite transaction to use for the queries.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-SQLiteDatabase 
```PowerShell 

   New-SQLiteDatabase  
``` 

### SYNTAX 
```PowerShell 
New-SQLiteDatabase [-DatabaseFilePath] <string>
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQLite package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQLite package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/> 

##	EnsureSSMSInstalled 
```PowerShell 

   EnsureSSMSInstalled  
``` 

### SYNTAX 
```PowerShell 
EnsureSSMSInstalled [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTransaction 
```PowerShell 

   Get-SQLServerTransaction             --> getsqltx, newsqltx  
``` 

### SYNOPSIS 
    Creates and returns a SQL Server transaction object for batch operations.  

### SYNTAX 
```PowerShell 
Get-SQLServerTransaction [-DatabaseName] <String> [[-Server]
    <String>] [-IsolationLevel <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>]
Get-SQLServerTransaction [-ConnectionString] <String>
    [-IsolationLevel <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a SQL Server database connection and transaction object that can be used  
    for batch operations. The caller is responsible for committing or rolling back  
    the transaction. Requires an existing SQL Server database and connection.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <String>  
        The SQL Server connection string for database access.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseName <String>  
        The name of the SQL Server database. Used with Server parameter to create connection string.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <String>  
        The SQL Server instance name. Defaults to 'localhost'.  
        Required?                    false  
        Position?                    2  
        Default value                .  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <String>  
        Transaction isolation level. Defaults to ReadCommitted.  
        Required?                    false  
        Position?                    named  
        Default value                ReadCommitted  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQL Server package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQL Server package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-SqlServerQuery 
```PowerShell 

   Invoke-SQLServerQuery  
``` 

### SYNTAX 
```PowerShell 
Invoke-SQLServerQuery [[-Queries] <string[]>]
    [[-DatabaseName] <string>] [[-Server] <string>]
    [[-Transaction] <Object>] [[-ConnectionString] <string>]
    [[-SqlParameters] <hashtable[]>] [-IsolationLevel
    {ReadCommitted | ReadUncommitted | RepeatableRead |
    Serializable | Snapshot | Chaos}] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <string>  
        The connection string to the SQL database.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQL Server package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQL Server package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Transaction <Object>  
        An existing SQL Server transaction to use for the queries.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-SQLServerDatabase 
```PowerShell 

   New-SQLServerDatabase                --> nsqldb  
``` 

### SYNOPSIS 
    Creates a new SQL Server database.  

### SYNTAX 
```PowerShell 
New-SQLServerDatabase [-DatabaseName] <String> [[-Server]
    <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>]
New-SQLServerDatabase [-ConnectionString] <String>
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a new SQL Server database with the specified name on the specified server.  
    Requires appropriate permissions to create databases on the target SQL Server instance.  
    If the database already exists, the operation will be skipped.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -DatabaseName <String>  
        The name of the SQL Server database to create. Must be a valid SQL Server database name.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <String>  
        The SQL Server instance name where the database should be created. Defaults to 'localhost'.  
        Required?                    false  
        Position?                    2  
        Default value                .  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConnectionString <String>  
        Alternative connection string to use instead of Server parameter. Should connect to master database or have appropriate permissions.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQL Server package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQL Server package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/> 

##	Get-KeyValueStoreNames 
```PowerShell 

   Get-KeyValueStoreNames               --> getstorenames  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-KeyValueStorePath 
```PowerShell 

   Get-KeyValueStorePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-StoreKeys 
```PowerShell 

   Get-StoreKeys                        --> getkeys  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-ValueByKeyFromStore 
```PowerShell 

   Get-ValueByKeyFromStore              --> getvalue  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Initialize-KeyValueStores 
```PowerShell 

   Initialize-KeyValueStores  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-KeyFromStore 
```PowerShell 

   Remove-KeyFromStore                  --> removekey  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-KeyValueStore 
```PowerShell 

   Remove-KeyValueStore  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-ValueByKeyInStore 
```PowerShell 

   Set-ValueByKeyInStore                --> setvalue  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Sync-KeyValueStore 
```PowerShell 

   Sync-KeyValueStore  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/> 

##	Get-GenXdevPreference 
```PowerShell 

   Get-GenXdevPreference                --> getPreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-GenXdevPreferenceNames 
```PowerShell 

   Get-GenXdevPreferenceNames           --> getPreferenceNames  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-GenXdevPreferencesDatabasePath 
```PowerShell 

   Get-GenXdevPreferencesDatabasePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-GenXdevPreference 
```PowerShell 

   Remove-GenXdevPreference             --> removePreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevDefaultPreference 
```PowerShell 

   Set-GenXdevDefaultPreference         --> setPreferenceDefault  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevPreference 
```PowerShell 

   Set-GenXdevPreference                --> setPreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevPreferencesDatabasePath 
```PowerShell 

   Set-GenXdevPreferencesDatabasePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SQLite<hr/> 

##	Get-SQLiteSchema 
```PowerShell 

   Get-SQLiteSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableColumnData 
```PowerShell 

   Get-SQLiteTableColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableData 
```PowerShell 

   Get-SQLiteTableData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTables 
```PowerShell 

   Get-SQLiteTables  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableSchema 
```PowerShell 

   Get-SQLiteTableSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewColumnData 
```PowerShell 

   Get-SQLiteViewColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewData 
```PowerShell 

   Get-SQLiteViewData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViews 
```PowerShell 

   Get-SQLiteViews  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewSchema 
```PowerShell 

   Get-SQLiteViewSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Invoke-SQLiteStudio 
```PowerShell 

   Invoke-SQLiteStudio  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/> 

##	Get-SQLServerSchema 
```PowerShell 

   Get-SQLServerSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableColumnData 
```PowerShell 

   Get-SQLServerTableColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableData 
```PowerShell 

   Get-SQLServerTableData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTables 
```PowerShell 

   Get-SQLServerTables  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableSchema 
```PowerShell 

   Get-SQLServerTableSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewColumnData 
```PowerShell 

   Get-SQLServerViewColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewData 
```PowerShell 

   Get-SQLServerViewData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViews 
```PowerShell 

   Get-SQLServerViews  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewSchema 
```PowerShell 

   Get-SQLServerViewSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Invoke-SSMS 
```PowerShell 

   Invoke-SSMS                          --> sqlservermanagementstudio, ssms  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/> 

##	Get-KeyValueStoreNames 
```PowerShell 

   Get-KeyValueStoreNames               --> getstorenames  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-KeyValueStorePath 
```PowerShell 

   Get-KeyValueStorePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-StoreKeys 
```PowerShell 

   Get-StoreKeys                        --> getkeys  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-ValueByKeyFromStore 
```PowerShell 

   Get-ValueByKeyFromStore              --> getvalue  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Initialize-KeyValueStores 
```PowerShell 

   Initialize-KeyValueStores  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-KeyFromStore 
```PowerShell 

   Remove-KeyFromStore                  --> removekey  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-KeyValueStore 
```PowerShell 

   Remove-KeyValueStore  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-ValueByKeyInStore 
```PowerShell 

   Set-ValueByKeyInStore                --> setvalue  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Sync-KeyValueStore 
```PowerShell 

   Sync-KeyValueStore  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/> 

##	Get-GenXdevPreference 
```PowerShell 

   Get-GenXdevPreference                --> getPreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-GenXdevPreferenceNames 
```PowerShell 

   Get-GenXdevPreferenceNames           --> getPreferenceNames  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-GenXdevPreferencesDatabasePath 
```PowerShell 

   Get-GenXdevPreferencesDatabasePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-GenXdevPreference 
```PowerShell 

   Remove-GenXdevPreference             --> removePreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevDefaultPreference 
```PowerShell 

   Set-GenXdevDefaultPreference         --> setPreferenceDefault  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevPreference 
```PowerShell 

   Set-GenXdevPreference                --> setPreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevPreferencesDatabasePath 
```PowerShell 

   Set-GenXdevPreferencesDatabasePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SQLite<hr/> 

##	EnsureSQLiteStudioInstalled 
```PowerShell 

   EnsureSQLiteStudioInstalled  
``` 

### SYNTAX 
```PowerShell 
EnsureSQLiteStudioInstalled [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTransaction 
```PowerShell 

   Get-SQLiteTransaction  
``` 

### SYNOPSIS 
    Creates and returns a SQLite transaction object for batch operations.  

### SYNTAX 
```PowerShell 
Get-SQLiteTransaction [-DatabaseFilePath] <String>
    [-IsolationLevel <String>] [-CreateDatabaseIfNotExists
    <Boolean>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>]
Get-SQLiteTransaction [-ConnectionString] <String>
    [-IsolationLevel <String>] [-CreateDatabaseIfNotExists
    <Boolean>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a SQLite database connection and transaction object that can be used  
    for batch operations. The caller is responsible for committing or rolling back  
    the transaction. The connection will be automatically created if the database  
    file doesn't exist.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <String>  
        The SQLite connection string for database access.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <String>  
        The file path to the SQLite database. Will be converted to a connection string.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <String>  
        Transaction isolation level. Defaults to ReadCommitted.  
        Required?                    false  
        Position?                    named  
        Default value                ReadCommitted  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -CreateDatabaseIfNotExists <Boolean>  
        Whether to create the database file if it doesn't exist. Defaults to true.  
        Required?                    false  
        Position?                    named  
        Default value                True  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQLite package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQLite package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-SQLiteQuery 
```PowerShell 

   Invoke-SQLiteQuery  
``` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteQuery [[-ConnectionString] <string>]
    [[-DatabaseFilePath] <string>] [[-Transaction] <Object>]
    [-Queries] <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <string>  
        The connection string to the SQLite database.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQLite package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <string>  
        The path to the SQLite database file.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQLite package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Transaction <Object>  
        An existing SQLite transaction to use for the queries.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-SQLiteDatabase 
```PowerShell 

   New-SQLiteDatabase  
``` 

### SYNTAX 
```PowerShell 
New-SQLiteDatabase [-DatabaseFilePath] <string>
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQLite package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQLite package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLiteSchema 
```PowerShell 

   Get-SQLiteSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableColumnData 
```PowerShell 

   Get-SQLiteTableColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableData 
```PowerShell 

   Get-SQLiteTableData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTables 
```PowerShell 

   Get-SQLiteTables  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableSchema 
```PowerShell 

   Get-SQLiteTableSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewColumnData 
```PowerShell 

   Get-SQLiteViewColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewData 
```PowerShell 

   Get-SQLiteViewData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViews 
```PowerShell 

   Get-SQLiteViews  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewSchema 
```PowerShell 

   Get-SQLiteViewSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Invoke-SQLiteStudio 
```PowerShell 

   Invoke-SQLiteStudio  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/> 

##	EnsureSSMSInstalled 
```PowerShell 

   EnsureSSMSInstalled  
``` 

### SYNTAX 
```PowerShell 
EnsureSSMSInstalled [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTransaction 
```PowerShell 

   Get-SQLServerTransaction             --> getsqltx, newsqltx  
``` 

### SYNOPSIS 
    Creates and returns a SQL Server transaction object for batch operations.  

### SYNTAX 
```PowerShell 
Get-SQLServerTransaction [-DatabaseName] <String> [[-Server]
    <String>] [-IsolationLevel <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>]
Get-SQLServerTransaction [-ConnectionString] <String>
    [-IsolationLevel <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a SQL Server database connection and transaction object that can be used  
    for batch operations. The caller is responsible for committing or rolling back  
    the transaction. Requires an existing SQL Server database and connection.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <String>  
        The SQL Server connection string for database access.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseName <String>  
        The name of the SQL Server database. Used with Server parameter to create connection string.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <String>  
        The SQL Server instance name. Defaults to 'localhost'.  
        Required?                    false  
        Position?                    2  
        Default value                .  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <String>  
        Transaction isolation level. Defaults to ReadCommitted.  
        Required?                    false  
        Position?                    named  
        Default value                ReadCommitted  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQL Server package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQL Server package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-SqlServerQuery 
```PowerShell 

   Invoke-SQLServerQuery  
``` 

### SYNTAX 
```PowerShell 
Invoke-SQLServerQuery [[-Queries] <string[]>]
    [[-DatabaseName] <string>] [[-Server] <string>]
    [[-Transaction] <Object>] [[-ConnectionString] <string>]
    [[-SqlParameters] <hashtable[]>] [-IsolationLevel
    {ReadCommitted | ReadUncommitted | RepeatableRead |
    Serializable | Snapshot | Chaos}] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <string>  
        The connection string to the SQL database.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQL Server package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQL Server package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Transaction <Object>  
        An existing SQL Server transaction to use for the queries.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-SQLServerDatabase 
```PowerShell 

   New-SQLServerDatabase                --> nsqldb  
``` 

### SYNOPSIS 
    Creates a new SQL Server database.  

### SYNTAX 
```PowerShell 
New-SQLServerDatabase [-DatabaseName] <String> [[-Server]
    <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>]
New-SQLServerDatabase [-ConnectionString] <String>
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a new SQL Server database with the specified name on the specified server.  
    Requires appropriate permissions to create databases on the target SQL Server instance.  
    If the database already exists, the operation will be skipped.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -DatabaseName <String>  
        The name of the SQL Server database to create. Must be a valid SQL Server database name.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <String>  
        The SQL Server instance name where the database should be created. Defaults to 'localhost'.  
        Required?                    false  
        Position?                    2  
        Default value                .  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConnectionString <String>  
        Alternative connection string to use instead of Server parameter. Should connect to master database or have appropriate permissions.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQL Server package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQL Server package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLServerSchema 
```PowerShell 

   Get-SQLServerSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableColumnData 
```PowerShell 

   Get-SQLServerTableColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableData 
```PowerShell 

   Get-SQLServerTableData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTables 
```PowerShell 

   Get-SQLServerTables  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableSchema 
```PowerShell 

   Get-SQLServerTableSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewColumnData 
```PowerShell 

   Get-SQLServerViewColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewData 
```PowerShell 

   Get-SQLServerViewData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViews 
```PowerShell 

   Get-SQLServerViews  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewSchema 
```PowerShell 

   Get-SQLServerViewSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Invoke-SSMS 
```PowerShell 

   Invoke-SSMS                          --> sqlservermanagementstudio, ssms  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/> 

##	Get-KeyValueStoreNames 
```PowerShell 

   Get-KeyValueStoreNames               --> getstorenames  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-KeyValueStorePath 
```PowerShell 

   Get-KeyValueStorePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-StoreKeys 
```PowerShell 

   Get-StoreKeys                        --> getkeys  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-ValueByKeyFromStore 
```PowerShell 

   Get-ValueByKeyFromStore              --> getvalue  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Initialize-KeyValueStores 
```PowerShell 

   Initialize-KeyValueStores  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-KeyFromStore 
```PowerShell 

   Remove-KeyFromStore                  --> removekey  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-KeyValueStore 
```PowerShell 

   Remove-KeyValueStore  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-ValueByKeyInStore 
```PowerShell 

   Set-ValueByKeyInStore                --> setvalue  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Sync-KeyValueStore 
```PowerShell 

   Sync-KeyValueStore  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/> 

##	Get-GenXdevPreference 
```PowerShell 

   Get-GenXdevPreference                --> getPreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-GenXdevPreferenceNames 
```PowerShell 

   Get-GenXdevPreferenceNames           --> getPreferenceNames  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-GenXdevPreferencesDatabasePath 
```PowerShell 

   Get-GenXdevPreferencesDatabasePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-GenXdevPreference 
```PowerShell 

   Remove-GenXdevPreference             --> removePreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevDefaultPreference 
```PowerShell 

   Set-GenXdevDefaultPreference         --> setPreferenceDefault  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevPreference 
```PowerShell 

   Set-GenXdevPreference                --> setPreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevPreferencesDatabasePath 
```PowerShell 

   Set-GenXdevPreferencesDatabasePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SQLite<hr/> 

##	EnsureSQLiteStudioInstalled 
```PowerShell 

   EnsureSQLiteStudioInstalled  
``` 

### SYNTAX 
```PowerShell 
EnsureSQLiteStudioInstalled [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTransaction 
```PowerShell 

   Get-SQLiteTransaction  
``` 

### SYNOPSIS 
    Creates and returns a SQLite transaction object for batch operations.  

### SYNTAX 
```PowerShell 
Get-SQLiteTransaction [-DatabaseFilePath] <String>
    [-IsolationLevel <String>] [-CreateDatabaseIfNotExists
    <Boolean>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>]
Get-SQLiteTransaction [-ConnectionString] <String>
    [-IsolationLevel <String>] [-CreateDatabaseIfNotExists
    <Boolean>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a SQLite database connection and transaction object that can be used  
    for batch operations. The caller is responsible for committing or rolling back  
    the transaction. The connection will be automatically created if the database  
    file doesn't exist.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <String>  
        The SQLite connection string for database access.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <String>  
        The file path to the SQLite database. Will be converted to a connection string.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <String>  
        Transaction isolation level. Defaults to ReadCommitted.  
        Required?                    false  
        Position?                    named  
        Default value                ReadCommitted  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -CreateDatabaseIfNotExists <Boolean>  
        Whether to create the database file if it doesn't exist. Defaults to true.  
        Required?                    false  
        Position?                    named  
        Default value                True  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQLite package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQLite package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-SQLiteQuery 
```PowerShell 

   Invoke-SQLiteQuery  
``` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteQuery [[-ConnectionString] <string>]
    [[-DatabaseFilePath] <string>] [[-Transaction] <Object>]
    [-Queries] <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <string>  
        The connection string to the SQLite database.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQLite package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <string>  
        The path to the SQLite database file.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQLite package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Transaction <Object>  
        An existing SQLite transaction to use for the queries.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-SQLiteDatabase 
```PowerShell 

   New-SQLiteDatabase  
``` 

### SYNTAX 
```PowerShell 
New-SQLiteDatabase [-DatabaseFilePath] <string>
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQLite package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQLite package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLiteSchema 
```PowerShell 

   Get-SQLiteSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableColumnData 
```PowerShell 

   Get-SQLiteTableColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableData 
```PowerShell 

   Get-SQLiteTableData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTables 
```PowerShell 

   Get-SQLiteTables  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableSchema 
```PowerShell 

   Get-SQLiteTableSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewColumnData 
```PowerShell 

   Get-SQLiteViewColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewData 
```PowerShell 

   Get-SQLiteViewData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViews 
```PowerShell 

   Get-SQLiteViews  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewSchema 
```PowerShell 

   Get-SQLiteViewSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Invoke-SQLiteStudio 
```PowerShell 

   Invoke-SQLiteStudio  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/> 

##	EnsureSSMSInstalled 
```PowerShell 

   EnsureSSMSInstalled  
``` 

### SYNTAX 
```PowerShell 
EnsureSSMSInstalled [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTransaction 
```PowerShell 

   Get-SQLServerTransaction             --> getsqltx, newsqltx  
``` 

### SYNOPSIS 
    Creates and returns a SQL Server transaction object for batch operations.  

### SYNTAX 
```PowerShell 
Get-SQLServerTransaction [-DatabaseName] <String> [[-Server]
    <String>] [-IsolationLevel <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>]
Get-SQLServerTransaction [-ConnectionString] <String>
    [-IsolationLevel <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a SQL Server database connection and transaction object that can be used  
    for batch operations. The caller is responsible for committing or rolling back  
    the transaction. Requires an existing SQL Server database and connection.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <String>  
        The SQL Server connection string for database access.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseName <String>  
        The name of the SQL Server database. Used with Server parameter to create connection string.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <String>  
        The SQL Server instance name. Defaults to 'localhost'.  
        Required?                    false  
        Position?                    2  
        Default value                .  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <String>  
        Transaction isolation level. Defaults to ReadCommitted.  
        Required?                    false  
        Position?                    named  
        Default value                ReadCommitted  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQL Server package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQL Server package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-SqlServerQuery 
```PowerShell 

   Invoke-SQLServerQuery  
``` 

### SYNTAX 
```PowerShell 
Invoke-SQLServerQuery [[-Queries] <string[]>]
    [[-DatabaseName] <string>] [[-Server] <string>]
    [[-Transaction] <Object>] [[-ConnectionString] <string>]
    [[-SqlParameters] <hashtable[]>] [-IsolationLevel
    {ReadCommitted | ReadUncommitted | RepeatableRead |
    Serializable | Snapshot | Chaos}] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <string>  
        The connection string to the SQL database.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQL Server package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQL Server package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Transaction <Object>  
        An existing SQL Server transaction to use for the queries.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-SQLServerDatabase 
```PowerShell 

   New-SQLServerDatabase                --> nsqldb  
``` 

### SYNOPSIS 
    Creates a new SQL Server database.  

### SYNTAX 
```PowerShell 
New-SQLServerDatabase [-DatabaseName] <String> [[-Server]
    <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>]
New-SQLServerDatabase [-ConnectionString] <String>
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a new SQL Server database with the specified name on the specified server.  
    Requires appropriate permissions to create databases on the target SQL Server instance.  
    If the database already exists, the operation will be skipped.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -DatabaseName <String>  
        The name of the SQL Server database to create. Must be a valid SQL Server database name.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <String>  
        The SQL Server instance name where the database should be created. Defaults to 'localhost'.  
        Required?                    false  
        Position?                    2  
        Default value                .  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConnectionString <String>  
        Alternative connection string to use instead of Server parameter. Should connect to master database or have appropriate permissions.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQL Server package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQL Server package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLServerSchema 
```PowerShell 

   Get-SQLServerSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableColumnData 
```PowerShell 

   Get-SQLServerTableColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableData 
```PowerShell 

   Get-SQLServerTableData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTables 
```PowerShell 

   Get-SQLServerTables  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableSchema 
```PowerShell 

   Get-SQLServerTableSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewColumnData 
```PowerShell 

   Get-SQLServerViewColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewData 
```PowerShell 

   Get-SQLServerViewData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViews 
```PowerShell 

   Get-SQLServerViews  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewSchema 
```PowerShell 

   Get-SQLServerViewSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Invoke-SSMS 
```PowerShell 

   Invoke-SSMS                          --> sqlservermanagementstudio, ssms  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/> 

##	Get-KeyValueStoreNames 
```PowerShell 

   Get-KeyValueStoreNames               --> getstorenames  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-KeyValueStorePath 
```PowerShell 

   Get-KeyValueStorePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-StoreKeys 
```PowerShell 

   Get-StoreKeys                        --> getkeys  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-ValueByKeyFromStore 
```PowerShell 

   Get-ValueByKeyFromStore              --> getvalue  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Initialize-KeyValueStores 
```PowerShell 

   Initialize-KeyValueStores  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-KeyFromStore 
```PowerShell 

   Remove-KeyFromStore                  --> removekey  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-KeyValueStore 
```PowerShell 

   Remove-KeyValueStore  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-ValueByKeyInStore 
```PowerShell 

   Set-ValueByKeyInStore                --> setvalue  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Sync-KeyValueStore 
```PowerShell 

   Sync-KeyValueStore  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/> 

##	Get-GenXdevPreference 
```PowerShell 

   Get-GenXdevPreference                --> getPreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-GenXdevPreferenceNames 
```PowerShell 

   Get-GenXdevPreferenceNames           --> getPreferenceNames  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-GenXdevPreferencesDatabasePath 
```PowerShell 

   Get-GenXdevPreferencesDatabasePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-GenXdevPreference 
```PowerShell 

   Remove-GenXdevPreference             --> removePreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevDefaultPreference 
```PowerShell 

   Set-GenXdevDefaultPreference         --> setPreferenceDefault  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevPreference 
```PowerShell 

   Set-GenXdevPreference                --> setPreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevPreferencesDatabasePath 
```PowerShell 

   Set-GenXdevPreferencesDatabasePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SQLite<hr/> 

##	EnsureSQLiteStudioInstalled 
```PowerShell 

   EnsureSQLiteStudioInstalled  
``` 

### SYNTAX 
```PowerShell 
EnsureSQLiteStudioInstalled [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTransaction 
```PowerShell 

   Get-SQLiteTransaction  
``` 

### SYNOPSIS 
    Creates and returns a SQLite transaction object for batch operations.  

### SYNTAX 
```PowerShell 
Get-SQLiteTransaction [-DatabaseFilePath] <String>
    [-IsolationLevel <String>] [-CreateDatabaseIfNotExists
    <Boolean>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>]
Get-SQLiteTransaction [-ConnectionString] <String>
    [-IsolationLevel <String>] [-CreateDatabaseIfNotExists
    <Boolean>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a SQLite database connection and transaction object that can be used  
    for batch operations. The caller is responsible for committing or rolling back  
    the transaction. The connection will be automatically created if the database  
    file doesn't exist.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <String>  
        The SQLite connection string for database access.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <String>  
        The file path to the SQLite database. Will be converted to a connection string.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <String>  
        Transaction isolation level. Defaults to ReadCommitted.  
        Required?                    false  
        Position?                    named  
        Default value                ReadCommitted  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -CreateDatabaseIfNotExists <Boolean>  
        Whether to create the database file if it doesn't exist. Defaults to true.  
        Required?                    false  
        Position?                    named  
        Default value                True  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQLite package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQLite package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-SQLiteQuery 
```PowerShell 

   Invoke-SQLiteQuery  
``` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteQuery [[-ConnectionString] <string>]
    [[-DatabaseFilePath] <string>] [[-Transaction] <Object>]
    [-Queries] <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <string>  
        The connection string to the SQLite database.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQLite package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <string>  
        The path to the SQLite database file.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQLite package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Transaction <Object>  
        An existing SQLite transaction to use for the queries.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-SQLiteDatabase 
```PowerShell 

   New-SQLiteDatabase  
``` 

### SYNTAX 
```PowerShell 
New-SQLiteDatabase [-DatabaseFilePath] <string>
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQLite package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQLite package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLiteSchema 
```PowerShell 

   Get-SQLiteSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableColumnData 
```PowerShell 

   Get-SQLiteTableColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableData 
```PowerShell 

   Get-SQLiteTableData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTables 
```PowerShell 

   Get-SQLiteTables  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableSchema 
```PowerShell 

   Get-SQLiteTableSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewColumnData 
```PowerShell 

   Get-SQLiteViewColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewData 
```PowerShell 

   Get-SQLiteViewData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViews 
```PowerShell 

   Get-SQLiteViews  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewSchema 
```PowerShell 

   Get-SQLiteViewSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Invoke-SQLiteStudio 
```PowerShell 

   Invoke-SQLiteStudio  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/> 

##	EnsureSSMSInstalled 
```PowerShell 

   EnsureSSMSInstalled  
``` 

### SYNTAX 
```PowerShell 
EnsureSSMSInstalled [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTransaction 
```PowerShell 

   Get-SQLServerTransaction             --> getsqltx, newsqltx  
``` 

### SYNOPSIS 
    Creates and returns a SQL Server transaction object for batch operations.  

### SYNTAX 
```PowerShell 
Get-SQLServerTransaction [-DatabaseName] <String> [[-Server]
    <String>] [-IsolationLevel <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>]
Get-SQLServerTransaction [-ConnectionString] <String>
    [-IsolationLevel <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a SQL Server database connection and transaction object that can be used  
    for batch operations. The caller is responsible for committing or rolling back  
    the transaction. Requires an existing SQL Server database and connection.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <String>  
        The SQL Server connection string for database access.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseName <String>  
        The name of the SQL Server database. Used with Server parameter to create connection string.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <String>  
        The SQL Server instance name. Defaults to 'localhost'.  
        Required?                    false  
        Position?                    2  
        Default value                .  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <String>  
        Transaction isolation level. Defaults to ReadCommitted.  
        Required?                    false  
        Position?                    named  
        Default value                ReadCommitted  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQL Server package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQL Server package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-SqlServerQuery 
```PowerShell 

   Invoke-SQLServerQuery  
``` 

### SYNTAX 
```PowerShell 
Invoke-SQLServerQuery [[-Queries] <string[]>]
    [[-DatabaseName] <string>] [[-Server] <string>]
    [[-Transaction] <Object>] [[-ConnectionString] <string>]
    [[-SqlParameters] <hashtable[]>] [-IsolationLevel
    {ReadCommitted | ReadUncommitted | RepeatableRead |
    Serializable | Snapshot | Chaos}] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <string>  
        The connection string to the SQL database.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQL Server package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQL Server package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Transaction <Object>  
        An existing SQL Server transaction to use for the queries.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-SQLServerDatabase 
```PowerShell 

   New-SQLServerDatabase                --> nsqldb  
``` 

### SYNOPSIS 
    Creates a new SQL Server database.  

### SYNTAX 
```PowerShell 
New-SQLServerDatabase [-DatabaseName] <String> [[-Server]
    <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>]
New-SQLServerDatabase [-ConnectionString] <String>
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a new SQL Server database with the specified name on the specified server.  
    Requires appropriate permissions to create databases on the target SQL Server instance.  
    If the database already exists, the operation will be skipped.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -DatabaseName <String>  
        The name of the SQL Server database to create. Must be a valid SQL Server database name.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <String>  
        The SQL Server instance name where the database should be created. Defaults to 'localhost'.  
        Required?                    false  
        Position?                    2  
        Default value                .  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConnectionString <String>  
        Alternative connection string to use instead of Server parameter. Should connect to master database or have appropriate permissions.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQL Server package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQL Server package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLServerSchema 
```PowerShell 

   Get-SQLServerSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableColumnData 
```PowerShell 

   Get-SQLServerTableColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableData 
```PowerShell 

   Get-SQLServerTableData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTables 
```PowerShell 

   Get-SQLServerTables  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableSchema 
```PowerShell 

   Get-SQLServerTableSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewColumnData 
```PowerShell 

   Get-SQLServerViewColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewData 
```PowerShell 

   Get-SQLServerViewData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViews 
```PowerShell 

   Get-SQLServerViews  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewSchema 
```PowerShell 

   Get-SQLServerViewSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Invoke-SSMS 
```PowerShell 

   Invoke-SSMS                          --> sqlservermanagementstudio, ssms  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.KeyValueStore<hr/> 

##	Get-KeyValueStoreNames 
```PowerShell 

   Get-KeyValueStoreNames               --> getstorenames  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-KeyValueStorePath 
```PowerShell 

   Get-KeyValueStorePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-StoreKeys 
```PowerShell 

   Get-StoreKeys                        --> getkeys  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-ValueByKeyFromStore 
```PowerShell 

   Get-ValueByKeyFromStore              --> getvalue  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Initialize-KeyValueStores 
```PowerShell 

   Initialize-KeyValueStores  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-KeyFromStore 
```PowerShell 

   Remove-KeyFromStore                  --> removekey  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-KeyValueStore 
```PowerShell 

   Remove-KeyValueStore  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-ValueByKeyInStore 
```PowerShell 

   Set-ValueByKeyInStore                --> setvalue  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Sync-KeyValueStore 
```PowerShell 

   Sync-KeyValueStore  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.Preferences<hr/> 

##	Get-GenXdevPreference 
```PowerShell 

   Get-GenXdevPreference                --> getPreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-GenXdevPreferenceNames 
```PowerShell 

   Get-GenXdevPreferenceNames           --> getPreferenceNames  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-GenXdevPreferencesDatabasePath 
```PowerShell 

   Get-GenXdevPreferencesDatabasePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Remove-GenXdevPreference 
```PowerShell 

   Remove-GenXdevPreference             --> removePreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevDefaultPreference 
```PowerShell 

   Set-GenXdevDefaultPreference         --> setPreferenceDefault  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevPreference 
```PowerShell 

   Set-GenXdevPreference                --> setPreference  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-GenXdevPreferencesDatabasePath 
```PowerShell 

   Set-GenXdevPreferencesDatabasePath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SQLite<hr/> 

##	EnsureSQLiteStudioInstalled 
```PowerShell 

   EnsureSQLiteStudioInstalled  
``` 

### SYNTAX 
```PowerShell 
EnsureSQLiteStudioInstalled [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTransaction 
```PowerShell 

   Get-SQLiteTransaction  
``` 

### SYNOPSIS 
    Creates and returns a SQLite transaction object for batch operations.  

### SYNTAX 
```PowerShell 
Get-SQLiteTransaction [-DatabaseFilePath] <String>
    [-IsolationLevel <String>] [-CreateDatabaseIfNotExists
    <Boolean>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>]
Get-SQLiteTransaction [-ConnectionString] <String>
    [-IsolationLevel <String>] [-CreateDatabaseIfNotExists
    <Boolean>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a SQLite database connection and transaction object that can be used  
    for batch operations. The caller is responsible for committing or rolling back  
    the transaction. The connection will be automatically created if the database  
    file doesn't exist.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <String>  
        The SQLite connection string for database access.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <String>  
        The file path to the SQLite database. Will be converted to a connection string.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <String>  
        Transaction isolation level. Defaults to ReadCommitted.  
        Required?                    false  
        Position?                    named  
        Default value                ReadCommitted  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -CreateDatabaseIfNotExists <Boolean>  
        Whether to create the database file if it doesn't exist. Defaults to true.  
        Required?                    false  
        Position?                    named  
        Default value                True  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQLite package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQLite package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-SQLiteQuery 
```PowerShell 

   Invoke-SQLiteQuery  
``` 

### SYNTAX 
```PowerShell 
Invoke-SQLiteQuery [[-ConnectionString] <string>]
    [[-DatabaseFilePath] <string>] [[-Transaction] <Object>]
    [-Queries] <string[]> [[-SqlParameters] <hashtable[]>]
    [-IsolationLevel {ReadCommitted | ReadUncommitted |
    RepeatableRead | Serializable | Snapshot | Chaos}]
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <string>  
        The connection string to the SQLite database.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQLite package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <string>  
        The path to the SQLite database file.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      dbpath, indexpath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQLite package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    true  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Transaction <Object>  
        An existing SQLite transaction to use for the queries.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-SQLiteDatabase 
```PowerShell 

   New-SQLiteDatabase  
``` 

### SYNTAX 
```PowerShell 
New-SQLiteDatabase [-DatabaseFilePath] <string>
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQLite package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseFilePath <string>  
        The path to the SQLite database file  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQLite package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLiteSchema 
```PowerShell 

   Get-SQLiteSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableColumnData 
```PowerShell 

   Get-SQLiteTableColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableData 
```PowerShell 

   Get-SQLiteTableData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTables 
```PowerShell 

   Get-SQLiteTables  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteTableSchema 
```PowerShell 

   Get-SQLiteTableSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewColumnData 
```PowerShell 

   Get-SQLiteViewColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewData 
```PowerShell 

   Get-SQLiteViewData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViews 
```PowerShell 

   Get-SQLiteViews  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLiteViewSchema 
```PowerShell 

   Get-SQLiteViewSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Invoke-SQLiteStudio 
```PowerShell 

   Invoke-SQLiteStudio  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Data.SqlServer<hr/> 

##	EnsureSSMSInstalled 
```PowerShell 

   EnsureSSMSInstalled  
``` 

### SYNTAX 
```PowerShell 
EnsureSSMSInstalled [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTransaction 
```PowerShell 

   Get-SQLServerTransaction             --> getsqltx, newsqltx  
``` 

### SYNOPSIS 
    Creates and returns a SQL Server transaction object for batch operations.  

### SYNTAX 
```PowerShell 
Get-SQLServerTransaction [-DatabaseName] <String> [[-Server]
    <String>] [-IsolationLevel <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>]
Get-SQLServerTransaction [-ConnectionString] <String>
    [-IsolationLevel <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a SQL Server database connection and transaction object that can be used  
    for batch operations. The caller is responsible for committing or rolling back  
    the transaction. Requires an existing SQL Server database and connection.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <String>  
        The SQL Server connection string for database access.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseName <String>  
        The name of the SQL Server database. Used with Server parameter to create connection string.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <String>  
        The SQL Server instance name. Defaults to 'localhost'.  
        Required?                    false  
        Position?                    2  
        Default value                .  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <String>  
        Transaction isolation level. Defaults to ReadCommitted.  
        Required?                    false  
        Position?                    named  
        Default value                ReadCommitted  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQL Server package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQL Server package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-SqlServerQuery 
```PowerShell 

   Invoke-SQLServerQuery  
``` 

### SYNTAX 
```PowerShell 
Invoke-SQLServerQuery [[-Queries] <string[]>]
    [[-DatabaseName] <string>] [[-Server] <string>]
    [[-Transaction] <Object>] [[-ConnectionString] <string>]
    [[-SqlParameters] <hashtable[]>] [-IsolationLevel
    {ReadCommitted | ReadUncommitted | RepeatableRead |
    Serializable | Snapshot | Chaos}] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ConnectionString <string>  
        The connection string to the SQL database.  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation  
        Automatically consent to third-party software installation and set persistent flag for SQL Server package.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DatabaseName <string>  
        The name of the SQL Server database.  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent  
        Force a consent prompt even if preference is set for SQL Server package installation.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IsolationLevel <string>  
        The isolation level to use. default is ReadCommitted.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Queries <string[]>  
        The query or queries to execute.  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <string>  
        The SQL Server instance name.  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SqlParameters <hashtable[]>  
        Query parameters as hashtables.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      data, parameters, args  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Transaction <Object>  
        An existing SQL Server transaction to use for the queries.  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-SQLServerDatabase 
```PowerShell 

   New-SQLServerDatabase                --> nsqldb  
``` 

### SYNOPSIS 
    Creates a new SQL Server database.  

### SYNTAX 
```PowerShell 
New-SQLServerDatabase [-DatabaseName] <String> [[-Server]
    <String>] [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>]
New-SQLServerDatabase [-ConnectionString] <String>
    [-ForceConsent]
    [-ConsentToThirdPartySoftwareInstallation] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Creates a new SQL Server database with the specified name on the specified server.  
    Requires appropriate permissions to create databases on the target SQL Server instance.  
    If the database already exists, the operation will be skipped.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -DatabaseName <String>  
        The name of the SQL Server database to create. Must be a valid SQL Server database name.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Server <String>  
        The SQL Server instance name where the database should be created. Defaults to 'localhost'.  
        Required?                    false  
        Position?                    2  
        Default value                .  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConnectionString <String>  
        Alternative connection string to use instead of Server parameter. Should connect to master database or have appropriate permissions.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ForceConsent [<SwitchParameter>]  
        Force a consent prompt even if a preference is already set for SQL Server package  
        installation, overriding any saved consent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ConsentToThirdPartySoftwareInstallation [<SwitchParameter>]  
        Automatically consent to third-party software installation and set a persistent  
        preference flag for SQL Server package, bypassing interactive consent prompts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-SQLServerSchema 
```PowerShell 

   Get-SQLServerSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableColumnData 
```PowerShell 

   Get-SQLServerTableColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableData 
```PowerShell 

   Get-SQLServerTableData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTables 
```PowerShell 

   Get-SQLServerTables  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerTableSchema 
```PowerShell 

   Get-SQLServerTableSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewColumnData 
```PowerShell 

   Get-SQLServerViewColumnData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewData 
```PowerShell 

   Get-SQLServerViewData  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViews 
```PowerShell 

   Get-SQLServerViews  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-SQLServerViewSchema 
```PowerShell 

   Get-SQLServerViewSchema  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Invoke-SSMS 
```PowerShell 

   Invoke-SSMS                          --> sqlservermanagementstudio, ssms  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
