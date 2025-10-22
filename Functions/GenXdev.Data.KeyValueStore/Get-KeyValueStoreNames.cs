// ################################################################################
// Part of PowerShell module : GenXdev.Data.KeyValueStore
// Original cmdlet filename  : Get-KeyValueStoreNames.cs
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



using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Management.Automation;

namespace GenXdev.Data.KeyValueStore
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves the names of available key-value stores.
    /// </para>
    ///
    /// <para type="description">
    /// This function scans the key-value store directory for JSON files and
    /// extracts unique store names based on the specified synchronization key
    /// pattern. It ensures the store directory exists and synchronizes non-local
    /// stores if necessary.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -SynchronizationKey &lt;String&gt;<br/>
    /// Key to identify synchronization scope, defaults to all ('%').<br/>
    /// - <b>Aliases</b>: none<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: "%"<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabasePath &lt;String&gt;<br/>
    /// Database path for key-value store data files. If not specified, uses
    /// the default local app data path.<br/>
    /// - <b>Aliases</b>: none<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: null<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get-KeyValueStoreNames</para>
    /// <para>Retrieves all store names from the default location.</para>
    /// <code>
    /// Get-KeyValueStoreNames
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get-KeyValueStoreNames -SynchronizationKey 'Local'</para>
    /// <para>Retrieves store names for the 'Local' synchronization scope.</para>
    /// <code>
    /// Get-KeyValueStoreNames -SynchronizationKey 'Local'
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>getstorenames -DatabasePath 'C:\MyStores'</para>
    /// <para>Retrieves all store names from a custom database path using the alias.</para>
    /// <code>
    /// getstorenames -DatabasePath 'C:\MyStores'
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "KeyValueStoreNames")]
    [OutputType(typeof(string))]
    [Alias("getstorenames")]
    public class GetKeyValueStoreNamesCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Key to identify synchronization scope, defaults to all ('%').
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 0,
            HelpMessage = "Key to identify synchronization scope, defaults to all")]
        public string SynchronizationKey { get; set; } = "%";

        /// <summary>
        /// Database path for key-value store data files.
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Database path for key-value store data files")]
        public string DatabasePath { get; set; }

        private string basePath;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Check if database path is provided, otherwise use default
            basePath = string.IsNullOrWhiteSpace(DatabasePath) ? GetGenXdevAppDataPath("KeyValueStore") : DatabasePath;

            // Output verbose message for store directory path
            WriteVerbose($"Using KeyValueStore directory: {basePath}");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            var names = GetKeyValueStoreNames(SynchronizationKey, DatabasePath);
            foreach (var name in names)
            {
                WriteObject(name);
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}