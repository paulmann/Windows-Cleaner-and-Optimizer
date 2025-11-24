<#
/**
 * Windows System Cleanup Script with Full Configuration Support
 * Enhanced for PowerShell 7+ with backward compatibility for PowerShell 5+
 * Includes safety features and system backup options
 * 
 * @author Dmitry Deynekin
 * @email mid1977@gmail.com
 * @website https://deynekin.com
 * @version 5.2 (Fixed Compatibility Issues)
 * @date October 2025
 */
#>

#Requires -Version 5.1

[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Position=0)]
    [string]$LogPath = "$env:TEMP\WindowsCleanup.log",
    
    [int]$DaysOld = 30,
    [switch]$DryRun,
    
    # Safety and backup parameters
    [switch]$EnableSafetyMode,
    [switch]$NoSafetyMode,
    [switch]$CreateRestorePoint,
    [switch]$NoCreateRestorePoint,
    [switch]$CreateSystemImage,
    [switch]$NoCreateSystemImage,
    [switch]$Force,
    
    # User scope control
    [switch]$CleanForAllUsers,
    [switch]$NoCleanForAllUsers,
    
    # Browser cache cleanup parameters
    [switch]$CleanChrome,
    [switch]$NoCleanChrome,
    [switch]$CleanEdge,
    [switch]$NoCleanEdge,
    [switch]$CleanFirefox,
    [switch]$NoCleanFirefox,
    [switch]$CleanOpera,
    [switch]$NoCleanOpera,
    [switch]$CleanYandex,
    [switch]$NoCleanYandex,
    
    # Windows system cleanup parameters
    [switch]$CleanTempFiles,
    [switch]$NoCleanTempFiles,
    [switch]$CleanPrefetch,
    [switch]$NoCleanPrefetch,
    [switch]$CleanRecycleBin,
    [switch]$NoCleanRecycleBin,
    [switch]$CleanThumbnails,
    [switch]$NoCleanThumbnails,
    [switch]$CleanWindowsTemp,
    [switch]$NoCleanWindowsTemp,
    [switch]$CleanUserTemp,
    [switch]$NoCleanUserTemp,
    
    # System logs and caches parameters
    [switch]$CleanEventLogs,
    [switch]$NoCleanEventLogs,
    [switch]$CleanIISLogs,
    [switch]$NoCleanIISLogs,
    [switch]$CleanWindowsUpdate,
    [switch]$NoCleanWindowsUpdate,
    [switch]$CleanErrorReports,
    [switch]$NoCleanErrorReports,
    [switch]$CleanCrashDumps,
    [switch]$NoCleanCrashDumps,
    
    # System optimization parameters
    [switch]$RunSFC,
    [switch]$NoRunSFC,
    [switch]$OptimizeComponents,
    [switch]$NoOptimizeComponents,
    [switch]$CleanDISMLogs,
    [switch]$NoCleanDISMLogs,
    
    # Advanced cleanup parameters
    [switch]$CleanAppCache,
    [switch]$NoCleanAppCache,
    [switch]$CleanDownloads,
    [switch]$NoCleanDownloads,
    [switch]$CleanMemoryDumps,
    [switch]$NoCleanMemoryDumps,
    [switch]$CleanDeliveryOptimization,
    [switch]$NoCleanDeliveryOptimization,
    [switch]$CleanBranchCache,
    [switch]$NoCleanBranchCache,

    # Enhanced cleanup parameters
    [switch]$RunComponentCleanupTask,
    [switch]$NoRunComponentCleanupTask,
    [switch]$RunDISMAdvanced,
    [switch]$NoRunDISMAdvanced,
    [switch]$AnalyzeComponentStore,
    [switch]$NoAnalyzeComponentStore,
    [switch]$CleanWindowsUpdateFull,
    [switch]$NoCleanWindowsUpdateFull,
    [switch]$CleanPatchCache,
    [switch]$NoCleanPatchCache,

    # Enhanced short parameters
    [alias("cct")][switch]$RunComponentCleanupTaskShort,
    [alias("ncct")][switch]$NoRunComponentCleanupTaskShort,
    [alias("disma")][switch]$RunDISMAdvancedShort,
    [alias("ndisma")][switch]$NoRunDISMAdvancedShort,
    [alias("ana")][switch]$AnalyzeComponentStoreShort,
    [alias("nana")][switch]$NoAnalyzeComponentStoreShort,
    [alias("wuf")][switch]$CleanWindowsUpdateFullShort,
    [alias("nwuf")][switch]$NoCleanWindowsUpdateFullShort,
    [alias("pc")][switch]$CleanPatchCacheShort,
    [alias("npc")][switch]$NoCleanPatchCacheShort,
    
    # Short parameters
    [alias("dr")][switch]$DryRunShort,
    [alias("au")][switch]$AllUsers,
    [alias("nau")][switch]$NoAllUsers,
    
    # Browser short parameters
    [alias("ch")][switch]$CleanChromeShort,
    [alias("nch")][switch]$NoCleanChromeShort,
    [alias("ed")][switch]$CleanEdgeShort,
    [alias("ned")][switch]$NoCleanEdgeShort,
    [alias("ff")][switch]$CleanFirefoxShort,
    [alias("nff")][switch]$NoCleanFirefoxShort,
    [alias("op")][switch]$CleanOperaShort,
    [alias("nop")][switch]$NoCleanOperaShort,
    [alias("ya")][switch]$CleanYandexShort,
    [alias("nya")][switch]$NoCleanYandexShort,
    
    # System short parameters
    [alias("tmp")][switch]$CleanTempFilesShort,
    [alias("ntmp")][switch]$NoCleanTempFilesShort,
    [alias("pf")][switch]$CleanPrefetchShort,
    [alias("npf")][switch]$NoCleanPrefetchShort,
    [alias("rb")][switch]$CleanRecycleBinShort,
    [alias("nrb")][switch]$NoCleanRecycleBinShort,
    [alias("th")][switch]$CleanThumbnailsShort,
    [alias("nth")][switch]$NoCleanThumbnailsShort,
    [alias("wtmp")][switch]$CleanWindowsTempShort,
    [alias("nwtmp")][switch]$NoCleanWindowsTempShort,
    [alias("utmp")][switch]$CleanUserTempShort,
    [alias("nutmp")][switch]$NoCleanUserTempShort,
    
    # Logs short parameters
    [alias("evt")][switch]$CleanEventLogsShort,
    [alias("nevt")][switch]$NoCleanEventLogsShort,
    [alias("iis")][switch]$CleanIISLogsShort,
    [alias("niis")][switch]$NoCleanIISLogsShort,
    [alias("wu")][switch]$CleanWindowsUpdateShort,
    [alias("nwu")][switch]$NoCleanWindowsUpdateShort,
    [alias("err")][switch]$CleanErrorReportsShort,
    [alias("nerr")][switch]$NoCleanErrorReportsShort,
    [alias("dump")][switch]$CleanCrashDumpsShort,
    [alias("ndump")][switch]$NoCleanCrashDumpsShort,
    
    # Optimization short parameters
    [alias("sfc")][switch]$RunSFCShort,
    [alias("nsfc")][switch]$NoRunSFCShort,
    [alias("comp")][switch]$OptimizeComponentsShort,
    [alias("ncomp")][switch]$NoOptimizeComponentsShort,
    [alias("dism")][switch]$CleanDISMLogsShort,
    [alias("ndism")][switch]$NoCleanDISMLogsShort,
    
    # Advanced short parameters
    [alias("app")][switch]$CleanAppCacheShort,
    [alias("napp")][switch]$NoCleanAppCacheShort,
    [alias("dl")][switch]$CleanDownloadsShort,
    [alias("ndl")][switch]$NoCleanDownloadsShort,
    [alias("mem")][switch]$CleanMemoryDumpsShort,
    [alias("nmem")][switch]$NoCleanMemoryDumpsShort,
    [alias("do")][switch]$CleanDeliveryOptimizationShort,
    [alias("ndo")][switch]$NoCleanDeliveryOptimizationShort,
    [alias("bc")][switch]$CleanBranchCacheShort,
    [alias("nbc")][switch]$NoCleanBranchCacheShort,

    # Safety short parameters
    [alias("safe")][switch]$EnableSafetyModeShort,
    [alias("nsafe")][switch]$NoSafetyModeShort,
    [alias("rp")][switch]$CreateRestorePointShort,
    [alias("nrp")][switch]$NoCreateRestorePointShort,
    [alias("img")][switch]$CreateSystemImageShort,
    [alias("nimg")][switch]$NoCreateSystemImageShort,
    [alias("f")][switch]$ForceShort,

    # PowerShell 7+ specific parameters
    [switch]$UseParallelProcessing,
    [switch]$NoUseParallelProcessing,
    [switch]$EnableTelemetry,
    [switch]$NoEnableTelemetry,

    # Help parameter
    [switch]$Help
)

# =============================================
# POWERSHELL VERSION DETECTION AND COMPATIBILITY
# =============================================

