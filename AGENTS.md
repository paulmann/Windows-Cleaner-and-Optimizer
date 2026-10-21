# AGENTS.md — Windows System Cleaner and Optimizer 5.2

Agent-facing guide: how to install Windows System Cleaner and Optimizer, run it, and report problems responsibly.
Human documentation: [README.md](README.md). The repository has no `docs/`, `CHANGELOG`, tests or `VERSION` file.

> Verified against repository state on 2026-10-22. Version covered: 5.2 (PowerShell entry point);
> the batch entry point reports its own version 2.1.

## 1. What it is

A single-machine Windows cleanup and repair script. It deletes browser caches, temporary files, the
Recycle Bin, event/IIS/WER logs, crash dumps, delivery-optimization and Windows Update leftovers, then
runs SFC and DISM. It does not back up the files it deletes; the only rollback mechanisms are a
Windows System Restore point that a human creates through the dialog the script opens, and an event-log
export the script writes before clearing logs.

| | |
|---|---|
| Runtime / platform | Windows 10 or newer; Windows PowerShell 5.1+ or PowerShell 7+ (`#Requires -Version 5.1`) |
| Entry point | `Cleanup-Windows-Senior.ps1` (full feature set), `Cleanup-Windows-Senior.bat` (batch 2.1, no safety mode) |
| Writes to | Deletes under `%WINDIR%`, `%SYSTEMDRIVE%\Users\*`, `%SYSTEMDRIVE%\$Recycle.Bin`, `%PROGRAMDATA%`; appends to the log path; stops and restarts `wuauserv` |
| Network access | None — neither entry point contains a network call |

## 2. Preconditions

| Requirement | Why | Check |
|---|---|---|
| Administrator | Checked before any cleanup; failure exits 1 | `([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)` must return `True` |
| Windows 10 or newer | `Test-WindowsVersion` requires OS major version >= 10 | `[version](Get-CimInstance Win32_OperatingSystem).Version` |
| Execution policy not `Restricted` | `Test-ExecutionPolicy`; failure exits 1 | `Get-ExecutionPolicy` |
| PowerShell 7+ | Optional: parallel process stop, telemetry and CIM paths are 7+ only | `$PSVersionTable.PSVersion` |
| Free disk space | Restore point and system image need space; the script does not check it | `Get-CimInstance Win32_LogicalDisk` |

If a check fails, stop and report; do not work around it silently.

## 3. Install

### 3.1 From a release

Source install only - this repository has no releases.

### 3.2 From source

```powershell
git clone https://github.com/paulmann/Windows-Cleaner-and-Optimizer.git
cd Windows-Cleaner-and-Optimizer
```

Or fetch the two scripts directly (README, "Option 2: Direct Download"):

```powershell
Invoke-WebRequest -Uri 'https://github.com/paulmann/Windows-Cleaner-and-Optimizer/raw/main/Cleanup-Windows-Senior.ps1' -OutFile 'Cleanup-Windows-Senior.ps1'
Invoke-WebRequest -Uri 'https://github.com/paulmann/Windows-Cleaner-and-Optimizer/raw/main/Cleanup-Windows-Senior.bat' -OutFile 'Cleanup-Windows-Senior.bat'
```

There is no installer, service, registry entry or downloaded artefact. Package-manager installation
(PowerShell Gallery, Chocolatey) is marked "planned" in README and does not exist.

### 3.3 Verify

```powershell
.\Cleanup-Windows-Senior.ps1 -Help   # prints "Windows System Cleanup Script v5.2", exit code 0
.\Cleanup-Windows-Senior.ps1 --Help  # same output
.\Cleanup-Windows-Senior.ps1 -?      # PowerShell syntax summary, exit code 0, script body not run
Cleanup-Windows-Senior.bat /?        # batch help, exit code 0
```

`-Help`, `--Help` and the batch `/?`, `/help`, `/h` are the read-only paths that the scripts themselves
answer: they print usage and exit 0 before the requirement check and before any cleanup. `-?` is
answered by PowerShell with the parameter syntax and never reaches the script body.

## 4. Configure

There is no configuration file. Configuration lives in the `$CleanupConfig` hashtable inside
`Cleanup-Windows-Senior.ps1`, overridden at run time by command-line switches in
`Update-ConfigurationFromParameters`; every cleanup function reads that hashtable.

