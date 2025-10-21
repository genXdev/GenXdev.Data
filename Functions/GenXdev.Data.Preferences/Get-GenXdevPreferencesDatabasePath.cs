// ################################################################################
// Part of PowerShell module : GenXdev.Data.Preferences
// Original cmdlet filename  : Get-GenXdevPreferencesDatabasePath.cs
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
using System.IO;
using System.Management.Automation;
using System.Text.RegularExpressions;

namespace GenXdev.Data.Preferences
{
    /// <summary>
    /// <para type="synopsis">
    /// Gets the configured database path for preference data files used in GenXdev.Data operations.
    /// </para>
    ///
    /// <para type="description">
    /// This function retrieves the global database path used by the GenXdev.Data module for various preference storage and data operations. It checks Global variables first (unless SkipSession is specified), then uses system defaults.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -PreferencesDatabasePath &lt;string&gt;<br/>
    /// Optional database path override. If specified, this path will be returned instead of retrieving from configuration.<br/>
    /// - <b>Aliases</b>: DatabasePath<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: (none)<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SessionOnly &lt;SwitchParameter&gt;<br/>
    /// When specified, use alternative settings stored in session for Data preferences like Language, Database paths, etc.<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ClearSession &lt;SwitchParameter&gt;<br/>
    /// When specified, clears the session database path setting (Global variable) before retrieving the configuration.<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SkipSession &lt;SwitchParameter&gt;<br/>
    /// When specified, skips checking the session setting (Global variable) and retrieves only from persistent preferences.<br/>
    /// - <b>Aliases</b>: FromPreferences<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get the currently configured database path from Global variables or preferences.</para>
    /// <para>This example retrieves the database path using the default behavior.</para>
    /// <code>
    /// Get-GenXdevPreferencesDatabasePath
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get the configured database path using system defaults, ignoring any session setting.</para>
    /// <para>This example skips the session variable and uses persistent preferences.</para>
    /// <code>
    /// Get-GenXdevPreferencesDatabasePath -SkipSession
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Clear the session database path setting and then get the path using system defaults.</para>
    /// <para>This example clears the session setting before retrieving the path.</para>
    /// <code>
    /// Get-GenXdevPreferencesDatabasePath -ClearSession
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "GenXdevPreferencesDatabasePath")]
    [OutputType(typeof(string))]
    public class GetGenXdevPreferencesDatabasePathCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Optional database path override
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 0,
            HelpMessage = "Optional database path override"
        )]
        [Alias("DatabasePath")]
        public string PreferencesDatabasePath { get; set; }

        /// <summary>
        /// Use alternative settings stored in session for Data preferences like Language, Database paths, etc
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
        /// Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc"
        )]
        [Alias("FromPreferences")]
        public SwitchParameter SkipSession { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            WriteObject(GetPreferencesDatabasePath(PreferencesDatabasePath, SessionOnly.ToBool(), ClearSession.ToBool(), SkipSession.ToBool()));
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}