# Detect PowerShell version and set compatibility flags - FIXED: Use different variable name
$Script:IsPS7Plus = $PSVersionTable.PSVersion -ge [version]'7.0'
$Script:IsWindowsPlatform = ($PSVersionTable.Platform -eq 'Win32NT') -or ($IsWindows -eq $true)

# Set default values for PS7+ features
$Script:UseParallel = $Script:IsPS7Plus -and ($UseParallelProcessing -or (-not $NoUseParallelProcessing))
$Script:EnableEnhancedTelemetry = $Script:IsPS7Plus -and ($EnableTelemetry -or (-not $NoEnableTelemetry))

if (-not $Script:IsWindowsPlatform) {
    Write-Warning "This script is designed for Windows systems. Some functionality may not work on $($PSVersionTable.Platform)."
}

# =============================================
# FIXED PARAMETER PROCESSING
# =============================================

# Process GNU-style parameters
$helpRequested = $false
$dryRunRequested = $false

foreach ($arg in $args) {
    switch -Wildcard ($arg) {
        '--Help' { $helpRequested = $true }
        '--help' { $helpRequested = $true }
        '--DryRun' { $dryRunRequested = $true }
        '--dryrun' { $dryRunRequested = $true }
        '--dry-run' { $dryRunRequested = $true }
        '--Force' { $Force = $true }
        '--force' { $Force = $true }
        '-?' { $helpRequested = $true }
    }
}

if ($helpRequested) { $Help = $true }
if ($dryRunRequested) { $DryRun = $true }

# FIX: Explicitly set WhatIfPreference only when DryRun is activated
if ($DryRun -or $DryRunShort -or $dryRunRequested) {
    $script:WhatIfPreference = $true
    $Global:WhatIfPreference = $true
    Write-Host "DRY RUN MODE: No changes will be made to the system" -ForegroundColor Yellow
} else {
    # IMPORTANT: Explicitly reset WhatIfPreference if DryRun is not activated
    $script:WhatIfPreference = $false
    $Global:WhatIfPreference = $false
}

# Fix log path if it was set incorrectly
if ($LogPath -eq '--DryRun' -or $LogPath -eq '--dryrun' -or $LogPath -eq '--dry-run' -or 
    $LogPath -eq '--Help' -or $LogPath -eq '--help' -or $LogPath -eq '--Force' -or $LogPath -eq '--force') {
    $LogPath = "$env:TEMP\WindowsCleanup.log"
}

# =============================================
# SAFETY CONFIGURATION AND DANGEROUS OPERATIONS
# =============================================

# Define potentially dangerous operations that require explicit consent
$Script:DangerousOperations = @{
    "CleanWindowsUpdateFull" = @{
        Description = "Complete Windows Update cache removal (requires service restart)"
        RiskLevel = "High"
        Command = { param($config) Clear-WindowsUpdateFull }
    }
    "CleanRecycleBin" = @{
        Description = "Permanent deletion of Recycle Bin contents"
        RiskLevel = "Medium"
        Command = { param($config) Clear-RecycleBin }
    }
    "CleanEventLogs" = @{
        Description = "Clearing Windows Event Logs (loss of audit trail)"
        RiskLevel = "Medium"
        Command = { param($config) Clear-EventLogs }
    }
    "RunDISMAdvanced" = @{
        Description = "Advanced DISM operations (system component modification)"
        RiskLevel = "High"
        Command = { param($config) Invoke-DISMAdvancedCleanup }
    }
    "CleanPatchCache" = @{
        Description = "Windows Installer patch cache removal"
        RiskLevel = "High"
        Command = { param($config) Clear-PatchCache }
    }
}

# Safety configuration
$Script:SafetyModeEnabled = $EnableSafetyMode -or $EnableSafetyModeShort -or (-not ($NoSafetyMode -or $NoSafetyModeShort))
$Script:CreateRestorePointEnabled = $CreateRestorePoint -or $CreateRestorePointShort -or (-not ($NoCreateRestorePoint -or $NoCreateRestorePointShort))
$Script:CreateSystemImageEnabled = $CreateSystemImage -or $CreateSystemImageShort -or (-not ($NoCreateSystemImage -or $NoCreateSystemImageShort))

# =============================================
# CONFIGURATION
# =============================================

[hashtable]$CleanupConfig = @{
    # User scope
    CleanForAllUsers = $true
    
    # Browser cache cleanup
    CleanChrome         = $true
    CleanEdge          = $true  
    CleanFirefox       = $true
    CleanOpera         = $true
    CleanYandex        = $true
    
    # Windows system cleanup
    CleanTempFiles     = $true
    CleanPrefetch      = $true
    CleanRecycleBin    = $true
    CleanThumbnails    = $true
    CleanWindowsTemp   = $true
    CleanUserTemp      = $true
    
    # System logs and caches
    CleanEventLogs     = $true
    CleanIISLogs       = $true
    CleanWindowsUpdate = $true
    CleanErrorReports  = $true
    CleanCrashDumps    = $true
    
    # System optimization
    RunSFC             = $true
    OptimizeComponents = $true
    CleanDISMLogs      = $true
    
    # Advanced cleanup
    CleanAppCache      = $true
    CleanDownloads     = $false
    CleanMemoryDumps   = $true
    CleanDeliveryOptimization = $true
    CleanBranchCache   = $true

    # Enhanced cleanup parameters
    RunComponentCleanupTask = $true
    RunDISMAdvanced = $true
    AnalyzeComponentStore = $true
    CleanWindowsUpdateFull = $true
    CleanPatchCache = $true
    
    # Safety features
    SafetyModeEnabled = $Script:SafetyModeEnabled
    CreateRestorePointEnabled = $Script:CreateRestorePointEnabled
    CreateSystemImageEnabled = $Script:CreateSystemImageEnabled
    
    # PowerShell 7+ specific features
    UseParallelProcessing = $Script:UseParallel
    EnableTelemetry = $Script:EnableEnhancedTelemetry
    
    # Log retention (days)
    EventLogRetention  = 30
    IISLogRetention    = 14
    TempFileAge        = 7
}

