// ################################################################################
// Part of PowerShell module : GenXdev.Data.KeyValueStore
// Original cmdlet filename  : Get-ValueByKeyFromStore.cs
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
using System.Management.Automation;

namespace GenXdev.Data.KeyValueStore
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves a value from a JSON-based key-value store.
    /// </para>
    ///
    /// <para type="description">
    /// Retrieves a value for a specified key from a JSON file-based key-value store.
    /// The function supports optional default values and synchronization across
    /// different scopes. It can use session-based settings or direct file access and
    /// provides automatic directory initialization and synchronization capabilities.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -StoreName &lt;string&gt;<br/>
    /// The name of the key-value store to query.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -KeyName &lt;string&gt;<br/>
    /// The key whose value should be retrieved.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DefaultValue &lt;string&gt;<br/>
    /// Optional default value to return if the key is not found.<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Default</b>: null<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SynchronizationKey &lt;string&gt;<br/>
    /// Optional key to identify synchronization scope. Defaults to "Local".<br/>
    /// - <b>Position</b>: 3<br/>
    /// - <b>Default</b>: "Local"<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DatabasePath &lt;string&gt;<br/>
    /// Database path for key-value store data files.<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get a value from the AppSettings store with a default</para>
    /// <para>This example retrieves the "Theme" value from the "AppSettings" store, returning "Dark" if not found.</para>
    /// <code>
    /// Get-ValueByKeyFromStore -StoreName "AppSettings" -KeyName "Theme" -DefaultValue "Dark"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get a value using the alias</para>
    /// <para>This example uses the 'getvalue' alias to retrieve a value.</para>
    /// <code>
    /// getvalue AppSettings Theme
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "ValueByKeyFromStore")]
    [Alias("getvalue")]
    [OutputType(typeof(string))]
    public class GetValueByKeyFromStoreCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The name of the key-value store to query
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            HelpMessage = "Name of the store to retrieve the key from"
        )]
        public string StoreName { get; set; }

        /// <summary>
        /// The key whose value should be retrieved
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 1,
            HelpMessage = "Key to retrieve from the specified store"
        )]
        public string KeyName { get; set; }

        /// <summary>
        /// Optional default value to return if the key is not found
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 2,
            HelpMessage = "A optional default value"
        )]
        public string DefaultValue { get; set; }

        /// <summary>
        /// Optional key to identify synchronization scope
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 3,
            HelpMessage = "Key to identify synchronization scope"
        )]
        public string SynchronizationKey { get; set; } = "Local";

        /// <summary>
        /// Database path for key-value store data files
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Database path for key-value store data files"
        )]
        public string DatabasePath { get; set; }

        /// <summary>
        /// Process the request to retrieve the value
        /// </summary>
        protected override void ProcessRecord()
        {
            WriteObject(GetValueByKeyFromStore(StoreName, KeyName, DefaultValue, SynchronizationKey, DatabasePath));
        }
    }
}