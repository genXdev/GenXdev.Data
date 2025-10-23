// ################################################################################
// Part of PowerShell module : GenXdev.Data.SQLite
// Original cmdlet filename  : Get-SQLiteTableSchema.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 2.1.2025
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
    /// Retrieves the schema information for a specified SQLite table.
    /// </para>
    ///
    /// <para type="description">
    /// This cmdlet queries the SQLite database to get detailed schema information for
    /// a specified table. It uses the SQLite PRAGMA table_info command to return column
    /// definitions including names, types, nullable status, and default values.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;string&gt;<br/>
    /// Specifies the SQLite connection string in the format: "Data Source=path_to_database_file"<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>ParameterSet</b>: ConnectionString<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseFilePath &lt;string&gt;<br/>
    /// Specifies the direct file path to the SQLite database file. This is converted internally to a connection string.<br/>
    /// - <b>Aliases</b>: dbpath, indexpath<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>ParameterSet</b>: DatabaseFilePath<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -TableName &lt;string&gt;<br/>
    /// Specifies the name of the table for which to retrieve schema information.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get schema information for a table using database file path</para>
    /// <para>This example retrieves the schema for the "Users" table from a SQLite database file.</para>
    /// <code>
    /// Get-SQLiteTableSchema -DatabaseFilePath "C:\Databases\mydb.sqlite" -TableName "Users"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get schema information for a table using connection string</para>
    /// <para>This example retrieves the schema for the "Products" table using a connection string.</para>
    /// <code>
    /// Get-SQLiteTableSchema -ConnectionString "Data Source=C:\Databases\mydb.sqlite" -TableName "Products"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLiteTableSchema", DefaultParameterSetName = "Default")]
    [OutputType(typeof(PSObject[]))]
    public class GetSQLiteTableSchemaCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Specifies the SQLite connection string in the format: "Data Source=path_to_database_file"
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQLite database")]
        [ValidateNotNullOrEmpty]
        public string ConnectionString { get; set; }

        /// <summary>
        /// Specifies the direct file path to the SQLite database file. This is converted internally to a connection string.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "DatabaseFilePath",
            HelpMessage = "The path to the SQLite database file")]
        [Alias("dbpath", "indexpath")]
        [ValidateNotNullOrEmpty]
        public string DatabaseFilePath { get; set; }

        /// <summary>
        /// Specifies the name of the table for which to retrieve schema information.
        /// </summary>
        [Parameter(
            Position = 1,
            Mandatory = true,
            HelpMessage = "The name of the table")]
        [ValidateNotNullOrEmpty]
        public string TableName { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose($"Preparing to retrieve schema for table '{TableName}'");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Construct the PRAGMA query to get detailed table column information
            string queries = $"PRAGMA table_info({TableName})";

            // Log the execution of the schema query
            WriteVerbose("Executing schema query against SQLite database");

            // Build the script to call Invoke-SQLiteQuery with the appropriate parameters
            string script = "GenXdev.Data\\Invoke-SQLiteQuery";

            // Add parameters based on parameter set
            if (ParameterSetName == "ConnectionString")
            {
                script += $" -ConnectionString '{ConnectionString.Replace("'", "''")}'";
            }
            else if (ParameterSetName == "DatabaseFilePath")
            {
                script += $" -DatabaseFilePath '{DatabaseFilePath.Replace("'", "''")}'";
            }

            script += $" -TableName '{TableName.Replace("'", "''")}'";
            script += $" -Queries '{queries.Replace("'", "''")}'";

            // Execute the query and return results using existing Invoke-SQLiteQuery
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