function Update-ConfigurationFromParameters {
    # User scope
    if ($CleanForAllUsers -or $AllUsers) { $CleanupConfig.CleanForAllUsers = $true }
    if ($NoCleanForAllUsers -or $NoAllUsers) { $CleanupConfig.CleanForAllUsers = $false }
    
    # Browser parameters
    if ($CleanChrome -or $CleanChromeShort) { $CleanupConfig.CleanChrome = $true }
    if ($NoCleanChrome -or $NoCleanChromeShort) { $CleanupConfig.CleanChrome = $false }
    
    if ($CleanEdge -or $CleanEdgeShort) { $CleanupConfig.CleanEdge = $true }
    if ($NoCleanEdge -or $NoCleanEdgeShort) { $CleanupConfig.CleanEdge = $false }
    
    if ($CleanFirefox -or $CleanFirefoxShort) { $CleanupConfig.CleanFirefox = $true }
    if ($NoCleanFirefox -or $NoCleanFirefoxShort) { $CleanupConfig.CleanFirefox = $false }
    
    if ($CleanOpera -or $CleanOperaShort) { $CleanupConfig.CleanOpera = $true }
    if ($NoCleanOpera -or $NoCleanOperaShort) { $CleanupConfig.CleanOpera = $false }
    
    if ($CleanYandex -or $CleanYandexShort) { $CleanupConfig.CleanYandex = $true }
    if ($NoCleanYandex -or $NoCleanYandexShort) { $CleanupConfig.CleanYandex = $false }
    
    # System cleanup parameters
    if ($CleanTempFiles -or $CleanTempFilesShort) { $CleanupConfig.CleanTempFiles = $true }
    if ($NoCleanTempFiles -or $NoCleanTempFilesShort) { $CleanupConfig.CleanTempFiles = $false }
    
    if ($CleanPrefetch -or $CleanPrefetchShort) { $CleanupConfig.CleanPrefetch = $true }
    if ($NoCleanPrefetch -or $NoCleanPrefetchShort) { $CleanupConfig.CleanPrefetch = $false }
    
    if ($CleanRecycleBin -or $CleanRecycleBinShort) { $CleanupConfig.CleanRecycleBin = $true }
    if ($NoCleanRecycleBin -or $NoCleanRecycleBinShort) { $CleanupConfig.CleanRecycleBin = $false }
    
    if ($CleanThumbnails -or $CleanThumbnailsShort) { $CleanupConfig.CleanThumbnails = $true }
    if ($NoCleanThumbnails -or $NoCleanThumbnailsShort) { $CleanupConfig.CleanThumbnails = $false }
    
    if ($CleanWindowsTemp -or $CleanWindowsTempShort) { $CleanupConfig.CleanWindowsTemp = $true }
    if ($NoCleanWindowsTemp -or $NoCleanWindowsTempShort) { $CleanupConfig.CleanWindowsTemp = $false }
    
    if ($CleanUserTemp -or $CleanUserTempShort) { $CleanupConfig.CleanUserTemp = $true }
    if ($NoCleanUserTemp -or $NoCleanUserTempShort) { $CleanupConfig.CleanUserTemp = $false }
    
    # Logs and caches parameters
    if ($CleanEventLogs -or $CleanEventLogsShort) { $CleanupConfig.CleanEventLogs = $true }
    if ($NoCleanEventLogs -or $NoCleanEventLogsShort) { $CleanupConfig.CleanEventLogs = $false }
    
    if ($CleanIISLogs -or $CleanIISLogsShort) { $CleanupConfig.CleanIISLogs = $true }
    if ($NoCleanIISLogs -or $NoCleanIISLogsShort) { $CleanupConfig.CleanIISLogs = $false }
    
    if ($CleanWindowsUpdate -or $CleanWindowsUpdateShort) { $CleanupConfig.CleanWindowsUpdate = $true }
    if ($NoCleanWindowsUpdate -or $NoCleanWindowsUpdateShort) { $CleanupConfig.CleanWindowsUpdate = $false }
    
    if ($CleanErrorReports -or $CleanErrorReportsShort) { $CleanupConfig.CleanErrorReports = $true }
    if ($NoCleanErrorReports -or $NoCleanErrorReportsShort) { $CleanupConfig.CleanErrorReports = $false }
    
    if ($CleanCrashDumps -or $CleanCrashDumpsShort) { $CleanupConfig.CleanCrashDumps = $true }
    if ($NoCleanCrashDumps -or $NoCleanCrashDumpsShort) { $CleanupConfig.CleanCrashDumps = $false }
    
    # Optimization parameters
    if ($RunSFC -or $RunSFCShort) { $CleanupConfig.RunSFC = $true }
    if ($NoRunSFC -or $NoRunSFCShort) { $CleanupConfig.RunSFC = $false }
    
    if ($OptimizeComponents -or $OptimizeComponentsShort) { $CleanupConfig.OptimizeComponents = $true }
    if ($NoOptimizeComponents -or $NoOptimizeComponentsShort) { $CleanupConfig.OptimizeComponents = $false }
    
    if ($CleanDISMLogs -or $CleanDISMLogsShort) { $CleanupConfig.CleanDISMLogs = $true }
    if ($NoCleanDISMLogs -or $NoCleanDISMLogsShort) { $CleanupConfig.CleanDISMLogs = $false }
    
    # Advanced parameters
    if ($CleanAppCache -or $CleanAppCacheShort) { $CleanupConfig.CleanAppCache = $true }
    if ($NoCleanAppCache -or $NoCleanAppCacheShort) { $CleanupConfig.CleanAppCache = $false }
    
    if ($CleanDownloads -or $CleanDownloadsShort) { $CleanupConfig.CleanDownloads = $true }
    if ($NoCleanDownloads -or $NoCleanDownloadsShort) { $CleanupConfig.CleanDownloads = $false }
    
    if ($CleanMemoryDumps -or $CleanMemoryDumpsShort) { $CleanupConfig.CleanMemoryDumps = $true }
    if ($NoCleanMemoryDumps -or $NoCleanMemoryDumpsShort) { $CleanupConfig.CleanMemoryDumps = $false }
    
    if ($CleanDeliveryOptimization -or $CleanDeliveryOptimizationShort) { $CleanupConfig.CleanDeliveryOptimization = $true }
    if ($NoCleanDeliveryOptimization -or $NoCleanDeliveryOptimizationShort) { $CleanupConfig.CleanDeliveryOptimization = $false }
    
    if ($CleanBranchCache -or $CleanBranchCacheShort) { $CleanupConfig.CleanBranchCache = $true }
    if ($NoCleanBranchCache -or $NoCleanBranchCacheShort) { $CleanupConfig.CleanBranchCache = $false }

    # Enhanced parameters
    if ($RunComponentCleanupTask -or $RunComponentCleanupTaskShort) { $CleanupConfig.RunComponentCleanupTask = $true }
    if ($NoRunComponentCleanupTask -or $NoRunComponentCleanupTaskShort) { $CleanupConfig.RunComponentCleanupTask = $false }

    if ($RunDISMAdvanced -or $RunDISMAdvancedShort) { $CleanupConfig.RunDISMAdvanced = $true }
    if ($NoRunDISMAdvanced -or $NoRunDISMAdvancedShort) { $CleanupConfig.RunDISMAdvanced = $false }

    if ($AnalyzeComponentStore -or $AnalyzeComponentStoreShort) { $CleanupConfig.AnalyzeComponentStore = $true }
    if ($NoAnalyzeComponentStore -or $NoAnalyzeComponentStoreShort) { $CleanupConfig.AnalyzeComponentStore = $false }

    if ($CleanWindowsUpdateFull -or $CleanWindowsUpdateFullShort) { $CleanupConfig.CleanWindowsUpdateFull = $true }
    if ($NoCleanWindowsUpdateFull -or $NoCleanWindowsUpdateFullShort) { $CleanupConfig.CleanWindowsUpdateFull = $false }

    if ($CleanPatchCache -or $CleanPatchCacheShort) { $CleanupConfig.CleanPatchCache = $true }
    if ($NoCleanPatchCache -or $NoCleanPatchCacheShort) { $CleanupConfig.CleanPatchCache = $false }

    # Safety parameters
    if ($EnableSafetyMode -or $EnableSafetyModeShort) { $CleanupConfig.SafetyModeEnabled = $true }
    if ($NoSafetyMode -or $NoSafetyModeShort) { $CleanupConfig.SafetyModeEnabled = $false }

    if ($CreateRestorePoint -or $CreateRestorePointShort) { $CleanupConfig.CreateRestorePointEnabled = $true }
    if ($NoCreateRestorePoint -or $NoCreateRestorePointShort) { $CleanupConfig.CreateRestorePointEnabled = $false }

    if ($CreateSystemImage -or $CreateSystemImageShort) { $CleanupConfig.CreateSystemImageEnabled = $true }
    if ($NoCreateSystemImage -or $NoCreateSystemImageShort) { $CleanupConfig.CreateSystemImageEnabled = $false }

    # PowerShell 7+ parameters
    if ($UseParallelProcessing) { $CleanupConfig.UseParallelProcessing = $true }
    if ($NoUseParallelProcessing) { $CleanupConfig.UseParallelProcessing = $false }
    
    if ($EnableTelemetry) { $CleanupConfig.EnableTelemetry = $true }
    if ($NoEnableTelemetry) { $CleanupConfig.EnableTelemetry = $false }
}

# Global variables
$Global:TotalFilesDeleted = 0
$Global:TotalSpaceFreed = 0
$Global:StartTime = Get-Date
$Global:CleanupStatistics = @{
    OperationsCompleted = 0
    OperationsFailed = 0
    OperationsSkipped = 0
}

# =============================================
# ENHANCED UTILITY FUNCTIONS (PS7+ COMPATIBLE)
# =============================================

function Format-FileSize {
    param([long]$Size)

    if ($Size -gt 1TB) { return "{0:N2} TB" -f ($Size / 1TB) }
    elseif ($Size -gt 1GB) { return "{0:N2} GB" -f ($Size / 1GB) }
    elseif ($Size -gt 1MB) { return "{0:N2} MB" -f ($Size / 1MB) }
    elseif ($Size -gt 1KB) { return "{0:N2} KB" -f ($Size / 1KB) }
    else { return "$Size bytes" }
}

function Get-PathSize {
    param([string]$Path)

    if (-not (Test-Path $Path)) { return 0 }

    $totalSize = 0
    try {
        if (Test-Path $Path -PathType Container) {
            # Use faster method for PS7+
            if ($Script:IsPS7Plus) {
                $items = Get-ChildItem $Path -Recurse -Force -ErrorAction SilentlyContinue -File
                $totalSize = ($items | Measure-Object -Property Length -Sum).Sum
            } else {
                # Backward compatible method for PS5
                $items = Get-ChildItem $Path -Recurse -Force -ErrorAction SilentlyContinue
                foreach ($item in $items) {
                    if (-not $item.PSIsContainer) {
                        $totalSize += $item.Length
                    }
                }
            }
        } else {
            $file = Get-Item $Path -ErrorAction SilentlyContinue
            if ($file) { $totalSize = $file.Length }
        }
    }
    catch {
        Write-Debug "Error calculating size for path: $Path - $($_.Exception.Message)"
    }

    return $totalSize
}

function Write-LogMessage {
    param(
        [string]$Message,
        [string]$Level = "Info"
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp] [$Level] $Message"

    # PowerShell 7+ supports better color handling
    if ($Script:IsPS7Plus) {
        switch ($Level) {
            "Error" { Write-Host $logMessage -ForegroundColor Red }
            "Warning" { Write-Host $logMessage -ForegroundColor Yellow }
            "Success" { Write-Host $logMessage -ForegroundColor Green }
            "DryRun" { Write-Host $logMessage -ForegroundColor Cyan }
            "Debug" { Write-Host $logMessage -ForegroundColor Gray }
            "Safety" { Write-Host $logMessage -ForegroundColor Magenta }
            default { Write-Host $logMessage }
        }
    } else {
        # Fallback for PowerShell 5
        switch ($Level) {
            "Error" { Write-Host $logMessage -ForegroundColor Red }
            "Warning" { Write-Host $logMessage -ForegroundColor Yellow }
            "Success" { Write-Host $logMessage -ForegroundColor Green }
            default { Write-Host $logMessage }
        }
    }

    try {
        Add-Content -Path $LogPath -Value $logMessage -ErrorAction SilentlyContinue
    } catch {
        # Fallback logging
        try {
            $fallbackPath = "$env:TEMP\WindowsCleanup.log"
            if ($LogPath -ne $fallbackPath) {
                Add-Content -Path $fallbackPath -Value $logMessage -ErrorAction SilentlyContinue
            }
        } catch {
            # If all logging fails, just continue
        }
    }

    # Enhanced telemetry for PS7+
    if ($CleanupConfig.EnableTelemetry -and $Script:IsPS7Plus) {
        Update-Telemetry -Message $Message -Level $Level
    }
}

