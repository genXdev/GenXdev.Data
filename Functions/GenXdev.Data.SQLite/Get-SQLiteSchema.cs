// ################################################################################
// Part of PowerShell module : GenXdev.Data.SQLite
// Original cmdlet filename  : Get-SQLiteSchema.cs
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
using System.Collections.Generic;
using System.Management.Automation;

namespace GenXdev.Data.SQLite
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves the complete schema information from a SQLite database.
    /// </para>
    ///
    /// <para type="description">
    /// This function queries the sqlite_master table to obtain the complete schema
    /// definition of a SQLite database, including tables, views, indexes and triggers.
    /// It accepts either a connection string or a direct path to the database file.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;string&gt;<br/>
    /// The SQLite connection string that specifies the database location and any
    /// additional connection parameters.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseFilePath &lt;string&gt;<br/>
    /// The direct filesystem path to the SQLite database file.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get-SQLiteSchema -DatabaseFilePath "C:\Databases\inventory.db"</para>
    /// <para>This example retrieves the schema from a SQLite database file located at "C:\Databases\inventory.db".</para>
    /// <code>
    /// Get-SQLiteSchema -DatabaseFilePath "C:\Databases\inventory.db"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get-SQLiteSchema -ConnectionString "Data Source=C:\Databases\inventory.db;Version=3;"</para>
    /// <para>This example retrieves the schema using a connection string specifying the database location.</para>
    /// <code>
    /// Get-SQLiteSchema -ConnectionString "Data Source=C:\Databases\inventory.db;Version=3;"
    /// </code>
    /// </example>
    ///
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLiteSchema")]
    [OutputType(typeof(PSObject))]
    public class GetSQLiteSchemaCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The SQLite connection string that specifies the database location and any
        /// additional connection parameters.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQLite database.")]
        public string ConnectionString { get; set; }

        /// <summary>
        /// The direct filesystem path to the SQLite database file.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "DatabaseFilePath",
            HelpMessage = "The path to the SQLite database file.")]
        public string DatabaseFilePath { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Using parameter set: " + ParameterSetName);
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Build the script to invoke Invoke-SQLiteQuery with the appropriate parameters
            string script = "GenXdev.Data\\Invoke-SQLiteQuery -Queries 'SELECT * FROM sqlite_master'";
            if (ConnectionString != null)
            {
                script += " -ConnectionString '" + ConnectionString.Replace("'", "''") + "'";
            }
            else
            {
                script += " -DatabaseFilePath '" + DatabaseFilePath.Replace("'", "''") + "'";
            }

            // Invoke the PowerShell script and get the results
            var results = InvokeCommand.InvokeScript(script);

            // Write each result object to the pipeline
            foreach (var result in results)
            {
                WriteObject(result);
            }
        }
    }

}