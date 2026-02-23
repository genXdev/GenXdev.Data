// ################################################################################
// Part of PowerShell module : GenXdev.Data.SqlServer
// Original cmdlet filename  : Get-SQLServerViewColumnData.cs
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



using System.Collections;
using System.Management.Automation;

namespace GenXdev.Data.SqlServer
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves column data from a SQL view with optional record limiting.
    /// </para>
    ///
    /// <para type="description">
    /// Executes a SELECT query against a specified SQL view to retrieve data from a
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
    /// The SQL database connection string. This parameter is mutually exclusive with
    /// DatabaseName.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>ParameterSet</b>: ConnectionString<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseName &lt;String&gt;<br/>
    /// The name of the SQL Server database. This parameter is mutually exclusive
    /// with ConnectionString.<br/>
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
    /// -ViewName &lt;String&gt;<br/>
    /// The name of the SQL view to query data from.<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ColumnName &lt;String&gt;<br/>
    /// The name of the column within the view to retrieve data from.<br/>
    /// - <b>Position</b>: 3<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Count &lt;Int32&gt;<br/>
    /// The maximum number of records to return. Use -1 to return all records. Defaults
    /// to 100 if not specified.<br/>
    /// - <b>Position</b>: 4<br/>
    /// - <b>Default</b>: 100<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Example 1: Query with database name</para>
    /// <para>Get-SQLServerViewColumnData -DatabaseName "MyDatabase" -ViewName "CustomersView" -ColumnName "Email" -Count 50</para>
    /// <code>
    /// Get-SQLServerViewColumnData -DatabaseName "MyDatabase" -ViewName "CustomersView" -ColumnName "Email" -Count 50
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Example 2: Query with connection string</para>
    /// <para>Get-SQLServerViewColumnData -ConnectionString "Server=localhost;Database=MyDB;Integrated Security=true" -ViewName "UsersView" -ColumnName "Name"</para>
    /// <code>
    /// Get-SQLServerViewColumnData -ConnectionString "Server=localhost;Database=MyDB;Integrated Security=true" -ViewName "UsersView" -ColumnName "Name"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLServerViewColumnData")]
    [OutputType(typeof(PSObject))]
    public class GetSQLServerViewColumnDataCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The SQL database connection string. This parameter is mutually exclusive with
        /// DatabaseName.
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
        /// The name of the SQL Server database. This parameter is mutually exclusive
        /// with ConnectionString.
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
        /// The SQL Server instance name.
        /// </summary>
        [Parameter(
            Position = 1,
            ParameterSetName = "DatabaseName",
            HelpMessage = "The SQL Server instance name."
        )]
        public string Server { get; set; } = "localhost";

        /// <summary>
        /// The name of the SQL view to query data from.
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = true,
            HelpMessage = "The name of the view."
        )]
        [ValidateNotNullOrEmpty]
        public string ViewName { get; set; }

        /// <summary>
        /// The name of the column within the view to retrieve data from.
        /// </summary>
        [Parameter(
            Position = 3,
            Mandatory = true,
            HelpMessage = "The name of the column."
        )]
        [ValidateNotNullOrEmpty]
        public string ColumnName { get; set; }

        /// <summary>
        /// The number of records to return. Default is 100. -1 for all.
        /// </summary>
        [Parameter(
            Position = 4,
            Mandatory = false,
            HelpMessage = "The number of records to return. Default is 100. -1 for all."
        )]
        [ValidateRange(-1, int.MaxValue)]
        public int Count { get; set; } = 100;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose($"Starting Get-SQLServerViewColumnData for view '{ViewName}'");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Determine if we need to limit the results or get all records
            string query;
            if (Count == -1)
            {
                // Construct query to get all records
                query = $"SELECT {ColumnName} FROM {ViewName}";
                WriteVerbose($"Querying all records from view '{ViewName}'");
            }
            else
            {
                // Construct query with LIMIT clause
                query = $"SELECT {ColumnName} FROM {ViewName} LIMIT {Count}";
                WriteVerbose($"Querying {Count} records from view '{ViewName}'");
            }

            // Create parameter dictionary for Invoke-SQLServerQuery
            var parameters = new Hashtable();

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

            // Execute the query using the existing Invoke-SQLServerQuery cmdlet
            var scriptBlock = ScriptBlock.Create("param($p) GenXdev.Data\\Invoke-SQLServerQuery @p");
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
            WriteVerbose($"Completed Get-SQLServerViewColumnData for view '{ViewName}'");
        }
    }
}