function Update-Telemetry {
    param(
        [string]$Message,
        [string]$Level
    )

    if (-not $CleanupConfig.EnableTelemetry) { return }

    $Global:CleanupStatistics.OperationsCompleted++
    
    switch ($Level) {
        "Error" { $Global:CleanupStatistics.OperationsFailed++ }
        "Skipped" { $Global:CleanupStatistics.OperationsSkipped++ }
    }
}

function Write-ProgressInfo {
    param(
        [string]$Operation,
        [string]$Status
    )

    $icon = [char]::ConvertFromUtf32(0x1F4A1)
    $message = $icon + " " + $Operation + ": " + $Status
    
    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested
    if ($isDryRun) {
        Write-LogMessage $message -Level DryRun
    } else {
        Write-LogMessage $message
    }
}

function Write-SuccessInfo {
    param(
        [string]$Message,
        [int]$FilesCount = 0,
        [long]$SpaceFreed = 0
    )

    $icon = [char]::ConvertFromUtf32(0x2705)
    $spaceText = if ($SpaceFreed -gt 0) { " (" + (Format-FileSize $SpaceFreed) + ")" } else { "" }
    $fullMessage = $icon + " " + $Message
    if ($FilesCount -gt 0) { $fullMessage += " - $FilesCount files" + $spaceText }

    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested
    if ($isDryRun) {
        Write-LogMessage "[DRY RUN] $fullMessage" -Level DryRun
    } else {
        Write-LogMessage $fullMessage -Level Success
        $Global:TotalFilesDeleted += $FilesCount
        $Global:TotalSpaceFreed += $SpaceFreed
        Update-Telemetry -Message $Message -Level "Success"
    }
}

function Write-ErrorInfo {
    param([string]$Message)

    $icon = [char]::ConvertFromUtf32(0x274C)
    Write-LogMessage ($icon + " " + $Message) -Level Error
    Update-Telemetry -Message $Message -Level "Error"
}

function Write-SkippedInfo {
    param([string]$Message)

    $icon = [char]::ConvertFromUtf32(0x23ED)
    Write-LogMessage ($icon + " SKIPPED: " + $Message) -Level Warning
    Update-Telemetry -Message $Message -Level "Skipped"
}

function Write-SafetyInfo {
    param([string]$Message)

    $icon = [char]::ConvertFromUtf32(0x1F6E1)
    Write-LogMessage ($icon + " SAFETY: " + $Message) -Level Safety
}

# =============================================
# SAFETY AND BACKUP FUNCTIONS
# =============================================

function Start-SystemRestorePointCreation {
    Write-SafetyInfo "Launching System Restore Point creation dialog..."
    
    try {
        # Launch System Properties with System Protection tab focused
        Start-Process "sysdm.cpl" -ArgumentList ",4" -Wait
        Write-SuccessInfo "System Restore Point dialog launched successfully"
        return $true
    }
    catch {
        Write-ErrorInfo "Failed to launch System Restore Point dialog: $($_.Exception.Message)"
        return $false
    }
}

function Start-SystemImageBackup {
    Write-SafetyInfo "Launching System Image Backup creation tool..."
    
    try {
        # Launch Windows 10/11 Backup and Restore (Windows 7) tool for system image creation
        Start-Process "sdclt.exe" -ArgumentList "/BLBBACKUP" -Wait
        Write-SuccessInfo "System Image Backup tool launched successfully"
        return $true
    }
    catch {
        Write-ErrorInfo "Failed to launch System Image Backup tool: $($_.Exception.Message)"
        return $false
    }
}

function Confirm-RestorePointCreated {
    $title = "System Restore Point Confirmation"
    $message = "I have created a system restore point and want to continue with the cleanup (Yes/No)"
    
    $choices = @(
        [System.Management.Automation.Host.ChoiceDescription]::new("&Yes", "Continue with cleanup after creating restore point"),
        [System.Management.Automation.Host.ChoiceDescription]::new("&No", "Abort the cleanup process")
    )
    
    $decision = $Host.UI.PromptForChoice($title, $message, $choices, 0)
    
    return $decision -eq 0
}

function Confirm-DangerousOperation {
    param(
        [string]$OperationName,
        [string]$Description,
        [string]$RiskLevel
    )
    
    if ($Force -or $ForceShort) {
        Write-SafetyInfo "Force mode enabled - bypassing confirmation for: $Description"
        return $true
    }
    
    if (-not $CleanupConfig.SafetyModeEnabled) {
        Write-SafetyInfo "Safety mode disabled - proceeding with: $Description"
        return $true
    }
    
    $title = "DANGEROUS OPERATION CONFIRMATION"
    $message = @"
RISK LEVEL: $RiskLevel

OPERATION: $Description

This operation may have significant system impact:
- Data loss potential
- System instability risk
- Irreversible changes

Do you want to proceed with this operation?
"@
    
    $choices = @(
        [System.Management.Automation.Host.ChoiceDescription]::new("&Proceed", "Continue with this operation (not recommended)"),
        [System.Management.Automation.Host.ChoiceDescription]::new("&Skip", "Skip this operation and continue safely")
    )
    
    $decision = $Host.UI.PromptForChoice($title, $message, $choices, 1)
    
    return $decision -eq 0
}

# =============================================
# SYSTEM CHECK FUNCTIONS (ENHANCED FOR PS7+)
# =============================================

function Test-AdminPrivileges {
    try {
        if ($Script:IsPS7Plus) {
            # Modern approach for PS7+
            return ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
        } else {
            # Backward compatible approach
            $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
            $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
            return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
        }
    }
    catch {
        return $false
    }
}

function Test-ExecutionPolicy {
    try {
        $policy = Get-ExecutionPolicy
        return $policy -ne "Restricted"
    }
    catch {
        return $false
    }
}

function Test-WindowsVersion {
    try {
        if ($Script:IsPS7Plus -and $Script:IsWindowsPlatform) {
            # Modern CIM approach for PS7+
            $os = Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction Stop
            $version = [version]$os.Version
            return $version.Major -ge 10
        } else {
            # Backward compatible WMI approach
            $os = Get-WmiObject -Class Win32_OperatingSystem -ErrorAction Stop
            $version = [version]$os.Version
            return $version.Major -ge 10
        }
    }
    catch {
        return $false
    }
}

function Show-SystemRequirements {
    Write-Host "System Requirements Check:" -ForegroundColor Cyan
    Write-Host "  PowerShell Version: $($PSVersionTable.PSVersion)" -ForegroundColor $(if ($Script:IsPS7Plus) {'Green'} else {'Yellow'})
    Write-Host "  Platform: $($PSVersionTable.Platform)" -ForegroundColor Green
    Write-Host "  Administrator Privileges: $(if (Test-AdminPrivileges) {'PASS'} else {'FAIL'})" -ForegroundColor $(if (Test-AdminPrivileges) {'Green'} else {'Red'})
    Write-Host "  Execution Policy: $(if (Test-ExecutionPolicy) {'PASS'} else {'FAIL'})" -ForegroundColor $(if (Test-ExecutionPolicy) {'Green'} else {'Red'})
    Write-Host "  Windows Version: $(if (Test-WindowsVersion) {'PASS'} else {'FAIL'})" -ForegroundColor $(if (Test-WindowsVersion) {'Green'} else {'Red'})
    Write-Host "  Safety Mode: $(if ($CleanupConfig.SafetyModeEnabled) {'ENABLED'} else {'DISABLED'})" -ForegroundColor $(if ($CleanupConfig.SafetyModeEnabled) {'Green'} else {'Yellow'})
    Write-Host "  Parallel Processing: $(if ($CleanupConfig.UseParallelProcessing) {'ENABLED'} else {'DISABLED'})" -ForegroundColor $(if ($CleanupConfig.UseParallelProcessing) {'Green'} else {'Yellow'})
    Write-Host ""
}

function Test-SystemRequirements {
    $requirementsMet = $true
    
    if (-not (Test-AdminPrivileges)) {
        Write-Error "This script requires Administrator privileges. Please run as Administrator."
        $requirementsMet = $false
    }
    
    if (-not (Test-ExecutionPolicy)) {
        Write-Error "Execution Policy is set to Restricted. Please set to RemoteSigned or Unrestricted."
        Write-Host "Run: Set-ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor Yellow
        $requirementsMet = $false
    }
    
    if (-not (Test-WindowsVersion)) {
        Write-Error "This script requires Windows 10 or newer."
        $requirementsMet = $false
    }
    
    if (-not $Script:IsWindowsPlatform) {
        Write-Warning "This script is designed for Windows. Some functionality may be limited."
    }
    
    return $requirementsMet
}

