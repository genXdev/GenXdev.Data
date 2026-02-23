// ################################################################################
// Part of PowerShell module : GenXdev.Data.SqlServer
// Original cmdlet filename  : Get-SQLServerTableColumnData.cs
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

namespace GenXdev.Data.SqlServer
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves data from a specific column in a SQL database table.
    /// </para>
    ///
    /// <para type="description">
    /// This cmdlet provides a convenient way to extract data from a single column in a
    /// SQL database table. It supports two connection methods: direct database file
    /// path or connection string. The cmdlet includes options to limit the number of
    /// returned records and uses proper SQL query construction for optimal
    /// performance.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;String&gt;<br/>
    /// The connection string to connect to the SQL database. This parameter is
    /// mutually exclusive with DatabaseFilePath.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>ParameterSet</b>: ConnectionString<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseName &lt;String&gt;<br/>
    /// The name of the SQL Server database.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>ParameterSet</b>: DatabaseName<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Server &lt;String&gt;<br/>
    /// The SQL Server instance name.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>ParameterSet</b>: DatabaseName<br/>
    /// - <b>Default</b>: "localhost"<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -TableName &lt;String&gt;<br/>
    /// The name of the table from which to retrieve the column data.<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ColumnName &lt;String&gt;<br/>
    /// The name of the column whose data should be retrieved.<br/>
    /// - <b>Position</b>: 3<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Count &lt;Int32&gt;<br/>
    /// The maximum number of records to return. Default is 100. Use -1 to return all
    /// records without limit.<br/>
    /// - <b>Position</b>: 4<br/>
    /// - <b>Default</b>: 100<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get data from Email column in Employees table using database file path</para>
    /// <para>This example retrieves up to 10 email addresses from the Employees table in a SQLite database.</para>
    /// <code>
    /// Get-SQLServerTableColumnData -DatabaseFilePath "C:\MyDb.sqlite" `
    ///     -TableName "Employees" `
    ///     -ColumnName "Email" `
    ///     -Count 10
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get data using positional parameters</para>
    /// <para>This example demonstrates using positional parameters for a simpler syntax.</para>
    /// <code>
    /// Get-SQLServerTableColumnData "C:\MyDb.sqlite" "Employees" "Email"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLServerTableColumnData")]
    [OutputType(typeof(PSObject))]
    public class GetSQLServerTableColumnDataCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The connection string to connect to the SQL Server database
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQL Server database")]
        [ValidateNotNullOrEmpty]
        public string ConnectionString { get; set; }

        /// <summary>
        /// The name of the SQL Server database
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "DatabaseName",
            HelpMessage = "The name of the SQL Server database")]
        [ValidateNotNullOrEmpty]
        public string DatabaseName { get; set; }

        /// <summary>
        /// The SQL Server instance name
        /// </summary>
        [Parameter(
            Position = 1,
            ParameterSetName = "DatabaseName",
            HelpMessage = "The SQL Server instance name")]
        public string Server { get; set; } = "localhost";

        /// <summary>
        /// The name of the table to query
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = true,
            HelpMessage = "The name of the table to query")]
        [ValidateNotNullOrEmpty]
        public string TableName { get; set; }

        /// <summary>
        /// The name of the column to retrieve
        /// </summary>
        [Parameter(
            Position = 3,
            Mandatory = true,
            HelpMessage = "The name of the column to retrieve")]
        [ValidateNotNullOrEmpty]
        public string ColumnName { get; set; }

        /// <summary>
        /// Number of records to return. Default 100. Use -1 for all
        /// </summary>
        [Parameter(
            Position = 4,
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

            // Prepare parameters for Invoke-SQLServerQuery and execute the query
            // We need to pass all bound parameters plus the Queries parameter
            var scriptBlock = ScriptBlock.Create(@"
param($ConnectionString, $DatabaseName, $Server, $TableName, $ColumnName, $Count, $Queries)
GenXdev.Data\Invoke-SQLServerQuery -ConnectionString $ConnectionString -DatabaseName $DatabaseName -Server $Server -TableName $TableName -ColumnName $ColumnName -Count $Count -Queries $Queries
");

            // Get the results and write them to the pipeline
            var results = scriptBlock.Invoke(
                ConnectionString,
                DatabaseName,
                Server,
                TableName,
                ColumnName,
                Count,
                query);

            // Write each result to the pipeline
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