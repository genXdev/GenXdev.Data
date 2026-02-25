// ################################################################################
// Part of PowerShell module : GenXdev.Data.KeyValueStore
// Original cmdlet filename  : Remove-KeyFromStore.cs
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
    /// Removes a key from a key-value store.
    /// </para>
    ///
    /// <para type="description">
    /// This function removes a specified key from a named key-value store.
    /// For local stores, the key is permanently deleted. For synchronized
    /// stores, the key is marked as deleted to allow for synchronization.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -StoreName &lt;String&gt;<br/>
    /// Name of the store<br/>
    /// - <b>Aliases</b>: None<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: None<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -KeyName &lt;String&gt;<br/>
    /// Key to be deleted<br/>
    /// - <b>Aliases</b>: None<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Default</b>: None<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SynchronizationKey &lt;String&gt;<br/>
    /// Key to identify synchronization scope<br/>
    /// - <b>Aliases</b>: None<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Default</b>: "Local"<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabasePath &lt;String&gt;<br/>
    /// Database path for key-value store data files<br/>
    /// - <b>Aliases</b>: None<br/>
    /// - <b>Position</b>: Named<br/>
    /// - <b>Default</b>: None<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Remove a key from a store</para>
    /// <para>This example removes the key "MyKey" from the store "MyStore".</para>
    /// <code>
    /// Remove-KeyFromStore -StoreName "MyStore" -KeyName "MyKey"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Remove a key using the alias</para>
    /// <para>This example uses the alias "removekey" to remove a key.</para>
    /// <code>
    /// removekey "MyStore" "MyKey"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Remove, "KeyFromStore", SupportsShouldProcess = true)]
    [Alias("removekey")]
    public class RemoveKeyFromStoreCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Name of the store
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            HelpMessage = "Name of the store")]
        public string StoreName { get; set; }

        /// <summary>
        /// Key to be deleted
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 1,
            HelpMessage = "Key to be deleted")]
        public string KeyName { get; set; }

        /// <summary>
        /// Key to identify synchronization scope
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 2,
            HelpMessage = "Key to identify synchronization scope")]
        public string SynchronizationKey { get; set; } = "Local";

        /// <summary>
        /// Database path for key-value store data files
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Database path for key-value store data files")]
        public string DatabasePath { get; set; }

        // Private fields for processing
        private string basePath;
        private string lastModifiedBy;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {

            // Use provided base path or default to local app data
            if (string.IsNullOrWhiteSpace(DatabasePath))
            {

                basePath = Path.Combine(
                    Environment.GetEnvironmentVariable("LOCALAPPDATA"),
                    "GenXdev.PowerShell",
                    "KeyValueStore");
            }
            else
            {

                basePath = DatabasePath?.ToString() ?? Path.Combine(
                    Environment.GetEnvironmentVariable("LOCALAPPDATA"),
                    "GenXdev.PowerShell",
                    "KeyValueStore");
            }

            WriteVerbose($"Using KeyValueStore directory: {basePath}");
            WriteVerbose($"Preparing to remove key '{KeyName}' from store '{StoreName}'");

            // Ensure store directory structure exists
            if (!System.IO.Directory.Exists(basePath))
            {
                WriteVerbose("Store directory not found, initializing...");
                InitializeKeyValueStores(DatabasePath);
            }

            // Get current user info for audit trail
            string computerName = Environment.GetEnvironmentVariable("COMPUTERNAME");
            string userName = Environment.GetEnvironmentVariable("USERNAME");
            lastModifiedBy = $"{computerName}\\{userName}";
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Determine operation type based on synchronization key
            string operation = "Mark as deleted";

            // Check if user wants to proceed with deletion
            if (ShouldProcess(
                $"Key '{KeyName}' in store '{StoreName}'",
                operation))
            {
                RemoveKeyFromStore(StoreName, KeyName, SynchronizationKey, DatabasePath);
            }
        }        /// <summary>
                 /// End processing - cleanup logic
                 /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}