# =============================================
# ENHANCED CLEANUP FUNCTIONS (PS7+ OPTIMIZED)
# =============================================

function Remove-PathEnhanced {
    param(
        [string]$Path,
        [string]$Description = "items"
    )

    $resolvedPath = $Path -replace '\*$', ''
    if (-not (Test-Path $resolvedPath)) { 
        Write-SkippedInfo "$Description - Path not found: $resolvedPath"
        return
    }

    $beforeSize = Get-PathSize $Path
    $filesCount = 0

    if (Test-Path $Path -PathType Container) {
        $items = Get-ChildItem $Path -Force -ErrorAction SilentlyContinue
        $filesCount = ($items | Measure-Object).Count
    } else {
        $filesCount = 1
    }

    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested
    
    if ($isDryRun) {
        Write-SuccessInfo "[DRY RUN] Would remove $Description from $Path" -FilesCount $filesCount -SpaceFreed $beforeSize
    } else {
        try {
            # Use more efficient method for PS7+
            if ($Script:IsPS7Plus) {
                Get-ChildItem $Path -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
            } else {
                Remove-Item $Path -Recurse -Force -ErrorAction SilentlyContinue
            }
            Write-SuccessInfo "Removed $Description from $Path" -FilesCount $filesCount -SpaceFreed $beforeSize
        }
        catch {
            Write-ErrorInfo "Failed to remove $Description from $Path - $($_.Exception.Message)"
        }
    }
}

function Stop-ProcessSafely {
    param([string[]]$ProcessNames)

    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested

    foreach ($processName in $ProcessNames) {
        $processes = Get-Process -Name $processName -ErrorAction SilentlyContinue
        if ($processes) {
            if ($isDryRun) {
                Write-ProgressInfo "Process Control" "[DRY RUN] Would stop $($processes.Count) $processName processes"
            } else {
                Write-ProgressInfo "Process Control" "Stopping $($processes.Count) $processName processes"
                
                # Use more efficient process stopping for PS7+
                if ($Script:IsPS7Plus -and $CleanupConfig.UseParallelProcessing) {
                    $processes | ForEach-Object -Parallel {
                        Stop-Process -Id $_.Id -Force -ErrorAction SilentlyContinue
                    } -ThrottleLimit 5
                } else {
                    $processes | Stop-Process -Force -ErrorAction SilentlyContinue
                }
                
                Write-SuccessInfo "Stopped $($processes.Count) $processName processes"
            }
        }
    }
}

function Get-UserProfiles {
    if ($CleanupConfig.CleanForAllUsers) {
        return Get-ChildItem "$env:SYSTEMDRIVE\Users" -Directory -ErrorAction SilentlyContinue | 
               Where-Object { $_.Name -notin @('Public', 'Default', 'All Users') }
    } else {
        return @([PSCustomObject]@{
            FullName = $env:USERPROFILE
            Name = $env:USERNAME
        })
    }
}

# =============================================
# ENHANCED CLEANUP OPERATIONS WITH SAFETY CHECKS
# =============================================

