// ################################################################################
// Part of PowerShell module : GenXdev.Data.KeyValueStore
// Original cmdlet filename  : Get-KeyValueStorePath.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 1.304.2025
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
using System.Linq;
using System.Management.Automation;
using System.Text.RegularExpressions;

namespace GenXdev.Data.KeyValueStore
{
    /// <summary>
    /// <para type="synopsis">
    /// Gets the file path for a key-value store.
    /// </para>
    ///
    /// <para type="description">
    /// This cmdlet constructs the file path for a key-value store based on the synchronization key, store name, and base directory.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -SynchronizationKey &lt;string&gt;<br/>
    /// The synchronization key used to identify the store.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -StoreName &lt;string&gt;<br/>
    /// The name of the key-value store.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -BasePath &lt;string&gt;<br/>
    /// The base directory path for store files.<br/>
    /// - <b>Default</b>: %LOCALAPPDATA%\GenXdev.PowerShell\KeyValueStore<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get the path for a local key-value store</para>
    /// <code>
    /// Get-KeyValueStorePath -SynchronizationKey "Local" -StoreName "MyStore"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "KeyValueStorePath")]
    [OutputType(typeof(string))]
    public class GetKeyValueStorePath : PSGenXdevCmdlet
    {
        /// <summary>
        /// The synchronization key used to identify the store.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            HelpMessage = "The synchronization key used to identify the store"
        )]
        [ValidateNotNullOrEmpty]
        public string SynchronizationKey { get; set; }

        /// <summary>
        /// The name of the key-value store.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 1,
            HelpMessage = "The name of the key-value store"
        )]
        [ValidateNotNullOrEmpty]
        public string StoreName { get; set; }

        /// <summary>
        /// The base directory path for store files.
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "The base directory path for store files"
        )]
        public string BasePath { get; set; }

        /// <summary>
        /// Begin processing - initialize cmdlet.
        /// </summary>
        protected override void BeginProcessing()
        {
            BasePath = BasePath == null ? GetGenXdevAppDataPath("KeyValueStore") : BasePath;
            WriteVerbose($"Constructing store file path for store '{StoreName}' with sync key '{SynchronizationKey}'");
        }

        /// <summary>
        /// Process each input object.
        /// </summary>
        protected override void ProcessRecord()
        {
            try
            {
                BasePath = ExpandPath(BasePath);
                string path = GetKeyValueStorePath(SynchronizationKey, StoreName, BasePath);
                WriteObject(path);
            }
            catch (Exception ex)
            {
                WriteError(new ErrorRecord(
                    ex,
                    "Get-KeyValueStorePathError",
                    ErrorCategory.InvalidOperation,
                    this
                ));
            }
        }

        /// <summary>
        /// End processing - cleanup if needed.
        /// </summary>
        protected override void EndProcessing()
        {
            // No cleanup needed
        }
    }
}