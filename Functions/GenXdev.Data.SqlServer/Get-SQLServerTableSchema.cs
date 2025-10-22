// ################################################################################
// Part of PowerShell module : GenXdev.Data.SqlServer
// Original cmdlet filename  : Get-SQLServerTableSchema.cs
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
using System.Linq;
using System.Management.Automation;

namespace GenXdev.Data.SqlServer
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves the schema information for a specified SQL Server table.
    /// </para>
    ///
    /// <para type="description">
    /// This cmdlet queries the SQL Server database to get detailed schema information for
    /// a specified table. It uses the SQL Server INFORMATION_SCHEMA.COLUMNS view to return
    /// column definitions including names, types, nullable status, and default values.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;String&gt;<br/>
    /// Specifies the SQL Server connection string in the format:
    /// "Server=servername;Database=databasename;Integrated Security=true"<br/>
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
    /// Specifies the SQL Server instance name. Defaults to '.'.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>ParameterSet</b>: DatabaseName<br/>
    /// - <b>Default</b>: "."<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -TableName &lt;String&gt;<br/>
    /// Specifies the name of the table for which to retrieve schema information.<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Example 1: Retrieve schema using database name and server</para>
    /// <para>Get-SQLServerTableSchema -DatabaseName "mydb" -Server "localhost" -TableName "Users"</para>
    /// </example>
    ///
    /// <example>
    /// <para>Example 2: Retrieve schema using connection string</para>
    /// <para>Get-SQLServerTableSchema -ConnectionString "Server=localhost;Database=mydb;Integrated Security=true" -TableName "Products"</para>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "SQLServerTableSchema")]
    [OutputType(typeof(PSObject))]
    public class GetSQLServerTableSchemaCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Specifies the SQL Server connection string in the format:
        /// "Server=servername;Database=databasename;Integrated Security=true"
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQL Server database"
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
            HelpMessage = "The name of the SQL Server database"
        )]
        [ValidateNotNullOrEmpty]
        public string DatabaseName { get; set; }

        /// <summary>
        /// Specifies the SQL Server instance name. Defaults to '.'.
        /// </summary>
        [Parameter(
            Position = 1,
            ParameterSetName = "DatabaseName",
            HelpMessage = "The SQL Server instance name"
        )]
        public string Server { get; set; } = ".";

        /// <summary>
        /// Specifies the name of the table for which to retrieve schema information.
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = true,
            HelpMessage = "The name of the table"
        )]
        [ValidateNotNullOrEmpty]
        public string TableName { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Log the start of schema retrieval operation
            WriteVerbose($"Preparing to retrieve schema for table '{TableName}'");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Construct the INFORMATION_SCHEMA query to get detailed table column information
            string query = $@"
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE,
    ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = '{TableName}'
ORDER BY ORDINAL_POSITION
";

            // Log the execution of the schema query
            WriteVerbose("Executing schema query against SQL Server database");

            // Create parameters hashtable for Invoke-SQLServerQuery
            Hashtable parameters = new Hashtable();

            // Add the query to parameters
            parameters["Queries"] = new string[] { query };

            // Copy other parameters based on parameter set
            if (ParameterSetName == "ConnectionString")
            {
                parameters["ConnectionString"] = ConnectionString;
            }
            else if (ParameterSetName == "DatabaseName")
            {
                parameters["DatabaseName"] = DatabaseName;
                parameters["Server"] = Server;
            }

            // Execute the query and return results using existing Invoke-SQLServerQuery
            // Use ScriptBlock.Create with parameters for safe execution
            ScriptBlock scriptBlock = ScriptBlock.Create("param($params) GenXdev.Data\\Invoke-SQLServerQuery @params");
            var invokeResults = scriptBlock.Invoke(parameters);

            // Output the results
            foreach (var result in invokeResults)
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