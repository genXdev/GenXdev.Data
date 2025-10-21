// ################################################################################
// Part of PowerShell module : GenXdev.Data.SQLite
// Original cmdlet filename  : Get-SQLiteTableColumnData.cs
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



using System.Management.Automation;

namespace GenXdev.Data.SQLite
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves data from a specific column in a SQLite database table.
    /// </para>
    ///
    /// <para type="description">
    /// This function provides a convenient way to extract data from a single column in a
    /// SQLite database table. It supports two connection methods: direct database file
    /// path or connection string. The function includes options to limit the number of
    /// returned records and uses proper SQLite query construction for optimal
    /// performance.
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
    /// - <b>ParameterSet</b>: ConnectionString<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseFilePath &lt;string&gt;<br/>
    /// The file path to the SQLite database file. This parameter is mutually exclusive
    /// with ConnectionString.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>ParameterSet</b>: DatabaseFilePath<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -TableName &lt;string&gt;<br/>
    /// The name of the table from which to retrieve the column data.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ColumnName &lt;string&gt;<br/>
    /// The name of the column whose data should be retrieved.<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Count &lt;int&gt;<br/>
    /// The maximum number of records to return. Default is 100. Use -1 to return all
    /// records without limit.<br/>
    /// - <b>Position</b>: 3<br/>
    /// - <b>Default</b>: 100<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get-SQLiteTableColumnData -DatabaseFilePath "C:\MyDb.sqlite" -TableName "Employees" -ColumnName "Email" -Count 10</para>
    /// <para>Retrieves up to 10 email addresses from the Employees table in the specified SQLite database.</para>
    /// <code>
    /// Get-SQLiteTableColumnData -DatabaseFilePath "C:\MyDb.sqlite" `
    ///     -TableName "Employees" `
    ///     -ColumnName "Email" `
    ///     -Count 10
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get-SQLiteTableColumnData "C:\MyDb.sqlite" "Employees" "Email"</para>
    /// <para>Retrieves email addresses from the Employees table using positional parameters.</para>
    /// <code>
    /// Get-SQLiteTableColumnData "C:\MyDb.sqlite" "Employees" "Email"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLiteTableColumnData")]
    [OutputType(typeof(object))]
    public class GetSQLiteTableColumnDataCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The connection string to connect to the SQLite database
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQLite database")]
        [ValidateNotNullOrEmpty]
        public string ConnectionString { get; set; }

        /// <summary>
        /// The path to the SQLite database file
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "DatabaseFilePath",
            HelpMessage = "The path to the SQLite database file")]
        [ValidateNotNullOrEmpty]
        public string DatabaseFilePath { get; set; }

        /// <summary>
        /// The name of the table to query
        /// </summary>
        [Parameter(
            Position = 1,
            Mandatory = true,
            HelpMessage = "The name of the table to query")]
        [ValidateNotNullOrEmpty]
        public string TableName { get; set; }

        /// <summary>
        /// The name of the column to retrieve
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = true,
            HelpMessage = "The name of the column to retrieve")]
        [ValidateNotNullOrEmpty]
        public string ColumnName { get; set; }

        /// <summary>
        /// Number of records to return. Default 100. Use -1 for all
        /// </summary>
        [Parameter(
            Position = 3,
            Mandatory = false,
            HelpMessage = "Number of records to return. Default 100. Use -1 for all")]
        public int Count { get; set; } = 100;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Log the start of the operation with table and column details
            WriteVerbose($"Starting data retrieval for column '{ColumnName}' from table '{TableName}'");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Construct the appropriate SQL query based on whether a limit is needed
            string query;
            if (Count == -1)
            {
                query = $"SELECT {ColumnName} FROM {TableName}";
            }
            else
            {
                query = $"SELECT {ColumnName} FROM {TableName} LIMIT {Count}";
            }

            // Log the constructed query for debugging
            WriteVerbose($"Executing SQL query: {query}");

            // Prepare parameters for Invoke-SQLiteQuery and execute the query
            // Use ScriptBlock.Create with parameters to safely pass values
            var scriptBlock = ScriptBlock.Create(@"
param($ConnectionString, $DatabaseFilePath, $TableName, $ColumnName, $Count, $Queries)
GenXdev.Data\Invoke-SQLiteQuery -ConnectionString $ConnectionString -DatabaseFilePath $DatabaseFilePath -TableName $TableName -ColumnName $ColumnName -Count $Count -Queries $Queries
");

            // Create parameter dictionary for the script block
            var parameters = new object[] {
                ConnectionString,
                DatabaseFilePath,
                TableName,
                ColumnName,
                Count,
                query
            };

            // Execute the script block and write results
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
            // Log completion of the operation
            WriteVerbose("Column data retrieval completed successfully");
        }
    }
}