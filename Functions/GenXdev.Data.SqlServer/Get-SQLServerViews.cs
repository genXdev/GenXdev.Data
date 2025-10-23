// ################################################################################
// Part of PowerShell module : GenXdev.Data.SqlServer
// Original cmdlet filename  : Get-SQLServerViews.cs
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
    /// Retrieves a list of views from a SQL Server database.
    /// </para>
    ///
    /// <para type="description">
    /// Gets all view names from the specified SQL Server database. Returns an array
    /// of view names that can be used for further database operations. The function
    /// supports two parameter sets for flexibility: providing either a connection string
    /// or a database name with server.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;String&gt;<br/>
    /// The connection string to connect to the SQL Server database. Use this when you
    /// need to specify custom connection parameters.<br/>
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
    /// The SQL Server instance name. Defaults to '.'.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>ParameterSet</b>: DatabaseName<br/>
    /// - <b>Default</b>: "."<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get views from a database using database name and server</para>
    /// <para>This example retrieves all views from the 'MyDatabase' database on the local SQL Server instance.</para>
    /// <code>
    /// Get-SQLServerViews -DatabaseName "MyDatabase" -Server "localhost"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get views using a connection string</para>
    /// <para>This example retrieves all views using a custom connection string.</para>
    /// <code>
    /// Get-SQLServerViews -ConnectionString "Server=localhost;Database=MyDatabase;Integrated Security=true;"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLServerViews")]
    [OutputType(typeof(object))]
    public class GetSQLServerViewsCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The connection string to the SQL Server database.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQL Server database.")]
        public string ConnectionString { get; set; }

        /// <summary>
        /// The name of the SQL Server database.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "DatabaseName",
            HelpMessage = "The name of the SQL Server database.")]
        public string DatabaseName { get; set; }

        /// <summary>
        /// The SQL Server instance name.
        /// </summary>
        [Parameter(
            Position = 1,
            ParameterSetName = "DatabaseName",
            HelpMessage = "The SQL Server instance name.")]
        public string Server { get; set; } = ".";

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Preparing to retrieve SQL views...");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Define the SQL query to retrieve all view names from SQL Server system tables
            string query = "SELECT name FROM sys.views ORDER BY name";

            // Log the query being executed for troubleshooting
            WriteVerbose($"Executing query: {query}");

            // Build the script to call Invoke-SQLServerQuery with appropriate parameters
            string script = "GenXdev.Data\\Invoke-SQLServerQuery";

            if (!string.IsNullOrEmpty(ConnectionString))
            {
                // Use ConnectionString parameter set
                script += $" -ConnectionString '{ConnectionString.Replace("'", "''")}'";
            }
            else
            {
                // Use DatabaseName parameter set
                script += $" -DatabaseName '{DatabaseName.Replace("'", "''")}' -Server '{Server.Replace("'", "''")}'";
            }

            // Add the Queries parameter
            script += $" -Queries '{query.Replace("'", "''")}'";

            // Execute the query and return results
            var results = InvokeCommand.InvokeScript(script);
            WriteObject(results, true);
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