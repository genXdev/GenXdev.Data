// ################################################################################
// Part of PowerShell module : GenXdev.Data.SqlServer
// Original cmdlet filename  : Invoke-SSMS.cs
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



using System.Diagnostics;
using System.Management.Automation;

namespace GenXdev.Data.SqlServer
{
    /// <summary>
    /// <para type="synopsis">
    /// Launches SQL Server Management Studio (SSMS) after ensuring it is installed.
    /// </para>
    ///
    /// <para type="description">
    /// This cmdlet ensures SQL Server Management Studio is installed and then launches it.
    /// If SSMS is not found, it will attempt to install it using WinGet before launching.
    /// </para>
    ///
    /// <example>
    /// <para>Example: Launch SSMS</para>
    /// <para>Launches SQL Server Management Studio.</para>
    /// <code>
    /// Invoke-SSMS
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Example: Use alias to launch SSMS</para>
    /// <para>Uses the 'ssms' alias to launch SQL Server Management Studio.</para>
    /// <code>
    /// ssms
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsLifecycle.Invoke, "SSMS")]
    [Alias("ssms", "sqlservermanagementstudio")]
    [OutputType(typeof(void))]
    public class InvokeSSMSCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Begin processing - ensures SSMS is installed
        /// </summary>
        protected override void BeginProcessing()
        {
            // Call EnsureSSMS to ensure SSMS is installed
            InvokeCommand.InvokeScript("EnsureSSMS");
        }

        /// <summary>
        /// Process record - main processing logic (empty for this cmdlet)
        /// </summary>
        protected override void ProcessRecord()
        {
            // No processing needed for individual records
        }

        /// <summary>
        /// End processing - finds and launches SSMS
        /// </summary>
        protected override void EndProcessing()
        {
            // Find the SSMS executable path
            var searchPathResult = InvokeCommand.InvokeScript(
                "GenXdev.FileSystem\\Find-Item " +
                "\"${Env:ProgramFiles(x86)}\\*SQL Server Management*\\Ssms.exe\"," +
                "\"${Env:ProgramFiles}\\*SQL Server Management*\\Ssms.exe\" | " +
                "Microsoft.PowerShell.Utility\\Sort-Object LastWriteTime -Descending | " +
                "Microsoft.PowerShell.Utility\\Select-Object -First 1");

            if (searchPathResult == null || searchPathResult.Count == 0)
            {
                // Throw error if SSMS not found after installation attempt
                ThrowTerminatingError(new ErrorRecord(
                    new System.Exception("SSMS not found after installation attempt."),
                    "SSMSNotFound",
                    ErrorCategory.ObjectNotFound,
                    null));
                return;
            }

            // Get the path from the result
            var searchPath = searchPathResult[0]?.BaseObject?.ToString();
            if (string.IsNullOrEmpty(searchPath))
            {
                ThrowTerminatingError(new ErrorRecord(
                    new System.Exception("SSMS not found after installation attempt."),
                    "SSMSNotFound",
                    ErrorCategory.ObjectNotFound,
                    null));
                return;
            }

            // Launch SSMS using PowerShell Start-Process
            try
            {
                InvokeCommand.InvokeScript($@"
                    Microsoft.PowerShell.Management\Start-Process -FilePath '{searchPath}' -UseShellExecute
                ");
            }
            catch (System.Exception ex)
            {
                ThrowTerminatingError(new ErrorRecord(
                    ex,
                    "SSMSLaunchFailed",
                    ErrorCategory.OperationStopped,
                    searchPath));
            }
        }
    }
}