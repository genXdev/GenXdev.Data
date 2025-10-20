// ################################################################################
// Part of PowerShell module : GenXdev.Data.KeyValueStore
// Original cmdlet filename  : Initialize-KeyValueStores.cs
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
using System.CodeDom;
using System.IO;
using System.Management.Automation;

namespace GenXdev.Data.KeyValueStore
{
    /// <summary>
    /// <para type="synopsis">
    /// Initializes KeyValueStore directory structure for local and OneDrive storage.
    /// </para>
    ///
    /// <para type="description">
    /// Creates directory structure for JSON-based key-value stores in two locations:
    /// 1. Local machine for immediate access ($ENV:LOCALAPPDATA\GenXdev.PowerShell\KeyValueStore\)
    /// 2. OneDrive folder for cloud synchronization
    /// The cmdlet ensures both directories exist and are properly configured.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -DatabasePath &lt;String&gt;<br/>
    /// Base directory path for key-value store JSON files.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: "$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\KeyValueStore"<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Initialize KeyValueStore directories with default paths</para>
    /// <para>Creates the standard local and OneDrive directories for key-value stores.</para>
    /// <code>
    /// Initialize-KeyValueStores
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Initialize KeyValueStore directories with custom base path</para>
    /// <para>Creates key-value store directories under the specified custom path.</para>
    /// <code>
    /// Initialize-KeyValueStores -DatabasePath "C:\MyStores"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet("Initialize", "KeyValueStores")]
    [OutputType(typeof(void))]
    public class InitializeKeyValueStoresCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Base directory path for key-value store JSON files
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 0,
            HelpMessage = "Database path for key-value store data files")]
        public string DatabasePath { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Determine base path using provided path or default
            string basePath;
            if (string.IsNullOrWhiteSpace(DatabasePath))
            {
                // Use default local app data path
                basePath = Path.Combine(
                    Environment.GetEnvironmentVariable("LOCALAPPDATA"),
                    "GenXdev.PowerShell",
                    "KeyValueStore");
            }
            else
            {
                basePath = DatabasePath;
            }

            // Expand the base path using ExpandPath
            basePath = ExpandPath(basePath);

            // Output verbose message showing selected base path
            WriteVerbose($"Using KeyValueStore directory: {basePath}");

            // Determine the path for OneDrive synchronized store directory
            string shadowPath = ExpandPath(@"~\Onedrive\GenXdev.PowerShell.SyncObjects\KeyValueStore");

            // Output verbose message for shadow path
            WriteVerbose($"Using OneDrive sync directory: {shadowPath}");

            // Store paths for ProcessRecord
            this.basePath = basePath;
            this.shadowPath = shadowPath;
        }

        private string basePath;
        private string shadowPath;

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            InitializeKeyValueStores(DatabasePath);
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