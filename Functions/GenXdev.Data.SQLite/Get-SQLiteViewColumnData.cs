// ################################################################################
// Part of PowerShell module : GenXdev.Data.SQLite
// Original cmdlet filename  : Get-SQLiteViewColumnData.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 1.304.2025
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



using System.Collections;
using System.Management.Automation;

namespace GenXdev.Data.SQLite
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves column data from a SQLite view with optional record limiting.
    /// </para>
    ///
    /// <para type="description">
    /// Executes a SELECT query against a specified SQLite view to retrieve data from a
    /// single column. Supports connecting via either a connection string or database file
    /// path. Allows limiting the number of returned records or retrieving all records.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;String&gt;<br/>
    /// The SQLite database connection string. This parameter is mutually exclusive with
    /// DatabaseFilePath.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Parameter Set</b>: ConnectionString<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseFilePath &lt;String&gt;<br/>
    /// The full path to the SQLite database file. This parameter is mutually exclusive
    /// with ConnectionString.<br/>
    /// - <b>Aliases</b>: dbpath, indexpath<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Parameter Set</b>: DatabaseFilePath<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ViewName &lt;String&gt;<br/>
    /// The name of the SQLite view to query data from.<br/>
    /// - <b>Position</b>: 1<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ColumnName &lt;String&gt;<br/>
    /// The name of the column within the view to retrieve data from.<br/>
    /// - <b>Position</b>: 2<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Count &lt;Int32&gt;<br/>
    /// The maximum number of records to return. Use -1 to return all records. Defaults
    /// to 100 if not specified.<br/>
    /// - <b>Position</b>: 3<br/>
    /// - <b>Default</b>: 100<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get column data from a SQLite view with record limiting</para>
    /// <para>This example retrieves up to 50 email addresses from the CustomersView in the specified SQLite database.</para>
    /// <code>
    /// Get-SQLiteViewColumnData -DatabaseFilePath "C:\MyDB.sqlite" `
    ///     -ViewName "CustomersView" `
    ///     -ColumnName "Email" `
    ///     -Count 50
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get all column data from a SQLite view using positional parameters</para>
    /// <para>This example retrieves all email addresses from the CustomersView using positional parameter binding.</para>
    /// <code>
    /// Get-SQLiteViewColumnData "C:\MyDB.sqlite" "CustomersView" "Email"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLiteViewColumnData")]
    [OutputType(typeof(object))]
    public class GetSQLiteViewColumnDataCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The SQLite database connection string. This parameter is mutually exclusive with DatabaseFilePath.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQLite database.")]
        public string ConnectionString { get; set; }

        /// <summary>
        /// The full path to the SQLite database file. This parameter is mutually exclusive with ConnectionString.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ParameterSetName = "DatabaseFilePath",
            HelpMessage = "The path to the SQLite database file.")]
        [ValidateNotNullOrEmpty]
        [Alias("dbpath", "indexpath")]
        public string DatabaseFilePath { get; set; }

        /// <summary>
        /// The name of the SQLite view to query data from.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 1,
            HelpMessage = "The name of the view.")]
        public string ViewName { get; set; }

        /// <summary>
        /// The name of the column within the view to retrieve data from.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 2,
            HelpMessage = "The name of the column.")]
        public string ColumnName { get; set; }

        /// <summary>
        /// The maximum number of records to return. Use -1 to return all records. Defaults to 100 if not specified.
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 3,
            HelpMessage = "The number of records to return. Default is 100. -1 for all.")]
        public int Count { get; set; } = 100;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Log the start of the operation
            WriteVerbose("Starting Get-SQLiteViewColumnData for view '" + ViewName + "'");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Determine the query based on Count parameter
            string query;
            string verboseMessage;

            if (Count == -1)
            {
                // Construct query to get all records
                query = "SELECT " + ColumnName + " FROM " + ViewName;
                verboseMessage = "Querying all records from view '" + ViewName + "'";
            }
            else
            {
                // Construct query with LIMIT clause
                query = "SELECT " + ColumnName + " FROM " + ViewName + " LIMIT " + Count;
                verboseMessage = "Querying " + Count + " records from view '" + ViewName + "'";
            }

            // Log the query operation
            WriteVerbose(verboseMessage);

            // Prepare parameters for Invoke-SQLiteQuery
            var parameters = new Hashtable();
            if (ConnectionString != null)
            {
                parameters["ConnectionString"] = ConnectionString;
            }
            if (DatabaseFilePath != null)
            {
                parameters["DatabaseFilePath"] = DatabaseFilePath;
            }
            parameters["ViewName"] = ViewName;
            parameters["ColumnName"] = ColumnName;
            parameters["Count"] = Count;
            parameters["Queries"] = query;

            // Execute the query using the existing Invoke-SQLiteQuery cmdlet
            var scriptBlock = ScriptBlock.Create("GenXdev.Data\\Invoke-SQLiteQuery @args");
            var results = scriptBlock.Invoke(parameters);

            // Output the results to the pipeline
            foreach (var result in results)
            {
                WriteObject(result);
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            // Log completion of the operation
            WriteVerbose("Completed Get-SQLiteViewColumnData for view '" + ViewName + "'");
        }
    }
}