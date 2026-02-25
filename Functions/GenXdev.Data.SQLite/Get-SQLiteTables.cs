// ################################################################################
// Part of PowerShell module : GenXdev.Data.SQLite
// Original cmdlet filename  : Get-SQLiteTables.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 3.3.2026
// ################################################################################
// Copyright (c)  René Vaessen / GenXdev
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ################################################################################



using System.Management.Automation;

namespace GenXdev.Data.SQLite
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves a list of table names from a SQLite database.
    /// </para>
    ///
    /// <para type="description">
    /// Queries the sqlite_master system table to retrieve all user-defined table names
    /// from a SQLite database. Supports connecting via either a direct connection string
    /// or a database file path. Returns the table names as a collection of strings.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;string&gt;<br/>
    /// The full connection string to connect to the SQLite database. Should include the
    /// Data Source and Version parameters at minimum.<br/>
    /// - <b>Position</b>: 0<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseFilePath &lt;string&gt;<br/>
    /// The full filesystem path to the SQLite database file. The function will create
    /// an appropriate connection string internally.<br/>
    /// - <b>Position</b>: 0<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get-SQLiteTables -DatabaseFilePath "C:\Databases\Inventory.sqlite"</para>
    /// <para>Returns all table names from the specified database file</para>
    /// <code>
    /// Get-SQLiteTables -DatabaseFilePath "C:\Databases\Inventory.sqlite"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get-SQLiteTables -ConnectionString "Data Source=C:\DB\Users.sqlite;Version=3;"</para>
    /// <para>Returns all table names using a custom connection string</para>
    /// <code>
    /// Get-SQLiteTables -ConnectionString "Data Source=C:\DB\Users.sqlite;Version=3;"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLiteTables")]
    [OutputType(typeof(PSObject))]
    public class GetSQLiteTablesCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The full connection string to connect to the SQLite database. Should include the
        /// Data Source and Version parameters at minimum.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQLite database.")]
        public string ConnectionString { get; set; }

        /// <summary>
        /// The full filesystem path to the SQLite database file. The function will create
        /// an appropriate connection string internally.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ParameterSetName = "DatabaseFilePath",
            HelpMessage = "The path to the SQLite database file.")]
        [ValidateNotNullOrEmpty]
        public string DatabaseFilePath { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Starting SQLite table name retrieval operation");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // define the query to get all table names from sqlite_master
            string query = "SELECT name FROM sqlite_master WHERE type='table'";

            // execute query using the inherited connection parameters
            WriteVerbose("Executing query to retrieve table names");

            string script;
            if (ParameterSetName == "ConnectionString")
            {
                script = $"GenXdev.Data\\Invoke-SQLiteQuery -ConnectionString '{ConnectionString}' -Queries '{query}'";
            }
            else
            {
                script = $"GenXdev.Data\\Invoke-SQLiteQuery -DatabaseFilePath '{DatabaseFilePath}' -Queries '{query}'";
            }

            var results = InvokeCommand.InvokeScript(script);
            WriteObject(results, true);
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            // No cleanup needed
        }
    }
}