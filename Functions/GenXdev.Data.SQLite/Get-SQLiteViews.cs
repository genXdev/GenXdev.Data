// ################################################################################
// Part of PowerShell module : GenXdev.Data.SQLite
// Original cmdlet filename  : Get-SQLiteViews.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 1.302.2025
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



using System;
using System.Collections;
using System.Management.Automation;

namespace GenXdev.Data.SQLite
{

    /// <summary>
    /// <para type="synopsis">
    /// Retrieves a list of views from a SQLite database.
    /// </para>
    ///
    /// <para type="description">
    /// Queries the sqlite_master system table to return all view names present in a
    /// SQLite database. Supports connecting through either a connection string or a
    /// database file path parameter set to ensure flexible usage scenarios.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;string&gt;<br/>
    /// The connection string to the SQLite database. Use this when custom connection
    /// parameters are required for the operation.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// - <b>ParameterSetName</b>: ConnectionString<br/>
    /// - <b>HelpMessage</b>: The connection string to the SQLite database.<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseFilePath &lt;string&gt;<br/>
    /// The full path to the SQLite database file. Use this for file-based database
    /// connections that do not require specialized connection string options.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// - <b>ParameterSetName</b>: DatabaseFilePath<br/>
    /// - <b>HelpMessage</b>: The path to the SQLite database file.<br/>
    /// </para>
    ///
    /// <example>
    /// <para>
    /// Get-SQLiteViews -DatabaseFilePath "C:\Databases\MyDatabase.sqlite"
    /// </para>
    /// <para>
    /// Retrieves all view names from the specified SQLite database file.
    /// </para>
    /// <code>
    /// Get-SQLiteViews -DatabaseFilePath "C:\Databases\MyDatabase.sqlite"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>
    /// Get-SQLiteViews -ConnectionString
    /// "Data Source=C:\Databases\MyDatabase.sqlite;Version=3;"
    /// </para>
    /// <para>
    /// Retrieves all view names using a custom SQLite connection string.
    /// </para>
    /// <code>
    /// Get-SQLiteViews -ConnectionString "Data Source=C:\Databases\MyDatabase.sqlite;Version=3;"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLiteViews")]
    [OutputType(typeof(object))]
    public class GetSQLiteViewsCommand : PSGenXdevCmdlet
    {

        /// <summary>
        /// The connection string to the SQLite database. Use this when custom connection
        /// parameters need to be specified for the query execution.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQLite database.")]
        public string ConnectionString { get; set; }

        /// <summary>
        /// The full path to the SQLite database file. Ideal for simple database
        /// connections where only the file path is required.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ParameterSetName = "DatabaseFilePath",
            HelpMessage = "The path to the SQLite database file.")]
        public string DatabaseFilePath { get; set; }

        /// <summary>
        /// Begin processing - initialization logic.
        /// </summary>
        protected override void BeginProcessing()
        {

            WriteVerbose("Preparing to retrieve SQLite views...");
        }

        /// <summary>
        /// Process record - main cmdlet logic executed for each invocation.
        /// </summary>
        protected override void ProcessRecord()
        {

            // Define the SQLite query that retrieves all view names from sqlite_master.
            const string query = "SELECT name FROM sqlite_master WHERE type='view'";

            WriteVerbose("Executing query: " + query);

            // Create a hashtable to mirror PSBoundParameters for downstream usage.
            var parameters = new Hashtable(StringComparer.OrdinalIgnoreCase);

            // Copy every bound parameter into the hashtable to maintain parity with PowerShell.
            foreach (var entry in MyInvocation.BoundParameters)
            {

                parameters[entry.Key] = entry.Value;
            }

            // Ensure the query parameter matches the PowerShell implementation behavior.
            parameters["Queries"] = new[] { query };

            // Build the script text that safely invokes the existing PowerShell cmdlet.
            const string invocationScript = "param($params)\r\nGenXdev.Data\\Invoke-SQLiteQuery @params";

            // Create the script block once to leverage PowerShell invocation semantics.
            var scriptBlock = ScriptBlock.Create(invocationScript);

            // Invoke the script through InvokeCommand to honor the current PowerShell context.
            var results = InvokeCommand.InvokeScript(
                useLocalScope: false,
                scriptBlock: scriptBlock,
                input: null,
                args: new object[] { parameters });

            // Write each returned object to the pipeline to preserve streaming behavior.
            foreach (var result in results)
            {

                WriteObject(result.BaseObject);
            }
        }

        /// <summary>
        /// End processing - cleanup logic.
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}
