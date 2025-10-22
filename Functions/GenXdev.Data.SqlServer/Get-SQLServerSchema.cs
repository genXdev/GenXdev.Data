// ################################################################################
// Part of PowerShell module : GenXdev.Data.SqlServer
// Original cmdlet filename  : Get-SQLServerSchema.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 1.308.2025
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
    /// Retrieves the complete schema information from a SQL Server database.
    /// </para>
    ///
    /// <para type="description">
    /// This function queries SQL Server system tables and information schema to obtain
    /// the complete schema definition of a SQL Server database, including tables, views,
    /// indexes, stored procedures and other database objects. It accepts either a
    /// connection string or database name with server parameters.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;String&gt;<br/>
    /// The SQL Server connection string that specifies the database location and any
    /// additional connection parameters.<br/>
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
    /// The SQL Server instance name. Defaults to 'localhost'.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>ParameterSet</b>: DatabaseName<br/>
    /// - <b>Default</b>: "localhost"<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get-SQLServerSchema -DatabaseName "inventory" -Server "localhost"</para>
    /// <para>Retrieves schema information from the 'inventory' database on the local SQL Server instance.</para>
    /// <code>
    /// Get-SQLServerSchema -DatabaseName "inventory" -Server "localhost"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get-SQLServerSchema -ConnectionString "Server=localhost;Database=inventory;Integrated Security=true;"</para>
    /// <para>Retrieves schema information using a connection string.</para>
    /// <code>
    /// Get-SQLServerSchema -ConnectionString "Server=localhost;Database=inventory;Integrated Security=true;"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLServerSchema")]
    [OutputType(typeof(PSObject))]
    public class GetSQLServerSchemaCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The SQL Server connection string that specifies the database location and any
        /// additional connection parameters.
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
        /// The SQL Server instance name. Defaults to 'localhost'.
        /// </summary>
        [Parameter(
            Position = 1,
            ParameterSetName = "DatabaseName",
            HelpMessage = "The SQL Server instance name.")]
        public string Server { get; set; } = "localhost";

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Output verbose information about the selected parameter set
            WriteVerbose("Using parameter set: " + ParameterSetName);
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Prepare comprehensive schema queries for SQL Server
            var schemaQueries = new string[]
            {
                "SELECT 'TABLE' as object_type, name, schema_id, object_id FROM sys.tables ORDER BY name",
                "SELECT 'VIEW' as object_type, name, schema_id, object_id FROM sys.views ORDER BY name",
                "SELECT 'PROCEDURE' as object_type, name, schema_id, object_id FROM sys.procedures ORDER BY name",
                "SELECT 'FUNCTION' as object_type, name, schema_id, object_id FROM sys.objects WHERE type IN ('FN','IF','TF') ORDER BY name"
            };

            // Create parameters hashtable similar to PSBoundParameters
            var boundParams = new Hashtable();

            if (ConnectionString != null)
            {
                boundParams["ConnectionString"] = ConnectionString;
            }

            if (DatabaseName != null)
            {
                boundParams["DatabaseName"] = DatabaseName;
            }

            if (Server != null)
            {
                boundParams["Server"] = Server;
            }

            boundParams["Queries"] = schemaQueries;

            // Execute the schema queries using InvokeCommand to call the PowerShell function
            string script = @"
param($params)
GenXdev.Data\Invoke-SQLServerQuery @params
";

            var results = InvokeCommand.InvokeScript(script, boundParams);

            // Output results to pipeline
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