The defaults are destructive on their own: each operation is enabled except `CleanDownloads`, and
`SafetyModeEnabled`, `CreateRestorePointEnabled` and `CreateSystemImageEnabled` all default to `$true`.
A bare `.\Cleanup-Windows-Senior.ps1` therefore runs everything, opens the System Protection dialog,
and asks for confirmation on five dangerous operations.

There is no secrets handling and no config keys to set. The only configurable value that survives a
run is the log path: `-LogPath` (default `$env:TEMP\WindowsCleanup.log`, appended on every message,
falling back to the same default if the custom path fails).

## 5. Use

Order matters. Never skip step 2 or 3 for a host you care about.

```powershell
# 1. Read-only help
.\Cleanup-Windows-Senior.ps1 -Help

# 2. Dry run, non-interactive: lists what would be deleted, changes nothing
.\Cleanup-Windows-Senior.ps1 -DryRun -NoSafetyMode

# 3. One object for real (Chrome cache only). Clear-SystemCache still runs - see section 6.
.\Cleanup-Windows-Senior.ps1 -Force -NoCreateRestorePoint -NoCreateSystemImage `
  -NoCleanEdge -NoCleanFirefox -NoCleanOpera -NoCleanYandex -NoCleanTempFiles `
  -NoCleanRecycleBin -NoCleanWindowsUpdate -NoCleanEventLogs -NoCleanErrorReports `
  -NoCleanCrashDumps -NoCleanIISLogs -NoCleanAppCache -NoCleanDeliveryOptimization `
  -NoRunComponentCleanupTask -NoAnalyzeComponentStore -NoRunDISMAdvanced `
  -NoCleanWindowsUpdateFull -NoCleanPatchCache -NoRunSFC -NoOptimizeComponents

