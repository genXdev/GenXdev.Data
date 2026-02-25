// ################################################################################
// Part of PowerShell module : GenXdev.Data.KeyValueStore
// Original cmdlet filename  : Set-ValueByKeyInStore.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 3.3.2026
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

namespace GenXdev.Data.KeyValueStore
{
    /// <summary>
    /// <para type="synopsis">
    /// Manages key-value pairs in a JSON file-based store.
    /// </para>
    ///
    /// <para type="description">
    /// Provides persistent storage for key-value pairs using JSON files. Handles both
    /// insertion of new entries and updates to existing ones. Supports optional
    /// synchronization for non-local stores. This function implements an upsert
    /// operation that either inserts new key-value pairs or updates existing ones
    /// based on the combination of synchronization key, store name, and key name.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -StoreName &lt;string&gt;<br/>
    /// The name of the store where the key-value pair will be saved.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -KeyName &lt;string&gt;<br/>
    /// The unique identifier for the value within the specified store.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Value &lt;string&gt;<br/>
    /// The data to be stored, associated with the specified key.<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SynchronizationKey &lt;string&gt;<br/>
    /// Identifies the synchronization scope. Use "Local" for local-only storage.<br/>
    /// - <b>Position</b>: 3<br/>
    /// - <b>Default</b>: "Local"<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabasePath &lt;string&gt;<br/>
    /// Database path for key-value store data files.<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Set a value in the configuration store</para>
    /// <para>This example sets an API endpoint in the ConfigStore.</para>
    /// <code>
    /// Set-ValueByKeyInStore -StoreName "ConfigStore" -KeyName "ApiEndpoint" `
    ///     -Value "https://api.example.com"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Use the alias to set a value</para>
    /// <para>This example uses the setvalue alias to set a value.</para>
    /// <code>
    /// setvalue ConfigStore ApiEndpoint "https://api.example.com"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "ValueByKeyInStore")]
    [Alias("setvalue")]
    public class SetValueByKeyInStoreCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The name of the store where the key-value pair will be saved.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            HelpMessage = "Store name for the key-value pair"
        )]
        public string StoreName { get; set; }

        /// <summary>
        /// The unique identifier for the value within the specified store.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 1,
            HelpMessage = "Name of the key to set or update"
        )]
        public string KeyName { get; set; }

        /// <summary>
        /// The data to be stored, associated with the specified key.
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 2,
            HelpMessage = "Value to be stored"
        )]
        public string Value { get; set; }

        /// <summary>
        /// Identifies the synchronization scope. Use "Local" for local-only storage.
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 3,
            HelpMessage = "Key to identify synchronization scope"
        )]
        public string SynchronizationKey { get; set; } = "Local";

        /// <summary>
        /// Database path for key-value store data files.
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Database path for key-value store data files"
        )]
        public string DatabasePath { get; set; }

        private string basePath;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // use provided base path or default to local app data
            if (string.IsNullOrWhiteSpace(DatabasePath))
            {
                basePath = Path.Combine(
                    Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
                    "GenXdev.PowerShell",
                    "KeyValueStore"
                );
            }
            else
            {
                basePath = DatabasePath;
            }

            WriteVerbose("Using KeyValueStore directory: " + basePath);
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // only proceed if user confirms or -WhatIf is not used
            if (ShouldProcess(
                    "Store: " + StoreName + ", Key: " + KeyName,
                    "Set value to: " + Value))
            {
                SetValueByKeyInStore(StoreName, KeyName, Value, SynchronizationKey, DatabasePath);
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