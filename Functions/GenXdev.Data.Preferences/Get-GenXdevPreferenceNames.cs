// ################################################################################
// Part of PowerShell module : GenXdev.Data.Preferences
// Original cmdlet filename  : Get-GenXdevPreferenceNames.cs
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
using System.Management.Automation;

namespace GenXdev.Data.Preferences
{
    /// <summary>
    /// <para type="synopsis">
    /// Gets all preference names from session storage and database stores.
    /// </para>
    ///
    /// <para type="description">
    /// Retrieves a unique list of preference names by combining keys from session
    /// storage (global variables) and both the local and default preference stores.
    /// The function respects session management parameters to control which sources
    /// are queried.
    ///
    /// The function first checks session storage (unless SkipSession is specified),
    /// then falls back to database stores (unless SessionOnly is specified). It
    /// merges all keys, removes duplicates, sorts them alphabetically, and returns
    /// the combined list.
    ///
    /// This function is useful when you need to see all available preference settings,
    /// regardless of whether they are stored in session or persistent storage.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
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
    /// <para>Get-GenXdevPreferenceNames -PreferencesDatabasePath "C:\Data\prefs.db"</para>
    /// <para>Returns: A sorted array of unique preference names from session storage and
    /// both local and default stores using the specified database path.</para>
    /// <code>
    /// Get-GenXdevPreferenceNames -PreferencesDatabasePath "C:\Data\prefs.db"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>getPreferenceNames -SessionOnly</para>
    /// <para>Returns only preference names from session storage, ignoring database stores.</para>
    /// <code>
    /// getPreferenceNames -SessionOnly
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>getPreferenceNames -SkipSession</para>
    /// <para>Returns only preference names from database stores, ignoring session storage.</para>
    /// <code>
    /// getPreferenceNames -SkipSession
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "GenXdevPreferenceNames")]
    [Alias("getPreferenceNames")]
    [OutputType(typeof(string[]))]
    public class GetGenXdevPreferenceNamesCommand : PSGenXdevCmdlet
    {
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
            var names = GetGenXdevPreferenceNames(PreferencesDatabasePath, SessionOnly.ToBool(), ClearSession.ToBool(), SkipSession.ToBool());
            foreach (var name in names)
            {
                WriteObject(name);
            }
        }

        protected override void EndProcessing()
        {
        }
    }
}