// ################################################################################
// Part of PowerShell module : GenXdev.Data.KeyValueStore
// Original cmdlet filename  : Sync-KeyValueStore.cs
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
using System.Globalization;
using System.Management.Automation;

namespace GenXdev.Data.KeyValueStore
{
    /// <summary>
    /// <para type="synopsis">
    /// Synchronizes local and OneDrive key-value store JSON files.
    /// </para>
    ///
    /// <para type="description">
    /// Performs two-way synchronization between local and OneDrive shadow JSON files using
    /// a last-modified timestamp strategy. Records are merged based on their last
    /// modification time, with newer versions taking precedence.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -SynchronizationKey &lt;String&gt;<br/>
    /// Identifies the synchronization scope for the operation. Using "Local" will skip
    /// synchronization as it indicates local-only records.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: "Local"<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabasePath &lt;String&gt;<br/>
    /// Database path for key-value store data files.<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Sync-KeyValueStore</para>
    /// <code>
    /// Sync-KeyValueStore
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Sync-KeyValueStore -SynchronizationKey "UserSettings"</para>
    /// <code>
    /// Sync-KeyValueStore -SynchronizationKey "UserSettings"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsData.Sync, "KeyValueStore")]
    public class SyncKeyValueStoreCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Identifies the synchronization scope for the operation
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 0,
            HelpMessage = "Key to identify synchronization scope")]
        public string SynchronizationKey { get; set; } = "Local";

        /// <summary>
        /// Database path for key-value store data files
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Database path for key-value store data files")]
        public string DatabasePath { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose($"Starting key-value store sync with key: {SynchronizationKey}");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            SyncKeyValueStore(SynchronizationKey, DatabasePath);
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            WriteVerbose("Sync operation completed");
        }
    }
}