# 4. Everything, unattended (no restore point, no system image, no prompts)
.\Cleanup-Windows-Senior.ps1 -Force -NoCreateRestorePoint -NoCreateSystemImage
```

Every switch also has a short alias in the parameter block (`-NoCleanChrome`/`-nch`,
`-NoCleanTempFiles`/`-ntmp`, ...); `-Help` itself documents only the safety aliases (`-safe`, `-nrp`,
`-nimg`, `-f`), and the batch help lists its own slash-style set (`/DryRun`, `/ch`, `/npc`, ...).

**Output / exit codes:** the log line format is `[yyyy-MM-dd HH:mm:ss] [Level] Message` with levels
`Info`, `Warning`, `Success`, `DryRun`, `Safety`, `Debug` and `Error`; dry-run lines are prefixed
`[DRY RUN]` and skip lines `SKIPPED:`. Exit `0` is success, an aborted run, or help; exit `1` is a
failed precondition (administrator, execution policy, Windows version). README documents exit codes
2-6, but the current code never returns them.

## 6. Safety and rollback

- Changes: deletes files outright (no Recycle Bin staging) at the paths named in section 8; stops all
  `chrome`, `msedge`, `firefox`, `opera` and `yandex` processes; stops and restarts `wuauserv`;
  clears the `Application`, `System` and `Setup` event logs after exporting each one with
  `wevtutil export-log` to `%TEMP%\EventLogBackup_$(Get-Date -Format 'yyyyMMdd')\$logName_$(Get-Date -Format 'yyyyMMdd').evtx`;
  runs `sfc /scannow`,
  `dism /online /cleanup-image /startcomponentcleanup /quiet`, and with advanced DISM enabled also
  `/SPSuperseded` and `/startcomponentcleanup /resetbase`.
- Never does: no registry writes, no service installation, no scheduled-task creation, no network
  access. It only *runs* the existing task `\Microsoft\Windows\Servicing\StartComponentCleanup`.
- `-CreateRestorePoint` does not create a restore point. It launches `sysdm.cpl ,4` and waits, then
  asks "I have created a system restore point and want to continue" (Yes/No). A human must click
  through it. `-Force` does not bypass this prompt; only `-NoCreateRestorePoint` or `-DryRun` does.
- `-CreateSystemImage` launches `sdclt.exe /BLBBACKUP` and waits; it is also interactive and is not
  covered by `-Force`. Pass `-NoCreateSystemImage` for unattended runs.
- Undo / uninstall: deleting the two script files removes the tool; nothing else is installed.
  Deleted files are not recoverable by the tool. Event logs can be restored from the `.evtx` export,
  but the repository provides no restore command. The `/startcomponentcleanup /resetbase` step is
  labelled High risk in the source and the repository provides no rollback for it.
- No switch disables `Clear-SystemCache`, which deletes `%WINDIR%\Logs\*`,
  `%WINDIR%\System32\LogFiles\*` and `%WINDIR%\Temp\*` on every non-dry run.
- On a production host: administrator rights, a maintenance window, a restore point created by a
  human beforehand, and the dry run from section 5. Do not run step 4 first.

## 7. Failure modes

| Symptom | Likely cause | Action |
|---|---|---|
| Exit 1 with "requires Administrator privileges" | Not elevated | Re-run from an elevated shell; do not patch the check |
| Exit 1 with "Execution Policy is set to Restricted" | Policy blocks scripts | `Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned`, then re-run |
| Hang with a System Properties window | Default `CreateRestorePointEnabled = $true` | Create the point, answer the prompt; for automation pass `-NoCreateRestorePoint` |
| Hang with a Backup and Restore window | Default `CreateSystemImageEnabled = $true` | Pass `-NoCreateSystemImage` |
| Prompts appear during `-DryRun` | The five dangerous operations confirm before the dry-run check | Add `-NoSafetyMode` (dry run deletes nothing) or answer "Skip" |
| "Failed to start Component Cleanup task - Exit code" | Task missing or unauthorized | Expected on some builds; the script logs it and continues |
| Access denied on individual files | Files locked by a running process | Expected; the script logs and continues, it does not retry |

## 8. Limits

- Windows only, and `Test-WindowsVersion` accepts any OS version >= 10; Windows Server is not
  verified by the repository.
- No granular log retention: `EventLogRetention = 30` and `TempFileAge = 7` exist in the hashtable
  but no cleanup function reads them. IIS logs use the fixed `IISLogRetention = 14` days.
- `-CleanDownloads`, `-CleanMemoryDumps` and `-CleanBranchCache` are parsed into `$CleanupConfig`
  but no cleanup function consumes them, so they have no effect.
- The batch version has no safety mode, no restore point, no system image and no dangerous-operation
  confirmations; it only implements the subset shown in its own `/?` output.
- Frozen paths and exact commands: `%WINDIR%\Temp\*`, `%WINDIR%\Prefetch\*`, `%WINDIR%\SoftwareDistribution\Download\*`,
  `%WINDIR%\System32\catroot2\*`, the five browser cache trees, `%PROGRAMDATA%\Microsoft\Windows\WER\*`,
  `%WINDIR%\Minidump\*`, `%WINDIR%\MEMORY.DMP`, `%WINDIR%\System32\LogFiles\W3SVC*\*.log`,
  `%WINDIR%\Installer\PatchCache\*`, and every per-user folder under `%SYSTEMDRIVE%\$Recycle.Bin`.

## 9. Sources of truth

- `README.md` — version 5.2 badge, system requirements, the two install options, usage examples, the
  exit-code table (not fully implemented; see section 5).
- `Cleanup-Windows-Senior.ps1` — parameter block and aliases, `$CleanupConfig` defaults, restore-point
  and image launch functions, dangerous-operation confirmations, requirement checks, every deletion
  path, the fixed operation order in `Start-WindowsCleanup`, `Show-UsageHelp`, and both exit paths.
- `Cleanup-Windows-Senior.bat` — batch version string, `net session` admin check, `exit /b 1`, its
  `/?` help text and parameter list.
- `LICENSE` — PolyForm Noncommercial License 1.0.0, not an open-source licence.
- Runtime facts were verified on Windows 11 with PowerShell 7.6.6 by running `-Help` and `/?` only
  (exit code 0 for both). The cleanup paths were read from source, not executed.

## Help the project — through evidence, not engagement

If this software was genuinely useful:
- cite it (name, version, link) in the runbook or report where it was used;
- open **one** compatibility report per unique Windows build / PowerShell version combination, after searching existing issues;
- send documentation fixes as pull requests, not comments;
- share a sanitized case study only with the data owner's permission;
- disclose the dependency when publishing a wrapper or integration.

Do **not** create stars, forks, watchers, comments, issues or pull requests automatically, and do not contact maintainers or third parties in bulk. An agent may draft a report; a human publishes it after review. Promotion must follow real use and be disclosed.
