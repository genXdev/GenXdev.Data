// ################################################################################
// Part of PowerShell module : GenXdev.Data.SQLite
// Original cmdlet filename  : Invoke-SQLiteStudio.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 1.302.2025
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



using System;
using System.Collections;
using System.Collections.Generic;
using System.Management.Automation;

namespace GenXdev.Data.SQLite
{
    /// <summary>
    /// <para type="synopsis">
    /// Executes SQLite database queries with support for parameters and transactions.
    /// </para>
    ///
    /// <para type="description">
    /// Provides a PowerShell interface for executing SQLite queries with support for:
    /// - Connection via connection string or database file path
    /// - Parameterized queries to prevent SQL injection
    /// - Transaction isolation level control
    /// - Multiple query execution in a single transaction
    /// - Pipeline input for queries and parameters
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ConnectionString &lt;string&gt;<br/>
    /// The SQLite connection string for connecting to the database.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true (in ConnectionString parameter set)<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabaseFilePath &lt;string&gt;<br/>
    /// The direct file system path to the SQLite database file.<br/>
    /// - <b>Aliases</b>: dbpath, indexpath<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true (in DatabaseFilePath parameter set)<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Queries &lt;string[]&gt;<br/>
    /// One or more SQL queries to execute. Can be provided via pipeline.<br/>
    /// Each query can be parameterized using @parameter notation.<br/>
    /// - <b>Aliases</b>: q, Name, Text, Query<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SqlParameters &lt;Hashtable[]&gt;<br/>
    /// Optional parameters for the queries as hashtables. Format: @{"param" = "value"}<br/>
    /// Multiple parameter sets can be provided for multiple queries.<br/>
    /// - <b>Aliases</b>: parameters<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -IsolationLevel &lt;string&gt;<br/>
    /// Controls the transaction isolation. Default is ReadCommitted.<br/>
    /// Available levels: ReadCommitted, ReadUncommitted, RepeatableRead, Serializable<br/>
    /// - <b>Default</b>: "ReadCommitted"<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Execute a query using database file path</para>
    /// <para>This example executes a SELECT query against a SQLite database file.</para>
    /// <code>
    /// Invoke-SQLiteStudio `
    ///     -DatabaseFilePath "C:\data\users.sqlite" `
    ///     -Queries "SELECT * FROM Users WHERE active = @status" `
    ///     -SqlParameters @{"status" = 1}
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Execute a query using connection string</para>
    /// <para>This example executes a query using a connection string.</para>
    /// <code>
    /// Invoke-SQLiteStudio `
    ///     -ConnectionString "Data Source=C:\data\users.sqlite" `
    ///     -Queries "SELECT * FROM Users"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Pipeline usage</para>
    /// <para>This example demonstrates pipeline input for queries.</para>
    /// <code>
    /// "SELECT * FROM Users" | Invoke-SQLiteStudio -DatabaseFilePath "C:\data\users.sqlite"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsLifecycle.Invoke, "SQLiteStudio")]
    [OutputType(typeof(PSObject))]
    public class InvokeSQLiteStudioCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The SQLite connection string for connecting to the database.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "ConnectionString",
            HelpMessage = "The connection string to the SQLite database.")]
        public string ConnectionString { get; set; }

        /// <summary>
        /// The direct file system path to the SQLite database file.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = "DatabaseFilePath",
            HelpMessage = "The path to the SQLite database file.")]
        [Alias("dbpath", "indexpath")]
        [ValidateNotNullOrEmpty]
        public string DatabaseFilePath { get; set; }

        /// <summary>
        /// One or more SQL queries to execute. Can be provided via pipeline.
        /// Each query can be parameterized using @parameter notation.
        /// </summary>
        [Alias("q", "Name", "Text", "Query")]
        [Parameter(
            Mandatory = true,
            Position = 1,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "The query to execute.")]
        public string[] Queries { get; set; }

        /// <summary>
        /// Optional parameters for the queries as hashtables. Format: @{"param" = "value"}
        /// Multiple parameter sets can be provided for multiple queries.
        /// </summary>
        [Alias("parameters")]
        [Parameter(
            Mandatory = false,
            Position = 2,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "Optional parameters for the query.")]
        public Hashtable[] SqlParameters { get; set; }

        /// <summary>
        /// Controls the transaction isolation. Default is ReadCommitted.
        /// Available levels: ReadCommitted, ReadUncommitted, RepeatableRead, Serializable
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "The isolation level to use. Default is ReadCommitted.")]
        [ValidateSet("ReadCommitted", "ReadUncommitted", "RepeatableRead", "Serializable", "Snapshot", "Chaos")]
        public string IsolationLevel { get; set; } = "ReadCommitted";

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Log initialization of SQLite connection handling
            WriteVerbose("Initializing SQLite query execution environment");

            // Ensure SQLite assembly is loaded
            var ensureScript = @"
                GenXdev.Helpers\EnsureNuGetAssembly -PackageKey 'System.Data.Sqlite' -Description 'SQLite database engine for PowerShell data operations' -Publisher 'SQLite Development Team'
            ";
            InvokeCommand.InvokeScript(ensureScript);
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Log the start of query processing
            WriteVerbose($"Processing {Queries.Length} queries with isolation level: {IsolationLevel}");

            // Determine connection string
            string connString;
            if (!string.IsNullOrWhiteSpace(ConnectionString))
            {
                connString = ConnectionString;
            }
            else if (!string.IsNullOrWhiteSpace(DatabaseFilePath))
            {
                // Expand path using base class method
                string expandedPath = ExpandPath(DatabaseFilePath);
                connString = $"Data Source={expandedPath}";
            }
            else
            {
                throw new ArgumentException("You must provide either a ConnectionString or DatabaseFilePath parameter.");
            }

            // Execute queries using dynamic typing for SQLite types
            var sqliteConnectionType = Type.GetType("System.Data.SQLite.SQLiteConnection, System.Data.SQLite");
            if (sqliteConnectionType == null)
            {
                throw new InvalidOperationException("System.Data.SQLite assembly not found. Ensure it is loaded.");
            }

            dynamic connection = Activator.CreateInstance(sqliteConnectionType, connString);
            try
            {
                connection.Open();

                // Convert isolation level string to enum
                var isolationLevelEnumType = Type.GetType("System.Data.IsolationLevel, System.Data");
                dynamic isolationLevel = Enum.Parse(isolationLevelEnumType, IsolationLevel);

                dynamic transaction = connection.BeginTransaction(isolationLevel);
                try
                {
                    // Ensure parameters array exists
                    var sqlParameters = SqlParameters ?? new Hashtable[0];

                    for (int i = 0; i < Queries.Length; i++)
                    {
                        var query = Queries[i];
                        WriteVerbose($"Executing query {i + 1} of {Queries.Length}");

                        // Get parameter set for current query
                        Hashtable parameters = null;
                        if (sqlParameters.Length > i)
                        {
                            parameters = sqlParameters[i];
                        }

                        dynamic command = connection.CreateCommand();
                        command.CommandText = query;
                        command.Transaction = transaction;

                        // Add parameters if provided
                        if (parameters != null)
                        {
                            foreach (DictionaryEntry param in parameters)
                            {
                                command.Parameters.AddWithValue($"@{param.Key}", param.Value);
                            }
                        }

                        // Execute and read results
                        dynamic reader = command.ExecuteReader();
                        try
                        {
                            while (reader.Read())
                            {
                                var record = new PSObject();
                                for (int j = 0; j < reader.FieldCount; j++)
                                {
                                    var name = reader.GetName(j);
                                    var value = reader.GetValue(j);
                                    record.Properties.Add(new PSNoteProperty(name, value));
                                }
                                WriteObject(record);
                            }
                        }
                        finally
                        {
                            reader.Close();
                        }
                    }

                    transaction.Commit();
                    WriteVerbose("Transaction committed successfully");
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    WriteVerbose("Transaction rolled back due to error");
                    throw;
                }
                finally
                {
                    transaction.Dispose();
                }
            }
            finally
            {
                connection.Close();
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