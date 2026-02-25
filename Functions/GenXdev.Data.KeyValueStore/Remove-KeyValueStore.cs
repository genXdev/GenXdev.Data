// ################################################################################
// Part of PowerShell module : GenXdev.Data.KeyValueStore
// Original cmdlet filename  : Remove-KeyValueStore.cs
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
    /// Removes a key-value store.
    /// </para>
    ///
    /// <para type="description">
    /// This function deletes a specified key-value store. For local stores, it
    /// physically removes the file. For synchronized stores, it marks all keys
    /// as deleted and triggers synchronization.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -StoreName &lt;String&gt;<br/>
    /// Name of the store to delete.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SynchronizationKey &lt;String&gt;<br/>
    /// Key to identify synchronization scope. Defaults to 'Local'.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Default</b>: "Local"<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabasePath &lt;String&gt;<br/>
    /// Database path for key-value store data files.<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Remove a local key-value store named "MyStore"</para>
    /// <para>This example demonstrates how to remove a local key-value store.</para>
    /// <code>
    /// Remove-KeyValueStore -StoreName "MyStore"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Remove a synchronized key-value store</para>
    /// <para>This example shows how to remove a synchronized store with a specific synchronization key.</para>
    /// <code>
    /// Remove-KeyValueStore "MyStore" -SynchronizationKey "Cloud"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Remove, "KeyValueStore")]
    [OutputType(typeof(void))]
    public class RemoveKeyValueStoreCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Name of the store to delete
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            HelpMessage = "Name of the store to delete")]
        [ValidateNotNullOrEmpty]
        public string StoreName { get; set; }

        /// <summary>
        /// Key to identify synchronization scope
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 1,
            HelpMessage = "Key to identify synchronization scope")]
        public string SynchronizationKey { get; set; } = "Local";

        /// <summary>
        /// Database path for key-value store data files
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Database path for key-value store data files")]
        public string DatabasePath { get; set; }

        private string basePath;

        /// <summary>
        /// Begin processing - determine base directory path
        /// </summary>
        protected override void BeginProcessing()
        {
            // Determine base directory path using provided path or default location
            if (string.IsNullOrWhiteSpace(DatabasePath))
            {
                // Build default path to local application data folder
                basePath = GetGenXdevAppDataPath("KeyValueStore");
            }
            else
            {
                // Use provided base path
                basePath = DatabasePath;
            }

            // Output verbose information about store directory location
            WriteVerbose($"Using KeyValueStore directory: {basePath}");
        }

        /// <summary>
        /// Process record - remove the key-value store
        /// </summary>
        protected override void ProcessRecord()
        {
            // Determine appropriate operation based on synchronization scope
            string operation;
            if (SynchronizationKey == "Local")
            {
                operation = "Deleting local store file";
            }
            else
            {
                operation = "Marking all keys in sync store as deleted";
            }

            // Verify user consent
            if (ShouldProcess(StoreName, operation))
            {
                RemoveKeyValueStore(StoreName, SynchronizationKey, DatabasePath);
            }
        }

        /// <summary>
        /// End processing - no cleanup needed
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}