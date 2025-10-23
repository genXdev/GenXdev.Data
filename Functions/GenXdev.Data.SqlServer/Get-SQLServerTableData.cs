// ################################################################################
// Part of PowerShell module : GenXdev.Data.SqlServer
// Original cmdlet filename  : Get-SQLServerTableData.cs
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



using System.Collections;
using System.Management.Automation;

namespace GenXdev.Data.SqlServer
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves data from a SQL database table with optional record limiting.
    /// </para>
    ///
    /// <para type="description">
    /// This function queries data from a SQL database table using either a connection
    /// string or database file path. It provides flexibility in connecting to the
    /// database and controlling the amount of data retrieved through the Count parameter.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;String&gt;<br/>
    /// Specifies the SQL connection string in the format:
    /// "Data Source=path_to_database_file"<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>ParameterSet</b>: ConnectionString<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseName &lt;String&gt;<br/>
    /// Specifies the name of the SQL Server database.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>ParameterSet</b>: DatabaseName<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Server &lt;String&gt;<br/>
    /// Specifies the SQL Server instance name.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>ParameterSet</b>: DatabaseName<br/>
    /// - <b>Default</b>: "localhost"<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -TableName &lt;String&gt;<br/>
    /// Specifies the name of the table to query data from. The table must exist in the
    /// database.<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Count &lt;Int32&gt;<br/>
    /// Specifies the maximum number of records to return. Default is 100.
    /// Use -1 to return all records. Must be -1 or a positive integer.<br/>
    /// - <b>Position</b>: 3<br/>
    /// - <b>Default</b>: 100<br/>
    /// - <b>Validation</b>: -1 to Int32.MaxValue<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Example 1: Query with database file path</para>
    /// <para>Get-SQLServerTableData -DatabaseName "MyDatabase" -TableName "Employees" -Count 50</para>
    /// <code>
    /// Get-SQLServerTableData -DatabaseName "MyDatabase" -TableName "Employees" -Count 50
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Example 2: Query with connection string</para>
    /// <para>Get-SQLServerTableData -ConnectionString "Server=localhost;Database=MyDB;Integrated Security=true" -TableName "Users"</para>
    /// <code>
    /// Get-SQLServerTableData -ConnectionString "Server=localhost;Database=MyDB;Integrated Security=true" -TableName "Users"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLServerTableData")]
    [OutputType(typeof(PSObject))]
    public class GetSQLServerTableDataCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Specifies the SQL connection string in the format:
        /// "Data Source=path_to_database_file"
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQL Server database."
        )]
        [ValidateNotNullOrEmpty]
        public string ConnectionString { get; set; }

        /// <summary>
        /// Specifies the name of the SQL Server database.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "DatabaseName",
            HelpMessage = "The name of the SQL Server database."
        )]
        [ValidateNotNullOrEmpty]
        public string DatabaseName { get; set; }

        /// <summary>
        /// Specifies the SQL Server instance name.
        /// </summary>
        [Parameter(
            Position = 1,
            ParameterSetName = "DatabaseName",
            HelpMessage = "The SQL Server instance name."
        )]
        public string Server { get; set; } = "localhost";

        /// <summary>
        /// Specifies the name of the table to query data from. The table must exist in the
        /// database.
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = true,
            HelpMessage = "The name of the table to query data from."
        )]
        [ValidateNotNullOrEmpty]
        public string TableName { get; set; }

        /// <summary>
        /// Specifies the maximum number of records to return. Default is 100.
        /// Use -1 to return all records. Must be -1 or a positive integer.
        /// </summary>
        [Parameter(
            Position = 3,
            Mandatory = false,
            HelpMessage = "The maximum number of records to return. -1 for all."
        )]
        [ValidateRange(-1, int.MaxValue)]
        public int Count { get; set; } = 100;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose($"Starting Get-SQLServerTableData for table: {TableName}");
            WriteVerbose($"Record limit set to: {(Count == -1 ? "unlimited" : Count.ToString())}");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Construct query based on whether we want all records or a limited set
            string query = Count == -1
                ? $"SELECT * FROM {TableName}"
                : $"SELECT * FROM {TableName} LIMIT {Count}";

            WriteVerbose($"Executing query: {query}");

            // Create parameter dictionary for Invoke-SQLServerQuery
            var parameters = new System.Collections.Hashtable();

            // Add the constructed query to the parameter set for Invoke-SQLServerQuery
            parameters["Queries"] = new string[] { query };

            // Copy all bound parameters to the Invoke-SQLServerQuery call
            if (MyInvocation.BoundParameters.ContainsKey("ConnectionString"))
            {
                parameters["ConnectionString"] = ConnectionString;
            }
            if (MyInvocation.BoundParameters.ContainsKey("DatabaseName"))
            {
                parameters["DatabaseName"] = DatabaseName;
            }
            if (MyInvocation.BoundParameters.ContainsKey("Server"))
            {
                parameters["Server"] = Server;
            }
            if (MyInvocation.BoundParameters.ContainsKey("TableName"))
            {
                parameters["TableName"] = TableName;
            }
            if (MyInvocation.BoundParameters.ContainsKey("Count"))
            {
                parameters["Count"] = Count;
            }

            // Execute the query and return results through the SQL provider
            var scriptBlock = ScriptBlock.Create("param($Queries, $ConnectionString, $DatabaseName, $Server, $TableName, $Count) GenXdev.Data\\Invoke-SQLServerQuery @PSBoundParameters");
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
            WriteVerbose($"Completed querying table: {TableName}");
        }
    }
}