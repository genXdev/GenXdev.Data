// ################################################################################
// Part of PowerShell module : GenXdev.Data.Preferences
// Original cmdlet filename  : Set-GenXdevPreferencesDatabasePath.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 2.1.2025
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
    /// Sets the database path for preferences used in GenXdev.Data operations.
    /// </para>
    ///
    /// <para type="description">
    /// This cmdlet configures the global database path used by the GenXdev.Data
    /// module for various preference storage and data operations. Settings are
    /// stored in the current session (using Global variables) and can be cleared
    /// from the session (using -ClearSession).
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -PreferencesDatabasePath &lt;String&gt;<br/>
    /// A database path where preference data files are located. This path will be used
    /// by GenXdev.Data functions for preference storage and processing operations.<br/>
    /// - <b>Aliases</b>: DatabasePath<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: (none)<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SkipSession &lt;SwitchParameter&gt;<br/>
    /// Dont use alternative settings stored in session for Data preferences like
    /// Language, Database paths, etc.<br/>
    /// - <b>Aliases</b>: FromPreferences<br/>
    /// - <b>Position</b>: Named<br/>
    /// - <b>Default</b>: False<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SessionOnly &lt;SwitchParameter&gt;<br/>
    /// When specified, stores the setting only in the current session (Global
    /// variable) without persisting to preferences. Setting will be lost when the
    /// session ends.<br/>
    /// - <b>Aliases</b>: (none)<br/>
    /// - <b>Position</b>: Named<br/>
    /// - <b>Default</b>: False<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ClearSession &lt;SwitchParameter&gt;<br/>
    /// When specified, clears only the session setting (Global variable) without
    /// affecting persistent preferences.<br/>
    /// - <b>Aliases</b>: (none)<br/>
    /// - <b>Position</b>: Named<br/>
    /// - <b>Default</b>: False<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Sets the database path in the current session (Global variable).</para>
    /// <para>This example demonstrates setting a database path for preferences.</para>
    /// <code>
    /// Set-GenXdevPreferencesDatabasePath -PreferencesDatabasePath "C:\Data\Preferences.db"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Sets the database path in the current session using positional parameter.</para>
    /// <para>This example shows using the positional parameter to set the database path.</para>
    /// <code>
    /// Set-GenXdevPreferencesDatabasePath "C:\MyPreferences.db"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Sets the database path in session only, without persisting to preferences.</para>
    /// <para>This example sets the path only for the current session.</para>
    /// <code>
    /// Set-GenXdevPreferencesDatabasePath "C:\TempPrefs.db" -SessionOnly
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Clears the session database path setting.</para>
    /// <para>This example clears the Global variable for the database path.</para>
    /// <code>
    /// Set-GenXdevPreferencesDatabasePath -ClearSession
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "GenXdevPreferencesDatabasePath")]
    public class SetGenXdevPreferencesDatabasePathCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// A database path where preference data files are located
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 0,
            HelpMessage = "A database path where preference data files are located"
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

        /// <summary>
        /// When specified, stores the setting only in the current session (Global
        /// variable) without persisting to preferences
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "When specified, stores the setting only in the current session (Global variable) without persisting to preferences"
        )]
        public SwitchParameter SessionOnly { get; set; }

        /// <summary>
        /// When specified, clears only the session setting (Global variable) without
        /// affecting persistent preferences
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "When specified, clears only the session setting (Global variable) without affecting persistent preferences"
        )]
        public SwitchParameter ClearSession { get; set; }

        /// <summary>
        /// Begin processing - validate parameters and expand path if needed
        /// </summary>
        protected override void BeginProcessing()
        {
            if ((!ClearSession.ToBool()) &&
                string.IsNullOrWhiteSpace(PreferencesDatabasePath))
            {
                var errorRecord = new ErrorRecord(
                    new ArgumentException("PreferencesDatabasePath parameter is required when not using -ClearSession"),
                    "MissingPreferencesDatabasePath",
                    ErrorCategory.InvalidArgument,
                    null);
                ThrowTerminatingError(errorRecord);
            }
        }

        /// <summary>
        /// Process record - handle clearing or setting the global variable
        /// </summary>
        protected override void ProcessRecord()
        {
            SetPreferencesDatabasePath(PreferencesDatabasePath, SkipSession.ToBool(), SessionOnly.ToBool(), ClearSession.ToBool());
        }

        /// <summary>
        /// End processing - no cleanup needed
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}