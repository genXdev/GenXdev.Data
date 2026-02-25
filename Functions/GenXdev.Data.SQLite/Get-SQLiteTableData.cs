// ################################################################################
// Part of PowerShell module : GenXdev.Data.SQLite
// Original cmdlet filename  : Get-SQLiteTableData.cs
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
    /// Retrieves data from a SQLite database table with optional record limiting.
    /// </para>
    ///
    /// <para type="description">
    /// This function queries data from a SQLite database table using either a connection
    /// string or database file path. It provides flexibility in connecting to the
    /// database and controlling the amount of data retrieved through the Count parameter.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;string&gt;<br/>
    /// Specifies the SQLite connection string in the format:
    /// "Data Source=path_to_database_file"<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseFilePath &lt;string&gt;<br/>
    /// Specifies the full file system path to the SQLite database file.<br/>
    /// - <b>Aliases</b>: dbpath, indexpath<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -TableName &lt;string&gt;<br/>
    /// Specifies the name of the table to query data from. The table must exist in the
    /// database.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Count &lt;int&gt;<br/>
    /// Specifies the maximum number of records to return. Default is 100.
    /// Use -1 to return all records. Must be -1 or a positive integer.<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Default</b>: 100<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get-SQLiteTableData -DatabaseFilePath "C:\data\users.db" -TableName "Employees" -Count 50</para>
    /// <para>This example retrieves up to 50 records from the Employees table in the users.db database.</para>
    /// <code>
    /// Get-SQLiteTableData -DatabaseFilePath "C:\data\users.db" -TableName "Employees" -Count 50
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get-SQLiteTableData "C:\data\users.db" "Employees"</para>
    /// <para>This example retrieves the default number of records (100) from the Employees table using positional parameters.</para>
    /// <code>
    /// Get-SQLiteTableData "C:\data\users.db" "Employees"
    /// </code>
    /// </example>
    ///
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLiteTableData")]
    [OutputType(typeof(object))]
    public class GetSQLiteTableDataCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Specifies the SQLite connection string in the format:
        /// "Data Source=path_to_database_file"
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQLite database.")]
        [ValidateNotNullOrEmpty]
        public string ConnectionString { get; set; }

        /// <summary>
        /// Specifies the full file system path to the SQLite database file.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "DatabaseFilePath",
            HelpMessage = "The path to the SQLite database file.")]
        [ValidateNotNullOrEmpty]
        [Alias("dbpath", "indexpath")]
        public string DatabaseFilePath { get; set; }

        /// <summary>
        /// Specifies the name of the table to query data from. The table must exist in the
        /// database.
        /// </summary>
        [Parameter(
            Position = 1,
            Mandatory = true,
            HelpMessage = "The name of the table to query data from.")]
        [ValidateNotNullOrEmpty]
        public string TableName { get; set; }

        /// <summary>
        /// Specifies the maximum number of records to return. Default is 100.
        /// Use -1 to return all records. Must be -1 or a positive integer.
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = false,
            HelpMessage = "The maximum number of records to return. -1 for all.")]
        [ValidateRange(-1, int.MaxValue)]
        public int Count { get; set; } = 100;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Starting Get-SQLiteTableData for table: " + TableName);
            WriteVerbose("Record limit set to: " + (Count == -1 ? "unlimited" : Count.ToString()));
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Construct query based on whether we want all records or a limited set
            string query = Count == -1 ? "SELECT * FROM " + TableName : "SELECT * FROM " + TableName + " LIMIT " + Count;

            WriteVerbose("Executing query: " + query);

            // Create parameters dictionary for Invoke-SQLiteQuery
            var parameters = new Dictionary<string, object>();
            if (!string.IsNullOrEmpty(ConnectionString))
            {
                parameters["ConnectionString"] = ConnectionString;
            }
            else if (!string.IsNullOrEmpty(DatabaseFilePath))
            {
                parameters["DatabaseFilePath"] = DatabaseFilePath;
            }
            parameters["Queries"] = new string[] { query };

            // Use ScriptBlock to safely invoke Invoke-SQLiteQuery with parameters
            var scriptBlock = ScriptBlock.Create(@"
                param($params)
                GenXdev.Data\Invoke-SQLiteQuery @params
            ");

            // Execute the script and write results to pipeline
            var results = scriptBlock.Invoke(parameters);
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
            WriteVerbose("Completed querying table: " + TableName);
        }
    }
}