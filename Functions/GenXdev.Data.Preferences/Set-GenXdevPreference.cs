// ################################################################################
// Part of PowerShell module : GenXdev.Data.Preferences
// Original cmdlet filename  : Set-GenXdevPreference.cs
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

namespace GenXdev.Data.Preferences
{
    /// <summary>
    /// <para type="synopsis">
    /// Sets a preference value in the GenXdev preferences store.
    /// </para>
    ///
    /// <para type="description">
    /// This function manages preferences in the GenXdev local store. It can set new
    /// preferences, update existing ones, or remove them when a null/empty value is
    /// provided. The preferences are stored with synchronization set to "Local".
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Name &lt;String&gt;<br/>
    /// Specifies the name (key) of the preference to set. This is required and must not
    /// be null or empty.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Value &lt;String&gt;<br/>
    /// Specifies the value to store for the preference. If null or empty, the preference
    /// will be removed instead of being set.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Mandatory</b>: false<br/>
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
    /// Database path for preference data files.<br/>
    /// - <b>Aliases</b>: DatabasePath<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SkipSession &lt;SwitchParameter&gt;<br/>
    /// Dont use alternative settings stored in session for Data preferences like
    /// Language, Database paths, etc.<br/>
    /// - <b>Aliases</b>: FromPreferences<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Set-GenXdevPreference -Name "Theme" -Value "Dark"</para>
    /// <para>Sets the "Theme" preference to "Dark" in the local store.</para>
    /// <code>
    /// Set-GenXdevPreference -Name "Theme" -Value "Dark"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>setPreference Theme Light</para>
    /// <para>Uses the alias and positional parameters to set the Theme preference to Light.</para>
    /// <code>
    /// setPreference Theme Light
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "GenXdevPreference")]
    [Alias("setPreference")]
    public class SetGenXdevPreferenceCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The name of the preference to set
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "The name of the preference to set"
        )]
        [ValidateNotNullOrEmpty]
        [Alias("PreferenceName")]
        public string Name { get; set; }

        /// <summary>
        /// The value to store for the preference
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 1,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "The value to store for the preference"
        )]
        [AllowNull]
        [AllowEmptyString]
        [Alias("PreferenceValue")]
        public string Value { get; set; }

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
        /// Database path for preference data files
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
        [Alias("FromPreferences")]
        public SwitchParameter SkipSession { get; set; }

        protected override void BeginProcessing()
        {
        }

        protected override void ProcessRecord()
        {
            SetGenXdevPreference(Name, Value, PreferencesDatabasePath, SessionOnly.ToBool(), ClearSession.ToBool(), SkipSession.ToBool());
        }

        protected override void EndProcessing()
        {
        }
    }
}