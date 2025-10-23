// ################################################################################
// Part of PowerShell module : GenXdev.Data.SqlServer
// Original cmdlet filename  : Get-SQLServerViewData.cs
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



using System.Management.Automation;

namespace GenXdev.Data.SqlServer
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves data from a SQL database view with optional record limiting.
    /// </para>
    ///
    /// <para type="description">
    /// Queries a SQL database view using either a connection string or database file
    /// path. The function supports limiting the number of returned records and provides
    /// verbose output for tracking query execution.
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
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseName &lt;String&gt;<br/>
    /// The name of the SQL Server database.<br/>
    /// - <b>Position</b>: 0<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Server &lt;String&gt;<br/>
    /// The SQL Server instance name.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Default</b>: "localhost"<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ViewName &lt;String&gt;<br/>
    /// The name of the view from which to retrieve data.<br/>
    /// - <b>Position</b>: 2<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Count &lt;Int32&gt;<br/>
    /// The maximum number of records to return. Use -1 to return all records.
    /// Defaults to 100 if not specified.<br/>
    /// - <b>Position</b>: 3<br/>
    /// - <b>Default</b>: 100<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Example 1: Retrieve data from a view using database name</para>
    /// <para>Get-SQLServerViewData -DatabaseName "MyDB" -ViewName "CustomerView" -Count 50</para>
    /// <code>
    /// Get-SQLServerViewData -DatabaseName "MyDB" -ViewName "CustomerView" -Count 50
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Example 2: Retrieve data from a view using connection string</para>
    /// <para>Get-SQLServerViewData -ConnectionString "Server=localhost;Database=MyDB;Integrated Security=true" -ViewName "CustomerView"</para>
    /// <code>
    /// Get-SQLServerViewData -ConnectionString "Server=localhost;Database=MyDB;Integrated Security=true" -ViewName "CustomerView"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLServerViewData")]
    [OutputType(typeof(System.Collections.Hashtable))]
    public class GetSQLServerViewDataCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The connection string to connect to the SQL database. This parameter is
        /// mutually exclusive with DatabaseFilePath.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQL Server database.")]
        [ValidateNotNullOrEmpty]
        public string ConnectionString { get; set; }

        /// <summary>
        /// The name of the SQL Server database.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "DatabaseName",
            HelpMessage = "The name of the SQL Server database.")]
        [ValidateNotNullOrEmpty]
        public string DatabaseName { get; set; }

        /// <summary>
        /// The SQL Server instance name.
        /// </summary>
        [Parameter(
            Position = 1,
            ParameterSetName = "DatabaseName",
            HelpMessage = "The SQL Server instance name.")]
        public string Server { get; set; } = "localhost";

        /// <summary>
        /// The name of the view from which to retrieve data.
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = true,
            HelpMessage = "The name of the view to query.")]
        [ValidateNotNullOrEmpty]
        public string ViewName { get; set; }

        /// <summary>
        /// The maximum number of records to return. Use -1 to return all records.
        /// Defaults to 100 if not specified.
        /// </summary>
        [Parameter(
            Position = 3,
            Mandatory = false,
            HelpMessage = "Number of records to return. -1 for all records.")]
        [ValidateRange(-1, int.MaxValue)]
        public int Count { get; set; } = 100;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose($"Starting Get-SQLServerViewData for view: {ViewName}");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Construct query with optional record limit
            string query;
            if (Count == -1)
            {
                query = $"SELECT * FROM {ViewName}";
            }
            else
            {
                query = $"SELECT * FROM {ViewName} LIMIT {Count}";
            }

            WriteVerbose($"Executing query: {query}");

            // Prepare parameters for Invoke-SQLServerQuery
            var parameters = new System.Collections.Hashtable();

            // Copy all bound parameters
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
            parameters["ViewName"] = ViewName;
            parameters["Count"] = Count;

            // Add the constructed query
            parameters["Queries"] = query;

            // Execute query and return results using InvokeCommand
            var scriptBlock = ScriptBlock.Create("param($params) GenXdev.Data\\Invoke-SQLServerQuery @params");
            var results = scriptBlock.Invoke(parameters);

            // Write results to pipeline
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
            WriteVerbose($"Completed querying view: {ViewName}");
        }
    }
}