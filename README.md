# Windows System Cleaner and Optimizer 🧹✨

[![Version](https://img.shields.io/badge/version-4.4.0-blue.svg)]([https://github.com/paulmann/Windows-Cleaner-and-Optimizer](https://github.com/paulmann/Windows-Cleaner-and-Optimizer))
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![PowerShell](https://img.shields.io/badge/powershell-5.1%2B-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![Batch](https://img.shields.io/badge/batch-cmd-orange.svg)](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/cmd)
[![Platform](https://img.shields.io/badge/platform-Windows%207|10|11|12-blue.svg)](https://www.microsoft.com/windows/)

> **A comprehensive, enterprise-grade Windows cleanup automation tool that safely clears browser caches, temp files, system logs, and optimizes component store for maximum performance and disk space recovery.**

Windows System Cleaner and Optimizer is a robust, professional-grade automation solution designed for system administrators and power users who need reliable disk cleanup before system imaging, backups, or disk migrations. It supports both PowerShell and Batch execution with extensive configuration options, comprehensive logging, and enterprise deployment capabilities.

## ⚡ Quick Start

### 1. PowerShell Version (Recommended)

```powershell
# Clone and install
git clone https://github.com/paulmann/Windows-Cleaner-and-Optimizer.git
cd Windows-Cleaner-and-Optimizer

# Run as Administrator
.\Cleanup-Windows-Senior.ps1

# With custom parameters
.\Cleanup-Windows-Senior.ps1 -DryRun -CleanForAllUsers

# One-time bypass execution policy
powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows-Senior.ps1"
```

### 2. Batch Version (Alternative)

```cmd
# Download and run (Administrator required)
curl -L -o Cleanup-Windows-Senior.bat "https://github.com/paulmann/Windows-Cleaner-and-Optimizer/raw/main/Cleanup-Windows-Senior.bat"
Cleanup-Windows-Senior.bat

# Or run from repository
git clone https://github.com/paulmann/Windows-Cleaner-and-Optimizer.git
cd Windows-Cleaner-and-Optimizer
Cleanup-Windows-Senior.bat
```

## 📋 Table of Contents

1. [✨ Key Features](#-key-features)
2. [📋 Installation & Usage](#-installation--usage)
   - [System Requirements](#system-requirements)
   - [Installation Options](#installation-options)
   - [PowerShell Setup](#powershell-setup)
   - [Batch File Setup](#batch-file-setup)
   - [Usage Examples](#usage-examples)
3. [🏗️ Advanced Features](#️-advanced-features)
4. [🔗 DevOps Integration](#-devops-integration)
5. [🏢 Enterprise Usage](#-enterprise-usage)
6. [🔍 Troubleshooting](#-troubleshooting)
7. [🤝 Contributing](#-contributing)
8. [📄 License](#-license)
9. [👨‍💻 Author & Support](#-author--support)

## ✨ Key Features

### 🛡️ **Enterprise-Grade Safety**

- **Administrator Validation**: Automatic privilege checking with clear error messages
- **Dry Run Mode**: Preview all actions without making changes to the system
- **Service Management**: Safe stopping and restarting of Windows services during cleanup
- **Error Handling**: Comprehensive error catching with detailed failure reporting

### 🎯 **Comprehensive Cleanup Capabilities**

- **Browser Cache Cleanup**: Chrome, Edge, Firefox, Opera, and Yandex Browser support
- **System Temp Files**: Windows temp, user temp, prefetch, and thumbnail cache cleanup
- **Windows Update**: SoftwareDistribution folder and update cache management
- **System Logs**: Event logs, IIS logs, error reports, and crash dump cleanup
- **Component Store**: Advanced DISM operations and component store optimization

### 📊 **Advanced System Optimization**

- **System File Checker**: Automated SFC scan execution
- **DISM Operations**: Component cleanup, superseded package removal, and reset base
- **Component Analysis**: Detailed component store analysis and reporting
- **Patch Cache Management**: Windows Installer patch cache cleanup
- **Delivery Optimization**: Windows 10/11 delivery optimization cache cleanup

### 🔄 **Multi-Format Support**

- **PowerShell Version**: Full-featured with parameter support and advanced error handling
- **Batch Version**: Simplified alternative that works without ExecutionPolicy changes
- **Cross-User Support**: Clean for all users or current user only
- **Deployment Ready**: Perfect for Group Policy, SCCM, or manual execution

## 📋 Installation & Usage

### System Requirements

- **Operating System**: Windows 10 version 1809+ or Windows 11
- **Privileges**: Administrator rights required
- **PowerShell**: Version 5.1+ (for PowerShell script)
- **Execution Policy**: RemoteSigned or Unrestricted (for PowerShell script)
- **Free Space**: Minimum 100MB for temporary operations and logging

### Installation Options

#### Option 1: Git Clone

```bash
# Clone repository
git clone https://github.com/paulmann/Windows-Cleaner-and-Optimizer.git
cd Windows-Cleaner-and-Optimizer

# Choose your preferred version:
# PowerShell: .\Cleanup-Windows-Senior.ps1
# Batch: .\Cleanup-Windows-Senior.bat
```

#### Option 2: Direct Download

```powershell
# PowerShell version
$url = 'https://github.com/paulmann/Windows-Cleaner-and-Optimizer/raw/main/Cleanup-Windows-Senior.ps1'
Invoke-WebRequest -Uri $url -OutFile 'Cleanup-Windows-Senior.ps1'

# Batch version
$url = 'https://github.com/paulmann/Windows-Cleaner-and-Optimizer/raw/main/Cleanup-Windows-Senior.bat'
Invoke-WebRequest -Uri $url -OutFile 'Cleanup-Windows-Senior.bat'
```

#### Option 3: Package Manager

```powershell
# Using PowerShell Gallery (future)
# Install-Script -Name WindowsCleanerOptimizer

# Using Chocolatey (future)
# choco install windows-cleaner-optimizer
```

### PowerShell Setup

#### Administrator Privileges

**This script MUST be run as Administrator**. Right-click PowerShell and select **Run as Administrator**, or use:

```powershell
# Start PowerShell as Administrator
powershell.exe -Command "Start-Process PowerShell -Verb RunAs"
```

#### Execution Policy

If you encounter "execution of scripts is disabled on this system":

```powershell
# One-time bypass (recommended)
powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows-Senior.ps1"

# Set for current user
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# Temporary session policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
```

### Batch File Setup

#### Administrator Privileges

**The batch file MUST also run as Administrator**:

```cmd
# Right-click on batch file → "Run as administrator"

# Or from Administrator Command Prompt:
cd /d "C:\path\to\script"
Cleanup-Windows-Senior.bat
```

#### Advantages of Batch Version

- ✅ **No ExecutionPolicy issues** - works out of the box
- ✅ **Simpler deployment** - single .bat file
- ✅ **Universal compatibility** - works on any Windows system
- ✅ **Group Policy friendly** - easier to deploy via GPO
- ❌ **Limited parameter support** - fewer customization options
- ❌ **Basic error handling** - simpler error reporting

### Usage Examples

#### PowerShell Usage

```powershell
# Basic usage with default settings
.\Cleanup-Windows-Senior.ps1

# Dry run mode to preview changes
.\Cleanup-Windows-Senior.ps1 -DryRun

# Clean for all users with verbose logging
.\Cleanup-Windows-Senior.ps1 -CleanForAllUsers

# Clean only browser caches
.\Cleanup-Windows-Senior.ps1 -NoCleanTempFiles -NoCleanRecycleBin -CleanChrome -CleanEdge

# Advanced cleanup with component store optimization
.\Cleanup-Windows-Senior.ps1 -RunDISMAdvanced -AnalyzeComponentStore -CleanPatchCache

# Custom log path and retry settings
.\Cleanup-Windows-Senior.ps1 -LogPath "C:\Logs\cleanup.log" -DaysOld 14

# One-time execution with bypass
powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows-Senior.ps1" -DryRun
```

#### Batch Usage

```cmd
REM Basic usage
Cleanup-Windows-Senior.bat

REM The batch version automatically handles:
REM - All cleanup operations with default settings
REM - Interactive progress display
REM - Basic error reporting
REM - Administrator privilege checking
```

#### Parameters Comparison

| Feature | PowerShell Version | Batch Version |
|---------|-------------------|---------------|
| **Dry Run Mode** | `-DryRun` | Not available |
| **User Scope** | `-CleanForAllUsers` / `-NoCleanForAllUsers` | Fixed (all users) |
| **Browser Control** | Individual browser toggles | All browsers |
| **Logging** | Full transcript logging | Console output only |
| **Advanced Features** | All DISM operations | Basic cleanup only |
| **Error Handling** | Detailed with recommendations | Basic with codes |
| **ExecutionPolicy** | Required setup | Not applicable |

## 🏗️ Advanced Features

### Browser Cache Management

The script safely cleans browser caches for major browsers:

```powershell
# Browser-specific cleanup paths
Chrome: %USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache
Edge: %USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Cache
Firefox: %USERPROFILE%\AppData\Local\Mozilla\Firefox\Profiles\*\cache2
Opera: %USERPROFILE%\AppData\Roaming\Opera Software\Opera Stable\Cache
Yandex: %USERPROFILE%\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cache
```

### System File and Component Optimization

Advanced system optimization features:

```powershell
# System File Checker execution
sfc /scannow

# DISM component cleanup operations
dism /online /cleanup-image /startcomponentcleanup
dism /online /cleanup-image /startcomponentcleanup /resetbase
dism /online /cleanup-image /spsuperseded

# Component store analysis
dism /online /cleanup-image /analyzecomponentstore
```

### Service Management

Safe service handling during cleanup:

```powershell
# Windows Update service management
Stop-Service -Name wuauserv -Force
# ... perform cleanup ...
Start-Service -Name wuauserv
```

### Logging System

**PowerShell Logging:**

```powershell
# Comprehensive logging location
$logPath = "$env:TEMP\WindowsCleanup.log"

# Log levels: Info, Warning, Error, Success, DryRun
Write-LogMessage "Starting Windows cleanup process" -Level Info
Write-LogMessage "Administrator privileges confirmed" -Level Success
Write-LogMessage "[DRY RUN] Would clean browser caches" -Level DryRun
Write-LogMessage "Installation failed with exit code 2359302" -Level Error
```

**Batch Logging:**

```cmd
REM Basic console output with timestamps
echo [2025-10-15 23:57:30] [INFO] Starting cleanup process
echo [2025-10-15 23:57:31] [SUCCESS] Administrator privileges confirmed
echo [2025-10-15 23:57:45] [WARNING] Some files could not be deleted
echo [2025-10-15 23:58:15] [SUCCESS] Cleanup completed successfully
```

## 🔗 DevOps Integration

### CI/CD Pipeline Integration

#### GitHub Actions

```yaml
name: Deploy Windows Cleanup
on:
  schedule:
    - cron: '0 2 * * 1'  # Weekly on Monday 2 AM
  workflow_dispatch:

jobs:
  deploy-cleanup:
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v3
      
      - name: Deploy PowerShell Version
        run: |
          powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows-Senior.ps1" -DryRun
        shell: cmd
        
      - name: Deploy Batch Version (Alternative)
        run: |
          .\Cleanup-Windows-Senior.bat
        shell: cmd
```

#### Azure DevOps

```yaml
trigger:
  branches:
    include:
      - main

pool:
  name: 'Windows-Agents'

steps:
- powershell: |
    .\Cleanup-Windows-Senior.ps1 -CleanForAllUsers
  displayName: 'Run Windows Cleanup'
  
- script: |
    if errorlevel 0 (
      echo Cleanup completed successfully
    )
  displayName: 'Verify Cleanup Status'
```

### Group Policy Deployment

Create a Group Policy Object (GPO) for mass deployment:

```powershell
# PowerShell script deployment via GPO
# Computer Configuration → Policies → Windows Settings → Scripts (Startup/Shutdown)
# Add: powershell.exe -ExecutionPolicy Bypass -File "\\domain\sysvol\scripts\Cleanup-Windows-Senior.ps1"

# Batch file deployment via GPO (simpler)
# Computer Configuration → Policies → Windows Settings → Scripts (Startup/Shutdown) 
# Add: \\domain\sysvol\scripts\Cleanup-Windows-Senior.bat
```

### SCCM Integration

**Application Deployment:**

```cmd
REM Detection Method
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild | find "26200"

REM Installation Command (PowerShell)
powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File ".\Cleanup-Windows-Senior.ps1"

REM Installation Command (Batch - Recommended for SCCM)
Cleanup-Windows-Senior.bat

REM Return Codes
REM 0 = Success
REM 1 = Failure
```

## 🏢 Enterprise Usage

### Mass Deployment

#### PowerShell DSC Configuration

```powershell
Configuration WindowsCleanup {
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    
    Node "localhost" {
        Script RunCleanup {
            SetScript = {
                & "C:\Scripts\Cleanup-Windows-Senior.ps1" -CleanForAllUsers
            }
            TestScript = {
                # Check if cleanup is needed (always run for maintenance)
                return $false
            }
            GetScript = {
                return @{ Result = "Windows Cleanup Status" }
            }
        }
    }
}
```

#### Intune Deployment (Win32 App)

```powershell
# Package the batch file for Intune deployment
# Create intunewin file with Microsoft Win32 Content Prep Tool

# Install command
cmd /c "Cleanup-Windows-Senior.bat"

# Detection rule
if (Test-Path "C:\ProgramData\WindowsCleanup\last-run.txt") {
    $lastRun = Get-Content "C:\ProgramData\WindowsCleanup\last-run.txt"
    $lastRunDate = [DateTime]::Parse($lastRun)
    if ((Get-Date) - $lastRunDate -lt [TimeSpan]::FromDays(7)) {
        Write-Output "Recently run"
        exit 0
    }
}
exit 1

# Return codes
# 0 = Success
# Other = Failure
```

### Automated Workflows

#### Task Scheduler Integration

```xml
<?xml version="1.0" encoding="UTF-16"?>
<Task version="1.2">
  <Triggers>
    <CalendarTrigger>
      <StartBoundary>2025-10-15T02:00:00</StartBoundary>
      <ScheduleByWeek>
        <WeeksInterval>1</WeeksInterval>
        <DaysOfWeek>
          <Monday />
        </DaysOfWeek>
      </ScheduleByWeek>
    </CalendarTrigger>
  </Triggers>
  <Actions>
    <Exec>
      <Command>C:\Scripts\Cleanup-Windows-Senior.bat</Command>
    </Exec>
  </Actions>
  <Principals>
    <Principal>
      <UserId>S-1-5-18</UserId>
      <RunLevel>HighestAvailable</RunLevel>
    </Principal>
  </Principals>
</Task>
```

### Monitoring and Reporting

#### Event Log Integration

```powershell
# PowerShell version writes to Application log
Write-EventLog -LogName Application -Source "WindowsCleanup" -EventId 1000 -Message "Cleanup started"

# Check cleanup status across domain
Get-ADComputer -Filter * | ForEach-Object {
    $lastCleanup = Invoke-Command -ComputerName $_.Name -ScriptBlock {
        Get-EventLog -LogName Application -Source "WindowsCleanup" -Newest 1 -ErrorAction SilentlyContinue
    } -ErrorAction SilentlyContinue
    
    [PSCustomObject]@{
        ComputerName = $_.Name
        LastCleanup = $lastCleanup.TimeGenerated
        Status = if ($lastCleanup) { "Recent" } else { "Needs Cleanup" }
    }
} | Export-Csv "WindowsCleanup_Status.csv"
```

## 🔍 Troubleshooting

### Common Issues

#### Permission Errors

```cmd
REM Problem: "Access denied" or "Administrator privileges required"
REM Solution: Always run as Administrator

REM Check current privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Administrator privileges required
    echo Right-click and select "Run as administrator"
    pause
    exit /b 1
)
```

#### ExecutionPolicy Issues (PowerShell Only)

```powershell
# Problem: "cannot be loaded because running scripts is disabled"
# Solution: Use one-time bypass or adjust policy

# Quick fix - one-time bypass
powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows-Senior.ps1"

# Permanent fix for current user
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# Check current policy
Get-ExecutionPolicy -List
```

#### Service Access Issues

```powershell
# Problem: Cannot stop Windows Update service
# Solution: Check service dependencies and wait for operations to complete

# Check service status
Get-Service -Name wuauserv | Select-Object Name, Status, StartType

# Check for running Windows Update operations
Get-Process | Where-Object { $_.ProcessName -like "*update*" -or $_.ProcessName -like "*dism*" }

# Solution: Wait for operations to complete or restart system
```

#### Disk Space Issues

```powershell
# Problem: Not enough space for cleanup operations
# Check available space before cleanup
$drives = Get-WmiObject -Class Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }
foreach ($drive in $drives) {
    $freeSpaceGB = [math]::Round($drive.FreeSpace / 1GB, 2)
    Write-Host "Drive $($drive.DeviceID) has $freeSpaceGB GB free space"
}

# Solution: Ensure at least 1GB free space on system drive
```

### Error Codes

| Exit Code | PowerShell | Batch | Description | Solution |
|-----------|------------|-------|-------------|----------|
| **0** | ✅ Success | ✅ Success | Cleanup completed | No action needed |
| **1** | ❌ General failure | ❌ General failure | Various errors | Check logs |
| **2** | ❌ Access denied | ❌ Access denied | Insufficient privileges | Run as Administrator |
| **3** | ❌ Service error | ❌ Service error | Cannot manage services | Check Windows services |
| **4** | ❌ Disk space error | ❌ Disk space error | Insufficient disk space | Free up space |

### Diagnostic Commands

```powershell
# System Information
systeminfo | find "OS Version"  # Command line version info
Get-ComputerInfo | Select WindowsVersion, WindowsEditionId

# Disk Space Check
Get-WmiObject -Class Win32_LogicalDisk | Select DeviceID, @{Name="Size(GB)";Expression={[math]::Round($_.Size/1GB,2)}}, @{Name="FreeSpace(GB)";Expression={[math]::Round($_.FreeSpace/1GB,2)}}

# Service Status
Get-Service -Name wuauserv, BITS, CryptSvc | Select Name, Status, StartType

# Check Admin Privileges
([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

# Check Execution Policy
Get-ExecutionPolicy -List
```

## 🤝 Contributing

We welcome contributions! Here's how to get involved:

### Development Setup

```bash
# Fork and clone the repository
git clone https://github.com/yourusername/Windows-Cleaner-and-Optimizer.git
cd Windows-Cleaner-and-Optimizer

# Test both versions
# PowerShell testing
powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows-Senior.ps1" -DryRun

# Batch testing in test environment
.\Cleanup-Windows-Senior.bat
```

### Contribution Guidelines

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/awesome-feature`)
3. **Test** thoroughly on multiple Windows systems
4. **Update documentation** if needed
5. **Commit** changes (`git commit -m 'Add awesome feature'`)
6. **Push** to branch (`git push origin feature/awesome-feature`)
7. **Open** a Pull Request

### Code Standards

- ✅ **PowerShell**: Follow PowerShell best practices and PSScriptAnalyzer rules
- ✅ **Batch**: Use modern CMD syntax, proper error handling
- ✅ **Documentation**: Update README.md for new features
- ✅ **Testing**: Test on multiple Windows versions if possible
- ✅ **Compatibility**: Maintain Windows 10 1809+ compatibility

### Areas for Contribution

- **GUI Version**: Windows Forms or WPF interface
- **Additional Browsers**: Support for more browsers (Brave, Vivaldi)
- **Localization**: Multi-language support for error messages
- **Reporting**: HTML/JSON output formats
- **Integration**: Additional deployment methods (Chocolatey, winget)

## 📄 License

This project is licensed under the **MIT License** - see the LICENSE file for details.

```
MIT License

Copyright (c) 2025 Mikhail Deynekin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```

## 👨‍💻 Author & Support

**Mikhail Deynekin**

- 🌐 Website: [deynekin.com](https://deynekin.com)
- 📧 Email: mid1977@gmail.com
- 🐙 GitHub: [@paulmann](https://github.com/paulmann)

### Getting Help

- 📖 **Documentation**: Read this README thoroughly
- 🐛 **Bug Reports**: [Open an issue](https://github.com/paulmann/Windows-Cleaner-and-Optimizer/issues)
- 💡 **Feature Requests**: [Request features](https://github.com/paulmann/Windows-Cleaner-and-Optimizer/issues)
- 💬 **Questions**: Check [Discussions](https://github.com/paulmann/Windows-Cleaner-and-Optimizer/discussions)

### Related Projects

- [Windows-11-25H2-Update-Script](https://github.com/paulmann/Windows-11-25H2-Update-Script) - Windows 11 update automation
- Microsoft-Activation-Scripts - Windows activation tools
- Windows11Debloat - Remove Windows 11 bloatware
- PowerShell-Suite - PowerShell utilities collection

---

### ⭐ Star this repository if it helped you!

**Windows System Cleaner and Optimizer** - Making Windows cleanup fast, reliable, and enterprise-ready 🧹✨

[Report Bug](https://github.com/paulmann/Windows-Cleaner-and-Optimizer/issues) · [Request Feature](https://github.com/paulmann/Windows-Cleaner-and-Optimizer/issues) · [Documentation](https://github.com/paulmann/Windows-Cleaner-and-Optimizer/blob/main/README.md)
