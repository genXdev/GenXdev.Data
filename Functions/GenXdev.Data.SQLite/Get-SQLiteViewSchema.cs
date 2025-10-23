// ################################################################################
// Part of PowerShell module : GenXdev.Data.SQLite
// Original cmdlet filename  : Get-SQLiteViewSchema.cs
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



using System;
using System.Collections;
using System.Management.Automation;

namespace GenXdev.Data.SQLite
{

    /// <summary>
    /// <para type="synopsis">
    /// Retrieves the SQL schema definition for a SQLite view.
    /// </para>
    ///
    /// <para type="description">
    /// Queries the SQLite master table to extract the SQL definition of the requested view. The
    /// cmdlet mirrors the legacy PowerShell implementation to maintain identical parameter
    /// handling, verbose messaging, and returned data.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;string&gt;<br/>
    /// Specifies the SQLite connection string used to reach the database.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Parameter Set</b>: ConnectionString<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseFilePath &lt;string&gt;<br/>
    /// Specifies the path to the SQLite database file.<br/>
    /// - <b>Aliases</b>: dbpath, indexpath<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Parameter Set</b>: DatabaseFilePath<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ViewName &lt;string&gt;<br/>
    /// Specifies the name of the view whose schema must be retrieved.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Retrieve view schema using a database file path</para>
    /// <para>This example mirrors the PowerShell script by retrieving the view definition.</para>
    /// <code>
    /// Get-SQLiteViewSchema -DatabaseFilePath "C:\\Data\\MyDb.sqlite" -ViewName "CustomerView"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLiteViewSchema", DefaultParameterSetName = "Default")]
    [OutputType(typeof(PSObject))]
    public class GetSQLiteViewSchemaCommand : PSGenXdevCmdlet
    {

        /// <summary>
        /// Specifies the SQLite connection string used to reach the database.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQLite database.")]
        public string ConnectionString { get; set; }

        /// <summary>
        /// Specifies the path to the SQLite database file.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "DatabaseFilePath",
            HelpMessage = "The path to the SQLite database file.")]
        [Alias("dbpath", "indexpath")]
        [ValidateNotNullOrEmpty]
        public string DatabaseFilePath { get; set; }

        /// <summary>
        /// Specifies the name of the view whose schema must be retrieved.
        /// </summary>
        [Parameter(
            Position = 1,
            Mandatory = true,
            HelpMessage = "The name of the view.")]
        public string ViewName { get; set; }

        // Cached script block to invoke the legacy Invoke-SQLiteQuery command efficiently.
        private static readonly ScriptBlock InvokeSQLiteQueryScript = ScriptBlock.Create(
            "param($params) GenXdev.Data\\Invoke-SQLiteQuery @params");

        /// <summary>
        /// Begin processing - initialization logic.
        /// </summary>
        protected override void BeginProcessing()
        {

            // Emit verbose logging to match the PowerShell script's begin block.
            WriteVerbose("Retrieving schema for view: " + ViewName);
        }

        /// <summary>
        /// Process record - main cmdlet logic.
        /// </summary>
        protected override void ProcessRecord()
        {

            // Compose the exact SQL query string used by the PowerShell implementation.
            string query = "SELECT sql FROM sqlite_master WHERE name = '" + ViewName + "'";

            // Emit verbose messaging identical to the original function.
            WriteVerbose("Executing query: " + query);

            // Create a case-insensitive hashtable to mirror $PSBoundParameters behavior.
            Hashtable parameters = new Hashtable(StringComparer.OrdinalIgnoreCase);

            // Copy each caller-supplied argument into the hashtable without alteration.
            foreach (var entry in MyInvocation.BoundParameters)
            {

                // Preserve the original key-value pairs passed to the cmdlet.
                parameters[entry.Key] = entry.Value;
            }

            // Add the Queries entry just like $PSBoundParameters['Queries'] = $query.
            parameters["Queries"] = query;

            // Invoke Invoke-SQLiteQuery through the cached script block to maintain behavior.
            var results = InvokeSQLiteQueryScript.Invoke(parameters);

            // Emit the resulting objects while preserving pipeline enumeration semantics.
            WriteObject(results, true);
        }

        /// <summary>
        /// End processing - cleanup logic.
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}
