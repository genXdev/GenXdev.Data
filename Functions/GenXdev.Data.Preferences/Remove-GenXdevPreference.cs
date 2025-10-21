// ################################################################################
// Part of PowerShell module : GenXdev.Data.Preferences
// Original cmdlet filename  : Remove-GenXdevPreference.cs
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
using System.Collections;
using System.Management.Automation;

namespace GenXdev.Data.Preferences
{
    /// <summary>
    /// <para type="synopsis">
    /// Removes a preference value from the GenXdev preferences store.
    /// </para>
    ///
    /// <para type="description">
    /// This function removes a preference value from both the local store and
    /// optionally from the default store. It provides two parameter sets - one for
    /// local removal only and another for removing from both local and
    /// default stores.
    /// The function ensures proper synchronization when modifying the default store.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Name &lt;String&gt;<br/>
    /// Specifies the name of the preference to remove. This is required and can be
    /// provided via pipeline input.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -RemoveDefault &lt;SwitchParameter&gt;<br/>
    /// When specified, removes the preference from both the local and default stores.
    /// If not specified, only removes from the local store.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SessionOnly &lt;SwitchParameter&gt;<br/>
    /// Use alternative settings stored in session for Data preferences like Language,
    /// Database paths, etc.<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ClearSession &lt;SwitchParameter&gt;<br/>
    /// Clear the session setting (Global variable) before retrieving.<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -PreferencesDatabasePath &lt;String&gt;<br/>
    /// Database path for preference data files.
    /// Alias: DatabasePath<br/>
    /// - <b>Aliases</b>: DatabasePath<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SkipSession &lt;SwitchParameter&gt;<br/>
    /// Dont use alternative settings stored in session for Data preferences like
    /// Language, Database paths, etc.<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Remove-GenXdevPreference -Name "Theme"</para>
    /// <para>Removes the "Theme" preference from the local store only.</para>
    /// <code>
    /// Remove-GenXdevPreference -Name "Theme"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>removePreference "Theme" -RemoveDefault</para>
    /// <para>Removes the "Theme" preference from both local and default stores.</para>
    /// <code>
    /// removePreference "Theme" -RemoveDefault
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Remove, "GenXdevPreference")]
    [Alias("removePreference")]
    public class RemoveGenXdevPreferenceCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The name of the preference to remove
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "The name of the preference to remove"
        )]
        [ValidateNotNullOrEmpty]
        public string Name { get; set; }

        /// <summary>
        /// Switch to also remove the preference from defaults
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 1,
            ParameterSetName = "All",
            HelpMessage = "Switch to also remove the preference from defaults"
        )]
        public SwitchParameter RemoveDefault { get; set; }

        /// <summary>
        /// Use alternative settings stored in session for Data preferences like Language,
        /// Database paths, etc
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Use alternative settings stored in session for Data preferences like Language, Database paths, etc"
        )]
        public SwitchParameter SessionOnly { get; set; }

        /// <summary>
        /// Clear the session setting (Global variable) before retrieving
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Clear the session setting (Global variable) before retrieving"
        )]
        public SwitchParameter ClearSession { get; set; }

        /// <summary>
        /// Database path for preference data files.
        /// Alias: DatabasePath
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Database path for preference data files"
        )]
        [Alias("DatabasePath")]
        public string PreferencesDatabasePath { get; set; }

        /// <summary>
        /// Dont use alternative settings stored in session for Data preferences like
        /// Language, Database paths, etc
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc"
        )]
        public SwitchParameter SkipSession { get; set; }

        protected override void BeginProcessing()
        {
        }

        protected override void ProcessRecord()
        {
            RemoveGenXdevPreference(Name, RemoveDefault.ToBool(), PreferencesDatabasePath, SessionOnly.ToBool(), ClearSession.ToBool(), SkipSession.ToBool());
        }

        protected override void EndProcessing()
        {
        }
    }
}