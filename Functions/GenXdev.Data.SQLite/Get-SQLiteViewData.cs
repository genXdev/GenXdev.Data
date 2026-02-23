// ################################################################################
// Part of PowerShell module : GenXdev.Data.SQLite
// Original cmdlet filename  : Get-SQLiteViewData.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 2.3.2026
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
    /// Retrieves data from a SQLite database view with optional record limiting.
    /// </para>
    ///
    /// <para type="description">
    /// Queries a SQLite database view using either a connection string or database file
    /// path. The function supports limiting the number of returned records and provides
    /// verbose output for tracking query execution.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;string&gt;<br/>
    /// The connection string to connect to the SQLite database. This parameter is
    /// mutually exclusive with DatabaseFilePath.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Parameter Set</b>: ConnectionString<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseFilePath &lt;string&gt;<br/>
    /// The file path to the SQLite database file. This parameter is mutually exclusive
    /// with ConnectionString.<br/>
    /// - <b>Aliases</b>: dbpath, indexpath<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Parameter Set</b>: DatabaseFilePath<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ViewName &lt;string&gt;<br/>
    /// The name of the view from which to retrieve data.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Count &lt;int&gt;<br/>
    /// The maximum number of records to return. Use -1 to return all records.
    /// Defaults to 100 if not specified.<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Default</b>: 100<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get data from a SQLite view with a limit</para>
    /// <para>This example retrieves up to 50 records from the CustomerView in the specified database.</para>
    /// <code>
    /// Get-SQLiteViewData -DatabaseFilePath "C:\MyDb.sqlite" -ViewName "CustomerView" -Count 50
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get all data from a SQLite view using positional parameters</para>
    /// <para>This example retrieves all records from the CustomerView using positional parameters.</para>
    /// <code>
    /// Get-SQLiteViewData "C:\MyDb.sqlite" "CustomerView"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLiteViewData")]
    [OutputType(typeof(PSObject))]
    public class GetSQLiteViewDataCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The connection string to connect to the SQLite database.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQLite database.")]
        [ValidateNotNullOrEmpty]
        public string ConnectionString { get; set; }

        /// <summary>
        /// The file path to the SQLite database file.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ParameterSetName = "DatabaseFilePath",
            HelpMessage = "The path to the SQLite database file.")]
        [Alias("dbpath", "indexpath")]
        [ValidateNotNullOrEmpty]
        public string DatabaseFilePath { get; set; }

        /// <summary>
        /// The name of the view from which to retrieve data.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 1,
            HelpMessage = "The name of the view to query.")]
        [ValidateNotNullOrEmpty]
        public string ViewName { get; set; }

        /// <summary>
        /// The maximum number of records to return.
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 2,
            HelpMessage = "Number of records to return. -1 for all records.")]
        [ValidateRange(-1, int.MaxValue)]
        public int Count { get; set; } = 100;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Starting Get-SQLiteViewData for view: " + ViewName);
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Construct query with optional record limit
            string query = (Count == -1) ? $"SELECT * FROM {ViewName}" : $"SELECT * FROM {ViewName} LIMIT {Count}";

            WriteVerbose("Executing query: " + query);

            // Build the script to call Invoke-SQLiteQuery
            string script = "GenXdev.Data\\Invoke-SQLiteQuery -Queries '" + query.Replace("'", "''") + "' -ViewName '" + ViewName.Replace("'", "''") + "' -Count " + Count;

            if (ParameterSetName == "ConnectionString")
            {
                script += " -ConnectionString '" + ConnectionString.Replace("'", "''") + "'";
            }
            else
            {
                script += " -DatabaseFilePath '" + DatabaseFilePath.Replace("'", "''") + "'";
            }

            // Execute the query and return results
            var results = InvokeCommand.InvokeScript(script);

            WriteObject(results, true);
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            WriteVerbose("Completed querying view: " + ViewName);
        }
    }
}