function Clear-TempFiles {
    if (-not $CleanupConfig.CleanTempFiles) {
        Write-SkippedInfo "Temporary Files Cleanup (disabled in config)"
        return
    }

    Write-ProgressInfo "Temporary Files Cleanup" "Starting cleanup $(if ($CleanupConfig.CleanForAllUsers) {'for all users'} else {'for current user'})"

    $tempPaths = @()

    if ($CleanupConfig.CleanWindowsTemp -and (Test-Path "$env:WINDIR\Temp")) {
        $tempPaths += "$env:WINDIR\Temp\*"
    }

    $userProfiles = Get-UserProfiles
    foreach ($profile in $userProfiles) {
        if ($CleanupConfig.CleanUserTemp) {
            $userTempPaths = @(
                "$($profile.FullName)\AppData\Local\Temp\*",
                "$($profile.FullName)\AppData\Local\Microsoft\Windows\Temporary Internet Files\*",
                "$($profile.FullName)\AppData\Roaming\Microsoft\Windows\Recent\*"
            )
            foreach ($path in $userTempPaths) {
                if (Test-Path (Split-Path $path -Parent)) {
                    $tempPaths += $path
                }
            }
        }

        if ($CleanupConfig.CleanThumbnails) {
            $thumbPaths = @(
                "$($profile.FullName)\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db",
                "$($profile.FullName)\AppData\Local\IconCache.db"
            )
            foreach ($path in $thumbPaths) {
                $tempPaths += $path
            }
        }
    }

    if ($CleanupConfig.CleanPrefetch -and (Test-Path "$env:WINDIR\Prefetch")) {
        $tempPaths += "$env:WINDIR\Prefetch\*"
    }

    # FIXED: Use sequential processing to avoid scope issues with parallel blocks
    foreach ($path in $tempPaths) {
        $parentPath = Split-Path $path -Parent
        $userName = if ($parentPath -like "*Users\*") { 
            $parentPath.Split('\')[2] 
        } else { 
            "System" 
        }
        Remove-PathEnhanced -Path $path -Description "temporary files for $userName"
    }
}

function Clear-BrowserCaches {
    if (-not ($CleanupConfig.CleanChrome -or $CleanupConfig.CleanEdge -or $CleanupConfig.CleanFirefox -or $CleanupConfig.CleanOpera -or $CleanupConfig.CleanYandex)) {
        Write-SkippedInfo "Browser Cache Cleanup (all browser cleanups disabled in config)"
        return
    }

    Write-ProgressInfo "Browser Cache Cleanup" "Cleaning browser caches $(if ($CleanupConfig.CleanForAllUsers) {'for all users'} else {'for current user'})"

    $userProfiles = Get-UserProfiles

    foreach ($profile in $userProfiles) {
        $userName = $profile.Name

        # Chrome cleanup
        if ($CleanupConfig.CleanChrome) {
            $chromePaths = @(
                "$($profile.FullName)\AppData\Local\Google\Chrome\User Data\Default\Cache\*",
                "$($profile.FullName)\AppData\Local\Google\Chrome\User Data\Default\Code Cache\*",
                "$($profile.FullName)\AppData\Local\Google\Chrome\User Data\Default\GPUCache\*"
            )
            foreach ($path in $chromePaths) {
                if (Test-Path (Split-Path $path -Parent)) {
                    Remove-PathEnhanced -Path $path -Description "Chrome cache for $userName"
                }
            }
        }

        # Edge cleanup
        if ($CleanupConfig.CleanEdge) {
            $edgePaths = @(
                "$($profile.FullName)\AppData\Local\Microsoft\Edge\User Data\Default\Cache\*",
                "$($profile.FullName)\AppData\Local\Microsoft\Edge\User Data\Default\Code Cache\*",
                "$($profile.FullName)\AppData\Local\Microsoft\Edge\User Data\Default\GPUCache\*"
            )
            foreach ($path in $edgePaths) {
                if (Test-Path (Split-Path $path -Parent)) {
                    Remove-PathEnhanced -Path $path -Description "Edge cache for $userName"
                }
            }
        }

        # Firefox cleanup
        if ($CleanupConfig.CleanFirefox) {
            $firefoxPath = "$($profile.FullName)\AppData\Local\Mozilla\Firefox\Profiles"
            if (Test-Path $firefoxPath) {
                $firefoxProfiles = Get-ChildItem $firefoxPath -Directory -ErrorAction SilentlyContinue
                foreach ($ffProfile in $firefoxProfiles) {
                    $cachePaths = @(
                        "$($ffProfile.FullName)\cache2\*",
                        "$($ffProfile.FullName)\thumbnails\*"
                    )
                    foreach ($path in $cachePaths) {
                        if (Test-Path $path) {
                            Remove-PathEnhanced -Path $path -Description "Firefox cache for $userName"
                        }
                    }
                }
            }
        }

        # Opera cleanup
        if ($CleanupConfig.CleanOpera) {
            $operaPaths = @(
                "$($profile.FullName)\AppData\Roaming\Opera Software\Opera Stable\Cache\*",
                "$($profile.FullName)\AppData\Roaming\Opera Software\Opera Stable\GPUCache\*"
            )
            foreach ($path in $operaPaths) {
                if (Test-Path (Split-Path $path -Parent)) {
                    Remove-PathEnhanced -Path $path -Description "Opera cache for $userName"
                }
            }
        }

        # Yandex cleanup
        if ($CleanupConfig.CleanYandex) {
            $yandexPaths = @(
                "$($profile.FullName)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cache\*",
                "$($profile.FullName)\AppData\Local\Yandex\YandexBrowser\User Data\Default\GPUCache\*"
            )
            foreach ($path in $yandexPaths) {
                if (Test-Path (Split-Path $path -Parent)) {
                    Remove-PathEnhanced -Path $path -Description "Yandex cache for $userName"
                }
            }
        }
    }
}

function Clear-RecycleBin {
    if (-not $CleanupConfig.CleanRecycleBin) {
        Write-SkippedInfo "Recycle Bin Cleanup (disabled in config)"
        return
    }

    # Safety check for dangerous operation
    if (-not (Confirm-DangerousOperation -OperationName "CleanRecycleBin" -Description "Permanent deletion of Recycle Bin contents" -RiskLevel "Medium")) {
        Write-SkippedInfo "Recycle Bin Cleanup - skipped by user choice"
        return
    }

    Write-ProgressInfo "Recycle Bin Cleanup" "Emptying Recycle Bin $(if ($CleanupConfig.CleanForAllUsers) {'for all users'} else {'for current user'})"

    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested

    if ($CleanupConfig.CleanForAllUsers) {
        $recycleBinPath = "$env:SYSTEMDRIVE\`$Recycle.Bin"
        if (Test-Path $recycleBinPath) {
            $userFolders = Get-ChildItem $recycleBinPath -Directory -ErrorAction SilentlyContinue
            foreach ($userFolder in $userFolders) {
                Remove-PathEnhanced -Path "$($userFolder.FullName)\*" -Description "Recycle Bin for user $($userFolder.Name)"
            }
        }
    } else {
        if ($isDryRun) {
            Write-SuccessInfo "[DRY RUN] Would clean Recycle Bin for current user"
        } else {
            try {
                $shell = New-Object -ComObject Shell.Application
                $items = $shell.NameSpace(0xA).Items()
                $itemCount = $items.Count
                foreach ($item in $items) {
                    Remove-Item $item.Path -Recurse -Force -ErrorAction SilentlyContinue
                }
                Write-SuccessInfo "Cleaned Recycle Bin for current user - $itemCount items removed"
            }
            catch {
                Write-ErrorInfo "Failed to clean Recycle Bin: $($_.Exception.Message)"
            }
        }
    }
}

function Clear-WindowsUpdateCache {
    if (-not $CleanupConfig.CleanWindowsUpdate) {
        Write-SkippedInfo "Windows Update Cache Cleanup (disabled in config)"
        return
    }

    Write-ProgressInfo "Windows Update Cache" "Cleaning Windows Update cache"

    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested

    if ($isDryRun) {
        Write-ProgressInfo "Service Control" "[DRY RUN] Would stop Windows Update service"
        Write-ProgressInfo "Service Control" "[DRY RUN] Would restart Windows Update service"
    } else {
        try {
            $wuService = Get-Service -Name wuauserv -ErrorAction SilentlyContinue
            $wuServiceRunning = $false
            if ($wuService -and $wuService.Status -eq 'Running') {
                $wuServiceRunning = $true
                Stop-Service -Name wuauserv -Force -ErrorAction SilentlyContinue
                Write-ProgressInfo "Service Control" "Stopped Windows Update service"
            }

            $updatePaths = @(
                "$env:WINDIR\SoftwareDistribution\Download\*",
                "$env:WINDIR\System32\catroot2\*"
            )

            foreach ($path in $updatePaths) {
                Remove-PathEnhanced -Path $path -Description "Windows Update cache"
            }

            if ($wuServiceRunning) {
                Start-Service -Name wuauserv -ErrorAction SilentlyContinue
                Write-ProgressInfo "Service Control" "Restarted Windows Update service"
            }
        }
        catch {
            Write-ErrorInfo "Failed to clean Windows Update cache: $($_.Exception.Message)"
        }
    }
}

function Clear-EventLogs {
    if (-not $CleanupConfig.CleanEventLogs) {
        Write-SkippedInfo "Event Logs Cleanup (disabled in config)"
        return
    }

    # Safety check for dangerous operation
    if (-not (Confirm-DangerousOperation -OperationName "CleanEventLogs" -Description "Clearing Windows Event Logs (loss of audit trail)" -RiskLevel "Medium")) {
        Write-SkippedInfo "Event Logs Cleanup - skipped by user choice"
        return
    }

    Write-ProgressInfo "Event Logs Cleanup" "Archiving and clearing Windows Event Logs"

    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested

    $eventLogs = @("Application", "System", "Setup")

    foreach ($logName in $eventLogs) {
        if ($isDryRun) {
            Write-SuccessInfo "[DRY RUN] Would archive and clear $logName event log"
        } else {
            try {
                $archivePath = "$env:TEMP\EventLogBackup_$(Get-Date -Format 'yyyyMMdd')"
                if (-not (Test-Path $archivePath)) {
                    New-Item -ItemType Directory -Path $archivePath -Force | Out-Null
                }
                
                $backupFile = Join-Path $archivePath "$logName`_$(Get-Date -Format 'yyyyMMdd').evtx"
                wevtutil export-log $logName $backupFile /overwrite:true 2>$null
                wevtutil clear-log $logName 2>$null
                Write-SuccessInfo "Archived and cleared $logName event log"
            }
            catch {
                Write-ErrorInfo "Failed to archive and clear $logName event log: $($_.Exception.Message)"
            }
        }
    }
}

# =============================================
# MISSING FUNCTION DEFINITIONS - ADDED BACK
# =============================================

function Clear-ErrorReports {
    if (-not $CleanupConfig.CleanErrorReports) {
        Write-SkippedInfo "Error Reports Cleanup (disabled in config)"
        return
    }

    Write-ProgressInfo "Error Reports Cleanup" "Cleaning error reports $(if ($CleanupConfig.CleanForAllUsers) {'for all users'} else {'for current user'})"

    $systemErrorPaths = @(
        "$env:PROGRAMDATA\Microsoft\Windows\WER\*",
        "$env:WINDIR\System32\WerFault.exe.ReportQueue\*"
    )

    foreach ($path in $systemErrorPaths) {
        Remove-PathEnhanced -Path $path -Description "system error reports"
    }

    if ($CleanupConfig.CleanForAllUsers) {
        $userProfiles = Get-ChildItem "$env:SYSTEMDRIVE\Users" -Directory -ErrorAction SilentlyContinue
        foreach ($profile in $userProfiles) {
            if ($profile.Name -in @('Public', 'Default', 'All Users')) { continue }
            $userErrorPath = "$($profile.FullName)\AppData\Local\Microsoft\Windows\WER\*"
            if (Test-Path (Split-Path $userErrorPath -Parent)) {
                Remove-PathEnhanced -Path $userErrorPath -Description "error reports for $($profile.Name)"
            }
        }
    } else {
        $userErrorPath = "$env:USERPROFILE\AppData\Local\Microsoft\Windows\WER\*"
        if (Test-Path (Split-Path $userErrorPath -Parent)) {
            Remove-PathEnhanced -Path $userErrorPath -Description "error reports for current user"
        }
    }
}

function Clear-CrashDumps {
    if (-not $CleanupConfig.CleanCrashDumps) {
        Write-SkippedInfo "Crash Dumps Cleanup (disabled in config)"
        return
    }

    Write-ProgressInfo "Crash Dumps Cleanup" "Cleaning crash dumps $(if ($CleanupConfig.CleanForAllUsers) {'for all users'} else {'for current user'})"

    $systemDumpPaths = @(
        "$env:WINDIR\Minidump\*",
        "$env:WINDIR\MEMORY.DMP"
    )

    foreach ($path in $systemDumpPaths) {
        Remove-PathEnhanced -Path $path -Description "system crash dumps"
    }

    if ($CleanupConfig.CleanForAllUsers) {
        $userProfiles = Get-ChildItem "$env:SYSTEMDRIVE\Users" -Directory -ErrorAction SilentlyContinue
        foreach ($profile in $userProfiles) {
            if ($profile.Name -in @('Public', 'Default', 'All Users')) { continue }
            $userDumpPath = "$($profile.FullName)\AppData\Local\CrashDumps\*"
            if (Test-Path (Split-Path $userDumpPath -Parent)) {
                Remove-PathEnhanced -Path $userDumpPath -Description "crash dumps for $($profile.Name)"
            }
        }
    } else {
        $userDumpPath = "$env:USERPROFILE\AppData\Local\CrashDumps\*"
        if (Test-Path (Split-Path $userDumpPath -Parent)) {
            Remove-PathEnhanced -Path $userDumpPath -Description "crash dumps for current user"
        }
    }
}

function Clear-IISLogs {
    if (-not $CleanupConfig.CleanIISLogs) {
        Write-SkippedInfo "IIS Logs Cleanup (disabled in config)"
        return
    }

    Write-ProgressInfo "IIS Logs Cleanup" "Cleaning IIS log files"

    $iisLogPaths = @(
        "$env:WINDIR\System32\LogFiles\W3SVC*\*.log",
        "$env:WINDIR\System32\LogFiles\HTTPERR\*.log"
    )

    $retentionDate = (Get-Date).AddDays(-$CleanupConfig.IISLogRetention)

    foreach ($pathPattern in $iisLogPaths) {
        $files = Get-ChildItem $pathPattern -ErrorAction SilentlyContinue | 
                 Where-Object { $_.LastWriteTime -lt $retentionDate }
        foreach ($file in $files) {
            Remove-PathEnhanced -Path $file.FullName -Description "old IIS log: $($file.Name)"
        }
    }
}

function Clear-AppCache {
    if (-not $CleanupConfig.CleanAppCache) {
        Write-SkippedInfo "Application Cache Cleanup (disabled in config)"
        return
    }

    Write-ProgressInfo "Application Cache Cleanup" "Cleaning application caches $(if ($CleanupConfig.CleanForAllUsers) {'for all users'} else {'for current user'})"

    $userProfiles = Get-UserProfiles
    foreach ($profile in $userProfiles) {
        $appCachePaths = @(
            "$($profile.FullName)\AppData\Local\Microsoft\Windows\AppCache\*",
            "$($profile.FullName)\AppData\Local\Packages\*\AC\*",
            "$($profile.FullName)\AppData\Local\ConnectedDevicesPlatform\*"
        )

        foreach ($path in $appCachePaths) {
            if (Test-Path (Split-Path $path -Parent)) {
                Remove-PathEnhanced -Path $path -Description "app cache for $($profile.Name)"
            }
        }
    }
}

function Clear-DeliveryOptimization {
    if (-not $CleanupConfig.CleanDeliveryOptimization) {
        Write-SkippedInfo "Delivery Optimization Cleanup (disabled in config)"
        return
    }

    Write-ProgressInfo "Delivery Optimization Cleanup" "Cleaning Windows Delivery Optimization cache"

    $doPaths = @(
        "$env:WINDIR\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\*",
        "$env:PROGRAMDATA\Microsoft\Windows\DeliveryOptimization\*"
    )

    foreach ($path in $doPaths) {
        Remove-PathEnhanced -Path $path -Description "Delivery Optimization cache"
    }
}

function Clear-SystemCache {
    Write-ProgressInfo "System Cache Cleanup" "Cleaning system caches"

    $cachePaths = @(
        "$env:WINDIR\Logs\*",
        "$env:WINDIR\System32\LogFiles\*",
        "$env:WINDIR\Temp\*"
    )

    foreach ($path in $cachePaths) {
        $parentPath = Split-Path $path -Parent
        Remove-PathEnhanced -Path $path -Description "system cache from $parentPath"
    }
}

function Start-ComponentCleanupTask {
    if (-not $CleanupConfig.RunComponentCleanupTask) {
        Write-SkippedInfo "Component Cleanup Task (disabled in config)"
        return
    }

    Write-ProgressInfo "Component Cleanup Task" "Starting Component Cleanup via Task Scheduler"
    
    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested
    
    if ($isDryRun) {
        Write-SuccessInfo "[DRY RUN] Would run: schtasks.exe /Run /TN \Microsoft\Windows\Servicing\StartComponentCleanup"
    } else {
        try {
            # FIXED: Use correct task name format without double backslashes
            $taskName = "\Microsoft\Windows\Servicing\StartComponentCleanup"
            Write-LogMessage "Attempting to run scheduled task: $taskName" -Level Debug
            
            # Method 1: Direct schtasks call
            $process = Start-Process -FilePath "schtasks.exe" -ArgumentList @("/Run", "/TN", $taskName) -Wait -PassThru -NoNewWindow
            
            if ($process.ExitCode -eq 0) {
                Write-SuccessInfo "Started Component Cleanup scheduled task"
            } else {
                Write-ErrorInfo "Failed to start Component Cleanup task - Exit code: $($process.ExitCode)"
                
                # Method 2: Alternative approach using different syntax
                Write-LogMessage "Trying alternative method..." -Level Debug
                $result = cmd.exe /c "schtasks /Run /TN `"$taskName`""
                
                if ($LASTEXITCODE -eq 0) {
                    Write-SuccessInfo "Started Component Cleanup scheduled task (alternative method)"
                } else {
                    Write-ErrorInfo "All methods failed to start Component Cleanup task"
                    Write-LogMessage "Task might not exist or require different permissions" -Level Warning
                }
            }
        }
        catch {
            Write-ErrorInfo "Failed to start Component Cleanup task - $($_.Exception.Message)"
        }
    }
}

function Invoke-ComponentStoreAnalysis {
    if (-not $CleanupConfig.AnalyzeComponentStore) {
        Write-SkippedInfo "Component Store Analysis (disabled in config)"
        return
    }

    Write-ProgressInfo "Component Store Analysis" "Analyzing Windows Component Store"
    
    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested
    
    if ($isDryRun) {
        Write-SuccessInfo "[DRY RUN] Would run: DISM.exe /online /Cleanup-image /AnalyzeComponentStore"
    } else {
        try {
            $analysis = dism.exe /online /Cleanup-image /AnalyzeComponentStore
            Write-SuccessInfo "Component store analysis completed"
            # Log analysis results
            $analysis | ForEach-Object { Write-LogMessage "DISM Analysis: $_" }
        }
        catch {
            Write-ErrorInfo "Component store analysis failed - $($_.Exception.Message)"
        }
    }
}

function Run-SystemFileChecker {
    if (-not $CleanupConfig.RunSFC) {
        Write-SkippedInfo "System File Checker (disabled in config)"
        return
    }

    Write-ProgressInfo "System File Checker" "Running SFC scan"

    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested

    if ($isDryRun) {
        Write-SuccessInfo "[DRY RUN] Would run SFC /scannow"
    } else {
        try {
            $result = sfc /scannow
            Write-SuccessInfo "System integrity check completed"
        }
        catch {
            Write-ErrorInfo "System File Checker failed: $($_.Exception.Message)"
        }
    }
}

function Optimize-ComponentStore {
    if (-not $CleanupConfig.OptimizeComponents) {
        Write-SkippedInfo "Component Store Optimization (disabled in config)"
        return
    }

    Write-ProgressInfo "Component Store Optimization" "Optimizing Windows Component Store"

    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested

    if ($isDryRun) {
        Write-SuccessInfo "[DRY RUN] Would run DISM component cleanup"
    } else {
        try {
            $result = dism /online /cleanup-image /startcomponentcleanup /quiet
            Write-SuccessInfo "Component store optimization completed"
        }
        catch {
            Write-ErrorInfo "Component store optimization failed: $($_.Exception.Message)"
        }
    }

    if ($CleanupConfig.CleanDISMLogs) {
        $dismLogPath = "$env:WINDIR\Logs\DISM\*"
        Remove-PathEnhanced -Path $dismLogPath -Description "DISM logs"
    }
}

function Invoke-DISMAdvancedCleanup {
    if (-not $CleanupConfig.RunDISMAdvanced) {
        Write-SkippedInfo "DISM Advanced Cleanup (disabled in config)"
        return
    }

    # Safety check for dangerous operation
    if (-not (Confirm-DangerousOperation -OperationName "RunDISMAdvanced" -Description "Advanced DISM operations (system component modification)" -RiskLevel "High")) {
        Write-SkippedInfo "DISM Advanced Cleanup - skipped by user choice"
        return
    }

    Write-ProgressInfo "DISM Advanced Cleanup" "Running advanced DISM cleanup operations"
    
    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested
    
    $dismCommands = @(
        @{ Command = "/online /Cleanup-Image /SPSuperseded"; Description = "Remove superseded components" },
        @{ Command = "/online /Cleanup-Image /StartComponentCleanup /ResetBase"; Description = "Component cleanup with reset base" }
    )
    
    foreach ($dismCmd in $dismCommands) {
        if ($isDryRun) {
            Write-SuccessInfo "[DRY RUN] Would run: DISM.exe $($dismCmd.Command)"
        } else {
            try {
                $null = dism.exe $dismCmd.Command.Split(' ') 2>&1
                Write-SuccessInfo "DISM: $($dismCmd.Description)"
            }
            catch {
                Write-ErrorInfo "DISM failed: $($dismCmd.Description) - $($_.Exception.Message)"
            }
        }
    }
}

function Clear-WindowsUpdateFull {
    if (-not $CleanupConfig.CleanWindowsUpdateFull) {
        Write-SkippedInfo "Windows Update Full Cleanup (disabled in config)"
        return
    }

    # Safety check for dangerous operation
    if (-not (Confirm-DangerousOperation -OperationName "CleanWindowsUpdateFull" -Description "Complete Windows Update cache removal (requires service restart)" -RiskLevel "High")) {
        Write-SkippedInfo "Windows Update Full Cleanup - skipped by user choice"
        return
    }

    Write-ProgressInfo "Windows Update Full Cleanup" "Performing full SoftwareDistribution cleanup"
    
    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested
    
    if ($isDryRun) {
        Write-ProgressInfo "Service Control" "[DRY RUN] Would stop Windows Update service for full cleanup"
        Write-SuccessInfo "[DRY RUN] Would remove entire SoftwareDistribution folder"
        Write-ProgressInfo "Service Control" "[DRY RUN] Would restart Windows Update service"
    } else {
        try {
            $wuService = Get-Service -Name wuauserv -ErrorAction SilentlyContinue
            $wuServiceRunning = $false
            if ($wuService -and $wuService.Status -eq 'Running') {
                $wuServiceRunning = $true
                Stop-Service -Name wuauserv -Force -ErrorAction SilentlyContinue
                Write-ProgressInfo "Service Control" "Stopped Windows Update service for full cleanup"
            }

            $softwareDistributionPath = "$env:WINDIR\SoftwareDistribution"
            if (Test-Path $softwareDistributionPath) {
                Remove-PathEnhanced -Path $softwareDistributionPath -Description "Windows Update SoftwareDistribution folder"
            }

            if ($wuServiceRunning) {
                Start-Service -Name wuauserv -ErrorAction SilentlyContinue
                Write-ProgressInfo "Service Control" "Restarted Windows Update service"
            }
        }
        catch {
            Write-ErrorInfo "Failed to perform full Windows Update cleanup: $($_.Exception.Message)"
        }
    }
}

function Clear-PatchCache {
    if (-not $CleanupConfig.CleanPatchCache) {
        Write-SkippedInfo "Patch Cache Cleanup (disabled in config)"
        return
    }

    # Safety check for dangerous operation
    if (-not (Confirm-DangerousOperation -OperationName "CleanPatchCache" -Description "Windows Installer patch cache removal" -RiskLevel "High")) {
        Write-SkippedInfo "Patch Cache Cleanup - skipped by user choice"
        return
    }

    Write-ProgressInfo "Patch Cache Cleanup" "Cleaning Windows Installer patch cache"
    
    # FIXED: Correct patch cache path
    $patchCachePaths = @(
        "$env:WINDIR\Installer\*.tmp",
        "$env:WINDIR\Installer\PatchCache\*"
    )
    
    foreach ($patchCachePath in $patchCachePaths) {
        Remove-PathEnhanced -Path $patchCachePath -Description "Windows Installer patch cache"
    }
}

# =============================================
# MAIN EXECUTION (ENHANCED FOR PS7+ WITH SAFETY)
# =============================================

function Start-WindowsCleanup {
    Update-ConfigurationFromParameters

    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested

    Show-SystemRequirements

    if (-not (Test-SystemRequirements)) {
        exit 1
    }

    Write-ProgressInfo "Windows Cleanup Started" "Beginning comprehensive system cleanup"
    Write-LogMessage "PowerShell Version: $($PSVersionTable.PSVersion)"
    Write-LogMessage "Platform: $($PSVersionTable.Platform)"
    Write-LogMessage "Log file: $LogPath"
    Write-LogMessage "User scope: $(if ($CleanupConfig.CleanForAllUsers) {'All Users'} else {'Current User Only'})"
    Write-LogMessage "Dry Run Mode: $(if ($isDryRun) {'ENABLED'} else {'DISABLED'})"
    Write-LogMessage "Safety Mode: $(if ($CleanupConfig.SafetyModeEnabled) {'ENABLED'} else {'DISABLED'})"
    Write-LogMessage "Force Mode: $(if ($Force -or $ForceShort) {'ENABLED'} else {'DISABLED'})"
    Write-LogMessage "Parallel Processing: $(if ($CleanupConfig.UseParallelProcessing) {'ENABLED'} else {'DISABLED'})"
    Write-LogMessage "Enhanced Telemetry: $(if ($CleanupConfig.EnableTelemetry) {'ENABLED'} else {'DISABLED'})"

    if ($isDryRun) {
        Write-LogMessage "DRY RUN MODE: No changes will be made to the system" -Level DryRun
    }

    # System Restore Point creation before cleanup
    if ($CleanupConfig.CreateRestorePointEnabled -and -not $isDryRun) {
        Write-SafetyInfo "System Restore Point creation is enabled"
        $restoreCreated = Start-SystemRestorePointCreation
        if ($restoreCreated) {
            if (-not (Confirm-RestorePointCreated)) {
                Write-LogMessage "Cleanup aborted by user after restore point creation" -Level Warning
                exit 0
            }
        } else {
            Write-LogMessage "Failed to create restore point, but continuing with cleanup" -Level Warning
        }
    }

    $browserProcesses = @("chrome", "msedge", "firefox", "opera", "yandex")
    Stop-ProcessSafely -ProcessNames $browserProcesses

    # Execute cleanup operations with safety checks
    Clear-TempFiles
    Clear-BrowserCaches
    Clear-RecycleBin
    Clear-WindowsUpdateCache
    Clear-EventLogs
    Clear-ErrorReports
    Clear-CrashDumps
    Clear-IISLogs
    Clear-AppCache
    Clear-DeliveryOptimization
    Clear-SystemCache
    
    # Enhanced cleanup operations with additional safety
    Start-ComponentCleanupTask
    Invoke-ComponentStoreAnalysis
    Invoke-DISMAdvancedCleanup
    Clear-WindowsUpdateFull
    Clear-PatchCache
    
    # System optimization (generally safe)
    Run-SystemFileChecker
    Optimize-ComponentStore

    # System Image creation after cleanup
    if ($CleanupConfig.CreateSystemImageEnabled -and -not $isDryRun) {
        Write-SafetyInfo "System Image Backup creation is enabled"
        Start-SystemImageBackup
    }

    # Enhanced reporting for PS7+
    $duration = (Get-Date) - $Global:StartTime
    $successIcon = [char]::ConvertFromUtf32(0x1F389)

    Write-LogMessage ""
    Write-LogMessage "=== CLEANUP SUMMARY ===" -Level Info
    Write-LogMessage "Operations Completed: $($Global:CleanupStatistics.OperationsCompleted)"
    Write-LogMessage "Operations Failed: $($Global:CleanupStatistics.OperationsFailed)"
    Write-LogMessage "Operations Skipped: $($Global:CleanupStatistics.OperationsSkipped)"
    
    if ($isDryRun) {
        Write-LogMessage ($successIcon + " DRY RUN COMPLETED SUCCESSFULLY") -Level DryRun
        Write-LogMessage "Simulated files deleted: $Global:TotalFilesDeleted"
        Write-LogMessage "Simulated space freed: $(Format-FileSize $Global:TotalSpaceFreed)"
    } else {
        Write-LogMessage ($successIcon + " CLEANUP COMPLETED SUCCESSFULLY") -Level Success
        Write-LogMessage "Total files deleted: $Global:TotalFilesDeleted"
        Write-LogMessage "Total space freed: $(Format-FileSize $Global:TotalSpaceFreed)"
    }
    Write-LogMessage "Duration: $($duration.TotalMinutes.ToString('F2')) minutes"
    Write-LogMessage "Log saved to: $LogPath"
    
    # Additional telemetry for PS7+
    if ($CleanupConfig.EnableTelemetry -and $Script:IsPS7Plus) {
        Write-LogMessage "Performance: $([math]::Round($Global:CleanupStatistics.OperationsCompleted / $duration.TotalSeconds, 2)) ops/sec"
    }
}

function Show-UsageHelp {
    Write-Host @"
Windows System Cleanup Script v5.2
Enhanced for PowerShell 7+ with backward compatibility for PowerShell 5+
Includes safety features and system backup options

USAGE:
    .\Cleanup-Windows.ps1 [OPTIONS]

SAFETY AND BACKUP OPTIONS:
    -EnableSafetyMode, -safe    Enable safety confirmations for dangerous operations
    -NoSafetyMode, -nsafe      Disable safety confirmations (not recommended)
    -CreateRestorePoint, -rp   Launch System Restore Point creation before cleanup
    -NoCreateRestorePoint, -nrp Skip System Restore Point creation
    -CreateSystemImage, -img   Launch System Image Backup creation after cleanup
    -NoCreateSystemImage, -nimg Skip System Image Backup creation
    -Force, -f                 Force mode - bypass all safety confirmations

EXAMPLES:
    # Full cleanup with safety features enabled
    .\Cleanup-Windows.ps1 -EnableSafetyMode -CreateRestorePoint

    # Force cleanup without any confirmations
    .\Cleanup-Windows.ps1 -Force

    # Dry run with restore point creation
    .\Cleanup-Windows.ps1 -DryRun -CreateRestorePoint

    # Cleanup with system image backup
    .\Cleanup-Windows.ps1 -CreateRestorePoint -CreateSystemImage

DANGEROUS OPERATIONS (require confirmation in Safety Mode):
    - Complete Windows Update cache removal
    - Recycle Bin permanent deletion
    - Windows Event Logs clearing
    - Advanced DISM operations
    - Windows Installer patch cache removal

POWERSHELL 7+ ENHANCEMENTS:
    - Parallel processing for faster cleanup
    - Enhanced telemetry and performance metrics
    - Improved error handling and logging
    - Better color support in console
    - Modern CIM commands instead of WMI

COMPATIBILITY:
    - Fully compatible with PowerShell 5.1 and Windows 10/11
    - Enhanced features automatically enabled in PowerShell 7+
    - Graceful degradation for older PowerShell versions
"@
}

# Execute main function
if ($MyInvocation.InvocationName -ne ".") {
    if ($Help -or $helpRequested) {
        Show-UsageHelp
        exit 0
    }
    
    Start-WindowsCleanup
}
