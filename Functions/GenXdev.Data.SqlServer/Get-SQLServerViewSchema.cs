// ################################################################################
// Part of PowerShell module : GenXdev.Data.SqlServer
// Original cmdlet filename  : Get-SQLServerViewSchema.cs
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
    /// Retrieves the SQL schema definition for a SQL Server view.
    /// </para>
    ///
    /// <para type="description">
    /// This function queries the SQL Server database's system tables to extract the SQL
    /// definition of a specified view. It supports connecting via either a connection
    /// string or database name with server parameters and returns the complete SQL schema
    /// that defines the requested view.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;String&gt;<br/>
    /// The connection string used to connect to the SQL Server database. This parameter is
    /// mutually exclusive with DatabaseName.<br/>
    /// - <b>Position</b>: 0<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseName &lt;String&gt;<br/>
    /// The name of the SQL Server database. This parameter is mutually exclusive with
    /// ConnectionString.<br/>
    /// - <b>Position</b>: 0<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Server &lt;String&gt;<br/>
    /// The SQL Server instance name. Defaults to 'localhost'.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Default</b>: "localhost"<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ViewName &lt;String&gt;<br/>
    /// The name of the view whose schema definition should be retrieved.<br/>
    /// - <b>Position</b>: 2<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Example showing how to retrieve a view schema using database name</para>
    /// <para>Detailed explanation of the example.</para>
    /// <code>
    /// Get-SQLServerViewSchema -DatabaseFilePath "C:\Databases\MyApp.sqlite" `
    ///                     -ViewName "CustomerOrders"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLServerViewSchema", DefaultParameterSetName = "DatabaseName")]
    [OutputType(typeof(System.Collections.Hashtable))]
    public class GetSQLServerViewSchemaCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The connection string used to connect to the SQL Server database. This parameter is
        /// mutually exclusive with DatabaseName.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQL Server database."
        )]
        public string ConnectionString { get; set; }

        /// <summary>
        /// The name of the SQL Server database. This parameter is mutually exclusive with
        /// ConnectionString.
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
        /// The SQL Server instance name. Defaults to 'localhost'.
        /// </summary>
        [Parameter(
            Position = 1,
            ParameterSetName = "DatabaseName",
            HelpMessage = "The SQL Server instance name."
        )]
        public string Server { get; set; } = "localhost";

        /// <summary>
        /// The name of the view whose schema definition should be retrieved.
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = true,
            HelpMessage = "The name of the view."
        )]
        public string ViewName { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Log the start of view schema retrieval
            WriteVerbose($"Retrieving schema for view: {ViewName}");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Construct query to fetch the view definition from SQL Server system views
            string query = "SELECT OBJECT_DEFINITION(OBJECT_ID(@ViewName)) AS view_definition";

            // Log the query being executed
            WriteVerbose($"Executing query: {query}");

            // Build the script to call Invoke-SQLServerQuery with appropriate parameters
            string scriptParams = "GenXdev.Data\\Invoke-SQLServerQuery -Queries $query -SqlParameters @{ViewName = $viewName}";

            if (this.ParameterSetName == "ConnectionString")
            {
                scriptParams += " -ConnectionString $connectionString";
            }
            else
            {
                scriptParams += " -DatabaseName $databaseName -Server $server";
            }

            var scriptBlock = ScriptBlock.Create("param($query, $connectionString, $databaseName, $server, $viewName) " + scriptParams);

            // Execute the script and output results
            var results = scriptBlock.Invoke(query, ConnectionString, DatabaseName, Server, ViewName);
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
            // No cleanup needed
        }
    }
}