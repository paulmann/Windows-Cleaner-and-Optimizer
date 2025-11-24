# Windows System Cleaner and Optimizer 🧹✨

[![Version](https://img.shields.io/badge/version-5.2.0-blue.svg)](https://github.com/paulmann/Windows-Cleaner-and-Optimizer)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![PowerShell](https://img.shields.io/badge/powershell-5.1%2B-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![PowerShell 7+](https://img.shields.io/badge/powershell-7%2B-purple.svg)](https://docs.microsoft.com/en-us/powershell/)
[![Batch](https://img.shields.io/badge/batch-cmd-orange.svg)](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/cmd)
[![Platform](https://img.shields.io/badge/platform-Windows%2010|11|12-blue.svg)](https://www.microsoft.com/windows/)
[![Safety](https://img.shields.io/badge/safety-enhanced-brightgreen.svg)](https://github.com/paulmann/Windows-Cleaner-and-Optimizer)
[![Backup](https://img.shields.io/badge/backup-integrated-yellow.svg)](https://github.com/paulmann/Windows-Cleaner-and-Optimizer)

> **Enterprise-grade Windows cleanup automation tool with enhanced safety features, system backup integration, and PowerShell 7+ optimization. Safely clears browser caches, temp files, system logs, and optimizes component store for maximum performance and disk space recovery.**

Windows System Cleaner and Optimizer v5.2 is a comprehensive, professional-grade automation solution designed for system administrators, IT professionals, and power users who require reliable disk cleanup with enhanced safety measures. The latest version introduces advanced backup options, PowerShell 7+ optimizations, and enterprise-grade safety confirmations for dangerous operations.

## 🚀 What's New in Version 5.2

### ✨ **Enhanced Safety Features**
- **Safety Mode**: Configurable safety confirmations for dangerous operations
- **System Restore Point Integration**: Automated restore point creation before cleanup
- **System Image Backup**: Launch Windows Backup for full system image creation
- **Dangerous Operation Warnings**: Risk-level based confirmations for high-impact operations

### ⚡ **PowerShell 7+ Optimizations**
- **Parallel Processing**: Enhanced performance through concurrent operations
- **Modern CIM Commands**: Replaced legacy WMI with modern CIM infrastructure
- **Enhanced Telemetry**: Detailed performance metrics and operation tracking
- **Improved Error Handling**: Advanced exception management with graceful degradation

### 🛡️ **Enterprise Safety Enhancements**
- **Force Mode**: Bypass safety confirmations for automated deployments
- **Risk Assessment**: Operation-specific risk levels (Low/Medium/High)
- **Safety Configuration**: Granular control over safety features
- **Backup Integration**: Pre-cleanup system protection mechanisms

### 🔧 **Technical Improvements**
- **Backward Compatibility**: Full support for PowerShell 5.1+ with PS7+ enhancements
- **Parameter Validation**: Enhanced parameter processing with GNU-style support
- **Performance Metrics**: Operation tracking and performance analysis
- **Enhanced Logging**: Structured logging with safety operation tracking

## ⚡ Quick Start

### 1. PowerShell Version (Recommended)

```powershell
# Clone and install
git clone https://github.com/paulmann/Windows-Cleaner-and-Optimizer.git
cd Windows-Cleaner-and-Optimizer

# Basic cleanup with safety features
.\Cleanup-Windows.ps1

# Enhanced safety with system restore point
.\Cleanup-Windows.ps1 -EnableSafetyMode -CreateRestorePoint

# Force mode for automated deployments
.\Cleanup-Windows.ps1 -Force

# Dry run with safety confirmations
.\Cleanup-Windows.ps1 -DryRun -EnableSafetyMode

# One-time bypass execution policy
powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows.ps1" -EnableSafetyMode
```

### 2. Batch Version (Alternative - Legacy Support)

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

1. [🚀 What's New in Version 5.2](#-whats-new-in-version-52)
2. [⚡ Quick Start](#-quick-start)
3. [✨ Key Features](#-key-features)
4. [🛡️ Safety and Backup Features](#️-safety-and-backup-features)
5. [⚡ PowerShell 7+ Enhancements](#-powershell-7-enhancements)
6. [📋 Installation & Usage](#-installation--usage)
   - [System Requirements](#system-requirements)
   - [Installation Options](#installation-options)
   - [PowerShell Setup](#powershell-setup)
   - [Safety Configuration](#safety-configuration)
   - [Usage Examples](#usage-examples)
7. [🏗️ Advanced Features](#️-advanced-features)
8. [🔗 DevOps Integration](#-devops-integration)
9. [🏢 Enterprise Usage](#-enterprise-usage)
10. [🔍 Troubleshooting](#-troubleshooting)
11. [🤝 Contributing](#-contributing)
12. [📄 License](#-license)
13. [👨‍💻 Author & Support](#-author--support)

## ✨ Key Features

### 🛡️ **Enterprise-Grade Safety (Enhanced)**

- **Safety Mode**: Configurable safety confirmations with risk assessment
- **System Restore Points**: Automated restore point creation via System Properties
- **System Image Backup**: Integration with Windows Backup and Restore
- **Dangerous Operation Control**: Granular confirmation for high-risk operations
- **Force Mode**: Bypass safety for automated deployment scenarios
- **Administrator Validation**: Enhanced privilege checking with clear escalation paths

### ⚡ **PowerShell 7+ Optimization**

- **Parallel Processing**: Concurrent operation execution for improved performance
- **Modern CIM Infrastructure**: Replacement of legacy WMI with modern CIM commands
- **Enhanced Telemetry**: Detailed operation tracking and performance metrics
- **Advanced Error Handling**: Structured exception management with graceful degradation
- **Platform Detection**: Automatic feature enablement based on PowerShell version

### 🎯 **Comprehensive Cleanup Capabilities**

- **Browser Cache Cleanup**: Chrome, Edge, Firefox, Opera, and Yandex Browser support
- **System Temp Files**: Windows temp, user temp, prefetch, and thumbnail cache cleanup
- **Windows Update Management**: SoftwareDistribution folder and update cache with service control
- **System Logs**: Event logs, IIS logs, error reports, and crash dump cleanup
- **Component Store**: Advanced DISM operations and component store optimization

### 📊 **Advanced System Optimization**

- **System File Checker**: Automated SFC scan execution with result analysis
- **DISM Operations**: Component cleanup, superseded package removal, and reset base
- **Component Analysis**: Detailed component store analysis and reporting
- **Patch Cache Management**: Windows Installer patch cache cleanup
- **Delivery Optimization**: Windows 10/11 delivery optimization cache cleanup

### 🔄 **Multi-Format Support**

- **PowerShell Version**: Full-featured with safety parameters and advanced error handling
- **Batch Version**: Simplified alternative for legacy environments
- **Cross-User Support**: Clean for all users or current user only with safety considerations
- **Deployment Ready**: Perfect for Group Policy, SCCM, Intune, or manual execution

## 🛡️ Safety and Backup Features

### Safety Mode Configuration

Version 5.2 introduces comprehensive safety features to prevent accidental data loss or system instability:

```powershell
# Enable safety mode (recommended for interactive use)
.\Cleanup-Windows.ps1 -EnableSafetyMode

# Disable safety mode (use with caution)
.\Cleanup-Windows.ps1 -NoSafetyMode

# Force mode bypasses all safety confirmations
.\Cleanup-Windows.ps1 -Force
```

### System Restore Point Integration

```powershell
# Create restore point before cleanup
.\Cleanup-Windows.ps1 -CreateRestorePoint

# Skip restore point creation
.\Cleanup-Windows.ps1 -NoCreateRestorePoint

# Combined safety approach
.\Cleanup-Windows.ps1 -EnableSafetyMode -CreateRestorePoint
```

### System Image Backup

```powershell
# Launch system image backup after cleanup
.\Cleanup-Windows.ps1 -CreateSystemImage

# Full safety configuration
.\Cleanup-Windows.ps1 -EnableSafetyMode -CreateRestorePoint -CreateSystemImage
```

### Dangerous Operations with Risk Assessment

The script categorizes operations by risk level and requires confirmation for high-risk tasks:

| Risk Level | Operations | Confirmation Required |
|------------|------------|---------------------|
| **High** | Windows Update Full Cleanup, DISM Advanced Operations, Patch Cache Cleanup | Always in Safety Mode |
| **Medium** | Recycle Bin Cleanup, Event Logs Clearing | Always in Safety Mode |
| **Low** | Temp Files, Browser Caches, Prefetch Cleanup | Never |

## ⚡ PowerShell 7+ Enhancements

### Automatic Feature Detection

The script automatically detects PowerShell version and enables enhanced features:

```powershell
# PowerShell 7+ features automatically enabled:
# - Parallel processing
# - Modern CIM commands
# - Enhanced telemetry
# - Improved color support
.\Cleanup-Windows.ps1

# Manual control of PS7+ features
.\Cleanup-Windows.ps1 -UseParallelProcessing -EnableTelemetry
```

### Performance Optimizations

```powershell
# Parallel processing for faster execution (PS7+ only)
.\Cleanup-Windows.ps1 -UseParallelProcessing

# Enhanced telemetry and performance metrics
.\Cleanup-Windows.ps1 -EnableTelemetry

# Disable specific PS7+ features if needed
.\Cleanup-Windows.ps1 -NoUseParallelProcessing -NoEnableTelemetry
```

### Backward Compatibility

Full compatibility with PowerShell 5.1+ with graceful feature degradation:

```powershell
# Works identically on PS5.1 and PS7+
# Enhanced features automatically disabled on older versions
.\Cleanup-Windows.ps1 -EnableSafetyMode -CreateRestorePoint
```

## 📋 Installation & Usage

### System Requirements

- **Operating System**: Windows 10 version 1809+ or Windows 11
- **Privileges**: Administrator rights required
- **PowerShell**: Version 5.1+ (for PowerShell script)
- **PowerShell 7+**: Recommended for enhanced features
- **Execution Policy**: RemoteSigned or Unrestricted (for PowerShell script)
- **Free Space**: Minimum 100MB for temporary operations and logging
- **System Protection**: System Restore enabled for restore point creation

### Installation Options

#### Option 1: Git Clone (Recommended)

```bash
# Clone repository
git clone https://github.com/paulmann/Windows-Cleaner-and-Optimizer.git
cd Windows-Cleaner-and-Optimizer

# Choose your preferred version:
# PowerShell (Enhanced): .\Cleanup-Windows.ps1
# Batch (Legacy): .\Cleanup-Windows-Senior.bat
```

#### Option 2: Direct Download

```powershell
# PowerShell version (v5.2 with safety features)
$url = 'https://github.com/paulmann/Windows-Cleaner-and-Optimizer/raw/main/Cleanup-Windows.ps1'
Invoke-WebRequest -Uri $url -OutFile 'Cleanup-Windows.ps1'

# Batch version (legacy)
$url = 'https://github.com/paulmann/Windows-Cleaner-and-Optimizer/raw/main/Cleanup-Windows-Senior.bat'
Invoke-WebRequest -Uri $url -OutFile 'Cleanup-Windows-Senior.bat'
```

#### Option 3: Package Manager (Future)

```powershell
# Using PowerShell Gallery (planned)
# Install-Script -Name WindowsCleanerOptimizer

# Using Chocolatey (planned)
# choco install windows-cleaner-optimizer
```

### PowerShell Setup

#### Administrator Privileges

**This script MUST be run as Administrator**. Right-click PowerShell and select **Run as Administrator**, or use:

```powershell
# Start PowerShell as Administrator
powershell.exe -Command "Start-Process PowerShell -Verb RunAs"

# Verify administrator privileges
([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
```

#### Execution Policy

If you encounter "execution of scripts is disabled on this system":

```powershell
# One-time bypass (recommended for testing)
powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows.ps1" -EnableSafetyMode

# Set for current user (permanent solution)
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# Temporary session policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

# Check current policy
Get-ExecutionPolicy -List
```

### Safety Configuration

#### Interactive Safety Mode

```powershell
# Recommended for interactive use - confirms dangerous operations
.\Cleanup-Windows.ps1 -EnableSafetyMode

# With restore point creation for added safety
.\Cleanup-Windows.ps1 -EnableSafetyMode -CreateRestorePoint
```

#### Automated Deployment

```powershell
# Force mode for scripts and automated deployment
.\Cleanup-Windows.ps1 -Force

# Force mode with specific operations only
.\Cleanup-Windows.ps1 -Force -CleanTempFiles -CleanBrowserCaches

# Safety disabled for known environments
.\Cleanup-Windows.ps1 -NoSafetyMode
```

#### Backup Integration

```powershell
# Full safety with both restore point and system image
.\Cleanup-Windows.ps1 -EnableSafetyMode -CreateRestorePoint -CreateSystemImage

# Restore point only (most common)
.\Cleanup-Windows.ps1 -CreateRestorePoint

# System image only (takes longer)
.\Cleanup-Windows.ps1 -CreateSystemImage
```

### Usage Examples

#### Basic Safety-First Usage

```powershell
# Recommended for most users - maximum safety
.\Cleanup-Windows.ps1 -EnableSafetyMode -CreateRestorePoint

# Dry run to preview changes with safety
.\Cleanup-Windows.ps1 -DryRun -EnableSafetyMode

# Clean for all users with safety confirmations
.\Cleanup-Windows.ps1 -EnableSafetyMode -CleanForAllUsers
```

#### Advanced Safety Configuration

```powershell
# Custom safety configuration
.\Cleanup-Windows.ps1 -EnableSafetyMode -CreateRestorePoint -NoCreateSystemImage

# Specific operation control with safety
.\Cleanup-Windows.ps1 -EnableSafetyMode -CleanTempFiles -CleanBrowserCaches -NoCleanEventLogs

# PowerShell 7+ optimized with safety
.\Cleanup-Windows.ps1 -EnableSafetyMode -UseParallelProcessing -EnableTelemetry
```

#### Enterprise Deployment

```powershell
# Force mode for automated scripts (use with caution)
.\Cleanup-Windows.ps1 -Force

# Limited operations in force mode
.\Cleanup-Windows.ps1 -Force -CleanTempFiles -CleanBrowserCaches -NoCleanRecycleBin

# Custom log path with safety
.\Cleanup-Windows.ps1 -EnableSafetyMode -LogPath "C:\Logs\cleanup.log" -DaysOld 14
```

#### PowerShell 7+ Optimized

```powershell
# Leverage all PS7+ enhancements
.\Cleanup-Windows.ps1 -EnableSafetyMode -UseParallelProcessing -EnableTelemetry

# Performance-focused with safety
.\Cleanup-Windows.ps1 -UseParallelProcessing -CreateRestorePoint

# Enhanced logging and telemetry
.\Cleanup-Windows.ps1 -EnableTelemetry -LogPath "C:\Logs\detailed-cleanup.log"
```

#### Batch Version (Legacy)

```cmd
REM Basic usage (limited safety features)
Cleanup-Windows-Senior.bat

REM The batch version provides basic cleanup:
REM - All cleanup operations with default settings
REM - Interactive progress display
REM - Basic error reporting
REM - Administrator privilege checking
REM - Limited safety features compared to PowerShell version
```

## 🏗️ Advanced Features

### Enhanced Browser Cache Management

The script safely cleans browser caches for major browsers with user-specific handling:

```powershell
# Browser-specific cleanup paths with safety
Chrome: %USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache
Edge: %USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Cache
Firefox: %USERPROFILE%\AppData\Local\Mozilla\Firefox\Profiles\*\cache2
Opera: %USERPROFILE%\AppData\Roaming\Opera Software\Opera Stable\Cache
Yandex: %USERPROFILE%\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cache

# Browser process management with safety stops
Stop-ProcessSafely -ProcessNames @("chrome", "msedge", "firefox", "opera", "yandex")
```

### Advanced System File and Component Optimization

Enhanced system optimization features with safety checks:

```powershell
# System File Checker execution with error handling
sfc /scannow

# DISM component cleanup operations with safety confirmations
dism /online /cleanup-image /startcomponentcleanup
dism /online /cleanup-image /startcomponentcleanup /resetbase
dism /online /cleanup-image /spsuperseded

# Component store analysis with reporting
dism /online /cleanup-image /analyzecomponentstore

# Enhanced component cleanup via Task Scheduler
schtasks.exe /Run /TN \Microsoft\Windows\Servicing\StartComponentCleanup
```

### Service Management with Safety

Enhanced service handling during cleanup operations:

```powershell
# Windows Update service management with error recovery
$wuService = Get-Service -Name wuauserv -ErrorAction SilentlyContinue
$wuServiceRunning = $false
if ($wuService -and $wuService.Status -eq 'Running') {
    $wuServiceRunning = $true
    Stop-Service -Name wuauserv -Force -ErrorAction SilentlyContinue
    # ... perform cleanup operations ...
    if ($wuServiceRunning) {
        Start-Service -Name wuauserv -ErrorAction SilentlyContinue
    }
}
```

### Enhanced Logging System

**PowerShell v5.2 Enhanced Logging:**

```powershell
# Comprehensive logging with safety operations tracking
$logPath = "$env:TEMP\WindowsCleanup.log"

# Enhanced log levels with safety-specific logging
Write-LogMessage "Starting Windows cleanup process" -Level Info
Write-LogMessage "Safety Mode: Enabled" -Level Safety
Write-LogMessage "Administrator privileges confirmed" -Level Success
Write-LogMessage "[DRY RUN] Would clean browser caches" -Level DryRun
Write-LogMessage "Dangerous operation requires confirmation" -Level Safety
Write-LogMessage "Installation failed with exit code 2359302" -Level Error

# Safety-specific logging functions
Write-SafetyInfo "System Restore Point creation initiated"
Write-SafetyInfo "Dangerous operation confirmed by user"
```

**Enhanced Telemetry (PS7+):**

```powershell
# Performance metrics and operation tracking
$Global:CleanupStatistics = @{
    OperationsCompleted = 0
    OperationsFailed = 0
    OperationsSkipped = 0
}

Update-Telemetry -Message "Operation completed" -Level "Success"
Update-Telemetry -Message "Operation failed" -Level "Error"
```

## 🔗 DevOps Integration

### CI/CD Pipeline Integration with Safety

#### GitHub Actions with Enhanced Safety

```yaml
name: Deploy Windows Cleanup v5.2
on:
  schedule:
    - cron: '0 2 * * 1'  # Weekly on Monday 2 AM
  workflow_dispatch:

jobs:
  deploy-cleanup:
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v3
      
      - name: Deploy PowerShell Version with Safety
        run: |
          powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows.ps1" -Force -LogPath "C:\Logs\cleanup-${{ github.run_id }}.log"
        shell: cmd
        
      - name: Safety-Conscious Deployment
        run: |
          powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows.ps1" -EnableSafetyMode -CreateRestorePoint -UseParallelProcessing
        shell: cmd
```

#### Azure DevOps with Enhanced Features

```yaml
trigger:
  branches:
    include:
      - main

pool:
  name: 'Windows-Agents'

steps:
- powershell: |
    .\Cleanup-Windows.ps1 -EnableSafetyMode -CreateRestorePoint -UseParallelProcessing
  displayName: 'Run Windows Cleanup with Safety'
  continueOnError: true
  
- powershell: |
    .\Cleanup-Windows.ps1 -Force -CleanTempFiles -CleanBrowserCaches
  displayName: 'Fast Cleanup (Force Mode)'
  condition: always()
```

### Group Policy Deployment with Safety

Create a Group Policy Object (GPO) for mass deployment with safety considerations:

```powershell
# PowerShell script deployment via GPO with safety
# Computer Configuration → Policies → Windows Settings → Scripts (Startup/Shutdown)
# Add: powershell.exe -ExecutionPolicy Bypass -File "\\domain\sysvol\scripts\Cleanup-Windows.ps1" -Force

# Safety-conscious deployment for user workstations
# Add: powershell.exe -ExecutionPolicy Bypass -File "\\domain\sysvol\scripts\Cleanup-Windows.ps1" -EnableSafetyMode -CreateRestorePoint

# Batch file deployment via GPO (simpler, fewer safety features)
# Computer Configuration → Policies → Windows Settings → Scripts (Startup/Shutdown) 
# Add: \\domain\sysvol\scripts\Cleanup-Windows-Senior.bat
```

### SCCM Integration with Safety Options

**Application Deployment with Safety Configuration:**

```cmd
REM Detection Method
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild | find "26200"

REM Installation Command (PowerShell with Safety)
powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File ".\Cleanup-Windows.ps1" -Force

REM Installation Command (PowerShell with Enhanced Safety)
powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File ".\Cleanup-Windows.ps1" -EnableSafetyMode -CreateRestorePoint

REM Installation Command (Batch - Limited Safety Features)
Cleanup-Windows-Senior.bat

REM Return Codes
REM 0 = Success
REM 1 = General Failure
REM 2 = Access Denied
REM 3 = Service Error
REM 4 = Disk Space Error
REM 5 = Safety Confirmation Denied
```

## 🏢 Enterprise Usage

### Mass Deployment with Safety Policies

#### PowerShell DSC Configuration with Safety

```powershell
Configuration WindowsCleanupEnterprise {
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    
    Node "localhost" {
        Script RunCleanupWithSafety {
            SetScript = {
                & "C:\Scripts\Cleanup-Windows.ps1" -EnableSafetyMode -CreateRestorePoint -UseParallelProcessing
            }
            TestScript = {
                # Check if cleanup is needed (always run for maintenance)
                return $false
            }
            GetScript = {
                return @{ Result = "Windows Cleanup Status" }
            }
        }
        
        Script RunCleanupForced {
            SetScript = {
                & "C:\Scripts\Cleanup-Windows.ps1" -Force -LogPath "C:\Logs\cleanup.log"
            }
            TestScript = {
                # Check last cleanup time
                $lastCleanup = Get-Content "C:\Logs\cleanup.log" -Tail 1 -ErrorAction SilentlyContinue
                return $lastCleanup -like "*COMPLETED SUCCESSFULLY*"
            }
            GetScript = {
                return @{ Result = "Forced Cleanup Status" }
            }
        }
    }
}
```

#### Intune Deployment (Win32 App) with Safety

```powershell
# Package the script for Intune deployment with safety options
# Create intunewin file with Microsoft Win32 Content Prep Tool

# Install command with safety
cmd /c "powershell.exe -ExecutionPolicy Bypass -File `"Cleanup-Windows.ps1`" -EnableSafetyMode -CreateRestorePoint"

# Install command for automated environments
cmd /c "powershell.exe -ExecutionPolicy Bypass -File `"Cleanup-Windows.ps1`" -Force"

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

# Return codes with safety considerations
# 0 = Success
# 1 = General Failure
# 2 = Safety Confirmation Denied
# 3 = Administrator Privileges Required
# Other = Specific Operation Failure
```

### Automated Workflows with Safety

#### Task Scheduler Integration with Safety Configuration

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
    <!-- Safety-conscious execution -->
    <Exec>
      <Command>C:\Scripts\Cleanup-Windows.ps1</Command>
      <Arguments>-EnableSafetyMode -CreateRestorePoint -LogPath "C:\Logs\scheduled-cleanup.log"</Arguments>
    </Exec>
    <!-- Force mode for automated environments -->
    <Exec>
      <Command>C:\Scripts\Cleanup-Windows.ps1</Command>
      <Arguments>-Force -LogPath "C:\Logs\automated-cleanup.log"</Arguments>
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

### Monitoring and Reporting with Safety Tracking

#### Event Log Integration with Safety Events

```powershell
# PowerShell version writes safety events to Application log
Write-EventLog -LogName Application -Source "WindowsCleanup" -EventId 1000 -Message "Cleanup started with Safety Mode"
Write-EventLog -LogName Application -Source "WindowsCleanup" -EventId 1001 -Message "System Restore Point created"
Write-EventLog -LogName Application -Source "WindowsCleanup" -EventId 1002 -Message "Dangerous operation confirmed"
Write-EventLog -LogName Application -Source "WindowsCleanup" -EventId 2000 -Message "Cleanup completed successfully"
Write-EventLog -LogName Application -Source "WindowsCleanup" -EventId 3000 -Message "Safety confirmation denied - operation skipped"

# Check cleanup status across domain with safety compliance
Get-ADComputer -Filter * | ForEach-Object {
    $lastCleanup = Invoke-Command -ComputerName $_.Name -ScriptBlock {
        Get-EventLog -LogName Application -Source "WindowsCleanup" -Newest 1 -ErrorAction SilentlyContinue
    } -ErrorAction SilentlyContinue
    
    $safetyCompliant = $lastCleanup.Message -like "*Safety Mode*" -or $lastCleanup.Message -like "*Restore Point*"
    
    [PSCustomObject]@{
        ComputerName = $_.Name
        LastCleanup = $lastCleanup.TimeGenerated
        Status = if ($lastCleanup) { "Recent" } else { "Needs Cleanup" }
        SafetyCompliant = $safetyCompliant
    }
} | Export-Csv "WindowsCleanup_Compliance_Report.csv"
```

## 🔍 Troubleshooting

### Common Issues and Solutions

#### Permission and Safety Errors

```powershell
# Problem: "Access denied" or safety confirmation denied
# Solution: Ensure administrator privileges and safety compliance

# Check current privileges with safety context
if (-not (Test-AdminPrivileges)) {
    Write-ErrorInfo "Administrator privileges required for safety operations"
    exit 2
}

# Safety confirmation handling
if (-not (Confirm-DangerousOperation -OperationName "CleanRecycleBin" -Description "Permanent deletion" -RiskLevel "Medium")) {
    Write-SkippedInfo "Operation skipped due to safety confirmation denial"
    exit 5
}
```

#### ExecutionPolicy Issues (PowerShell Only)

```powershell
# Problem: "cannot be loaded because running scripts is disabled"
# Solution: Use one-time bypass or adjust policy with safety considerations

# Quick fix - one-time bypass with safety
powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows.ps1" -EnableSafetyMode

# Permanent fix for current user
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# Check current policy
Get-ExecutionPolicy -List

# Safety note: Execution policy is a security feature, bypass only from trusted sources
```

#### Service Access Issues with Safety

```powershell
# Problem: Cannot stop Windows Update service during safety operations
# Solution: Check service dependencies and wait for operations to complete

# Enhanced service status check with safety
$services = @("wuauserv", "BITS", "CryptSvc")
foreach ($service in $services) {
    $svc = Get-Service -Name $service -ErrorAction SilentlyContinue
    if ($svc) {
        Write-SafetyInfo "Service $service status: $($svc.Status), StartType: $($svc.StartType)"
    }
}

# Check for running Windows Update operations with safety timeout
$timeout = New-TimeSpan -Minutes 5
$stopTime = (Get-Date).Add($timeout)
while ((Get-Date) -lt $stopTime) {
    $updateProcesses = Get-Process | Where-Object { 
        $_.ProcessName -like "*update*" -or $_.ProcessName -like "*dism*" 
    }
    if (-not $updateProcesses) { break }
    Start-Sleep -Seconds 10
}

# Safety fallback: Skip operation if services cannot be managed safely
if ((Get-Date) -ge $stopTime) {
    Write-SkippedInfo "Service operations timeout - skipping for safety"
}
```

#### Disk Space Issues with Safety

```powershell
# Problem: Not enough space for cleanup operations or restore points
# Enhanced space check with safety thresholds

$safetyThresholdGB = 2  # Minimum free space for safety operations
$drives = Get-CimInstance -Class Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }

foreach ($drive in $drives) {
    $freeSpaceGB = [math]::Round($drive.FreeSpace / 1GB, 2)
    $driveLetter = $drive.DeviceID
    
    Write-LogMessage "Drive $driveLetter has $freeSpaceGB GB free space" -Level Info
    
    if ($freeSpaceGB -lt $safetyThresholdGB) {
        Write-SafetyInfo "Low disk space on $driveLetter - $freeSpaceGB GB free (minimum: $safetyThresholdGB GB)"
        
        if ($driveLetter -eq $env:SystemDrive -and $CleanupConfig.CreateRestorePointEnabled) {
            Write-SkippedInfo "Insufficient space for System Restore Point - skipping creation"
            $CleanupConfig.CreateRestorePointEnabled = $false
        }
    }
}

# Solution: Ensure adequate free space before safety operations
```

### Enhanced Error Codes

| Exit Code | PowerShell | Batch | Description | Safety Impact | Solution |
|-----------|------------|-------|-------------|---------------|----------|
| **0** | ✅ Success | ✅ Success | Cleanup completed successfully | Safety operations completed | No action needed |
| **1** | ❌ General failure | ❌ General failure | Various errors | Safety may be compromised | Check detailed logs |
| **2** | ❌ Access denied | ❌ Access denied | Insufficient privileges | Safety operations blocked | Run as Administrator |
| **3** | ❌ Service error | ❌ Service error | Cannot manage services | Safety stop/start failed | Check Windows services |
| **4** | ❌ Disk space error | ❌ Disk space error | Insufficient disk space | Restore points may fail | Free up space |
| **5** | ❌ Safety denied | ⚠️ Limited | Safety confirmation denied | Operation skipped by user | Review safety settings |
| **6** | ❌ Backup failed | ⚠️ Limited | System backup failed | Proceed with caution | Check backup settings |

### Diagnostic Commands with Safety Context

```powershell
# Enhanced System Information with safety context
systeminfo | find "OS Version"
Get-ComputerInfo | Select WindowsVersion, WindowsEditionId, WindowsInstallationType
Get-CimInstance -ClassName Win32_ComputerSystem | Select Model, Manufacturer, TotalPhysicalMemory

# Disk Space Check with safety thresholds
Get-CimInstance -Class Win32_LogicalDisk | Select DeviceID, 
    @{Name="Size(GB)";Expression={[math]::Round($_.Size/1GB,2)}}, 
    @{Name="FreeSpace(GB)";Expression={[math]::Round($_.FreeSpace/1GB,2)}},
    @{Name="SafetyStatus";Expression={if ([math]::Round($_.FreeSpace/1GB,2) -gt 2){"Adequate"}else{"Low"}}}

# Service Status with safety dependencies
Get-Service -Name wuauserv, BITS, CryptSvc, VSS | Select Name, Status, StartType, RequiredServices

# Safety Configuration Check
Write-Host "Safety Mode: $(if ($CleanupConfig.SafetyModeEnabled) {'ENABLED'} else {'DISABLED'})"
Write-Host "Restore Point: $(if ($CleanupConfig.CreateRestorePointEnabled) {'ENABLED'} else {'DISABLED'})"
Write-Host "System Image: $(if ($CleanupConfig.CreateSystemImageEnabled) {'ENABLED'} else {'DISABLED'})"
Write-Host "Force Mode: $(if ($Force -or $ForceShort) {'ENABLED'} else {'DISABLED'})"

# PowerShell Version and Capabilities
Write-Host "PowerShell Version: $($PSVersionTable.PSVersion)"
Write-Host "Platform: $($PSVersionTable.Platform)"
Write-Host "PowerShell 7+ Features: $(if ($Script:IsPS7Plus) {'AVAILABLE'} else {'NOT AVAILABLE'})"
Write-Host "Parallel Processing: $(if ($CleanupConfig.UseParallelProcessing) {'ENABLED'} else {'DISABLED'})"
```

## 🤝 Contributing

We welcome contributions! Here's how to get involved with the enhanced v5.2 codebase:

### Development Setup with Safety Testing

```bash
# Fork and clone the repository
git clone https://github.com/yourusername/Windows-Cleaner-and-Optimizer.git
cd Windows-Cleaner-and-Optimizer

# Test safety features thoroughly
# Safety mode testing
powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows.ps1" -EnableSafetyMode -DryRun

# Force mode testing
powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows.ps1" -Force -DryRun

# Backup feature testing
powershell.exe -ExecutionPolicy Bypass -File ".\Cleanup-Windows.ps1" -CreateRestorePoint -DryRun

# Batch version testing in legacy environments
.\Cleanup-Windows-Senior.bat
```

### Contribution Guidelines for Safety Features

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/enhanced-safety`)
3. **Test** thoroughly on multiple Windows systems with different safety scenarios
4. **Update documentation** for new safety parameters and features
5. **Commit** changes (`git commit -m 'Add enhanced safety confirmation system'`)
6. **Push** to branch (`git push origin feature/enhanced-safety`)
7. **Open** a Pull Request with safety impact assessment

### Enhanced Code Standards

- ✅ **Safety First**: All dangerous operations must include safety confirmations
- ✅ **PowerShell 7+**: Leverage modern features while maintaining backward compatibility
- ✅ **Backup Integration**: Include system protection options for destructive operations
- ✅ **Error Handling**: Comprehensive error management with safety fallbacks
- ✅ **Documentation**: Detailed safety documentation for all parameters
- ✅ **Testing**: Multi-version testing (PS5.1, PS7+, Windows 10/11)
- ✅ **Compatibility**: Maintain Windows 10 1809+ compatibility with graceful degradation

### Priority Areas for Contribution

- **GUI Safety Interface**: Windows Forms or WPF interface with safety controls
- **Additional Safety Features**: Enhanced risk assessment and mitigation
- **Backup Automation**: Automated backup verification and management
- **Localization**: Multi-language support for safety warnings and confirmations
- **Enhanced Reporting**: HTML/JSON output formats with safety compliance tracking
- **Integration**: Additional deployment methods with safety configurations (Chocolatey, winget)
- **Compliance**: Regulatory compliance features (GDPR, HIPAA, etc.)

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
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 👨‍💻 Author & Support

**Mikhail Deynekin**

- 🌐 Website: [deynekin.com](https://deynekin.com)
- 📧 Email: mid1977@gmail.com
- 🐙 GitHub: [@paulmann](https://github.com/paulmann)
- 💼 LinkedIn: [Mikhail Deynekin](https://linkedin.com/in/mikhail-deynekin)

### Enhanced Support Channels

- 📖 **Documentation**: Read this comprehensive README for safety guidelines
- 🛡️ **Safety Guidance**: Consult safety best practices in troubleshooting section
- 🐛 **Bug Reports**: [Open an issue](https://github.com/paulmann/Windows-Cleaner-and-Optimizer/issues) with safety impact assessment
- 💡 **Feature Requests**: [Request features](https://github.com/paulmann/Windows-Cleaner-and-Optimizer/issues) with safety considerations
- 💬 **Questions**: Check [Discussions](https://github.com/paulmann/Windows-Cleaner-and-Optimizer/discussions) for safety-related topics
- 🚨 **Security Issues**: Report security concerns via email with [SECURITY] prefix

### Related Projects

- [Windows-11-25H2-Update-Script](https://github.com/paulmann/Windows-11-25H2-Update-Script) - Windows 11 update automation with safety checks
- Microsoft-Activation-Scripts - Windows activation tools (community)
- Windows11Debloat - Remove Windows 11 bloatware safely
- PowerShell-Suite - PowerShell utilities collection with enterprise features

---

### ⭐ Star this repository if it helped you!

**Windows System Cleaner and Optimizer v5.2** - Making Windows cleanup fast, reliable, safe, and enterprise-ready 🧹✨🛡️

[Report Bug](https://github.com/paulmann/Windows-Cleaner-and-Optimizer/issues) · 
[Request Feature](https://github.com/paulmann/Windows-Cleaner-and-Optimizer/issues) · 
[Safety Guidelines](https://github.com/paulmann/Windows-Cleaner-and-Optimizer#safety-and-backup-features) · 
[Documentation](https://github.com/paulmann/Windows-Cleaner-and-Optimizer/blob/main/README.md)

---

### 🔒 Safety Disclaimer

**Important**: Always test cleanup operations in a non-production environment first. Use safety features (-EnableSafetyMode, -CreateRestorePoint) when performing cleanup on important systems. The authors are not responsible for data loss or system instability resulting from improper use of this tool. Ensure you have adequate backups before performing system cleanup operations.
