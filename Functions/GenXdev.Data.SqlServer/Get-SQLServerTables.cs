// ################################################################################
// Part of PowerShell module : GenXdev.Data.SqlServer
// Original cmdlet filename  : Get-SQLServerTables.cs
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
    /// Retrieves a list of table names from a SQL Server database.
    /// </para>
    ///
    /// <para type="description">
    /// Queries the SQL Server system tables to retrieve all user-defined table names
    /// from a SQL Server database. Supports connecting via either a direct connection
    /// string or a database name with server parameters. Returns the table names as a
    /// collection of strings.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;String&gt;<br/>
    /// The full connection string to connect to the SQL Server database. Should include
    /// the Server and Database parameters at minimum.<br/>
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
    /// The SQL Server instance name. Defaults to '.'.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Default</b>: "."<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get-SQLServerTables -DatabaseName "Inventory" -Server "localhost"</para>
    /// <para>Returns all table names from the specified database</para>
    /// <code>
    /// Get-SQLServerTables -DatabaseName "Inventory" -Server "localhost"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get-SQLServerTables -ConnectionString "Server=localhost;Database=Users;Integrated Security=true;"</para>
    /// <para>Returns all table names using a custom connection string</para>
    /// <code>
    /// Get-SQLServerTables -ConnectionString "Server=localhost;Database=Users;Integrated Security=true;"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLServerTables")]
    [OutputType(typeof(string))]
    public class GetSQLServerTablesCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The full connection string to connect to the SQL Server database. Should include
        /// the Server and Database parameters at minimum.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQL Server database."
        )]
        public string ConnectionString { get; set; }

        /// <summary>
        /// The name of the SQL Server database.
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
        public string Server { get; set; } = ".";

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Starting SQL table name retrieval operation");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Define the query to get all table names from SQL Server system tables
            WriteVerbose("Executing query to retrieve table names");

            // Build the script to invoke the underlying cmdlet
            var script = "GenXdev.Data\\Invoke-SQLServerQuery -Queries 'SELECT name FROM sys.tables ORDER BY name'";

            if (MyInvocation.BoundParameters.ContainsKey("ConnectionString"))
            {
                script += $" -ConnectionString \"{ConnectionString.Replace("\"", "\\\"")}\"";
            }
            else
            {
                script += $" -DatabaseName \"{DatabaseName.Replace("\"", "\\\"")}\"";
                if (MyInvocation.BoundParameters.ContainsKey("Server"))
                {
                    script += $" -Server \"{Server.Replace("\"", "\\\"")}\"";
                }
            }

            var results = InvokeCommand.InvokeScript(script);
            WriteObject(results, true);
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}