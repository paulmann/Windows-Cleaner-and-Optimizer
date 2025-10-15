<#
/**
 * Windows System Cleanup Script with Full Configuration Support
 * 
 * @author Mikhail Deynekin
 * @email mid1977@gmail.com
 * @website https://deynekin.com
 * @version 4.4
 * @date October 2025
 */
#>

[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Position=0)]
    [string]$LogPath = "$env:TEMP\WindowsCleanup.log",
    
    [int]$DaysOld = 30,
    [switch]$DryRun,
    
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

    # Help parameter
    [switch]$Help
)

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
        '-?' { $helpRequested = $true }
    }
}

if ($helpRequested) { $Help = $true }
if ($dryRunRequested) { $DryRun = $true }

# FIX: Явно устанавливаем WhatIfPreference только при активации DryRun
if ($DryRun -or $DryRunShort -or $dryRunRequested) {
    $script:WhatIfPreference = $true
    $Global:WhatIfPreference = $true
    Write-Host "DRY RUN MODE: No changes will be made to the system" -ForegroundColor Yellow
} else {
    # ВАЖНО: Явно сбрасываем WhatIfPreference если DryRun не активирован
    $script:WhatIfPreference = $false
    $Global:WhatIfPreference = $false
}

# Fix log path if it was set incorrectly
if ($LogPath -eq '--DryRun' -or $LogPath -eq '--dryrun' -or $LogPath -eq '--dry-run' -or 
    $LogPath -eq '--Help' -or $LogPath -eq '--help') {
    $LogPath = "$env:TEMP\WindowsCleanup.log"
}

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

}

# Global variables
$Global:TotalFilesDeleted = 0
$Global:TotalSpaceFreed = 0
$Global:StartTime = Get-Date

# =============================================
# SYSTEM CHECK FUNCTIONS
# =============================================

function Test-AdminPrivileges {
    try {
        $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
        $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
        return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
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
        $os = Get-WmiObject -Class Win32_OperatingSystem
        $version = [version]$os.Version
        return $version.Major -ge 10
    }
    catch {
        return $false
    }
}

function Show-SystemRequirements {
    Write-Host "System Requirements Check:" -ForegroundColor Cyan
    Write-Host "  Administrator Privileges: $(if (Test-AdminPrivileges) {'PASS'} else {'FAIL'})" -ForegroundColor $(if (Test-AdminPrivileges) {'Green'} else {'Red'})
    Write-Host "  Execution Policy: $(if (Test-ExecutionPolicy) {'PASS'} else {'FAIL'})" -ForegroundColor $(if (Test-ExecutionPolicy) {'Green'} else {'Red'})
    Write-Host "  Windows Version: $(if (Test-WindowsVersion) {'PASS'} else {'FAIL'})" -ForegroundColor $(if (Test-WindowsVersion) {'Green'} else {'Red'})
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
    
    return $requirementsMet
}

# =============================================
# UTILITY FUNCTIONS
# =============================================

function Format-FileSize {
    param([long]$Size)

    if ($Size -gt 1GB) { return "{0:N2} GB" -f ($Size / 1GB) }
    elseif ($Size -gt 1MB) { return "{0:N2} MB" -f ($Size / 1MB) }
    elseif ($Size -gt 1KB) { return "{0:N2} KB" -f ($Size / 1KB) }
    else { return "$Size bytes" }
}

function Get-PathSize {
    param([string]$Path)

    if (-not (Test-Path $Path)) { return 0 }

    $totalSize = 0
    if (Test-Path $Path -PathType Container) {
        $items = Get-ChildItem $Path -Recurse -Force -ErrorAction SilentlyContinue
        foreach ($item in $items) {
            if (-not $item.PSIsContainer) {
                $totalSize += $item.Length
            }
        }
    } else {
        $file = Get-Item $Path -ErrorAction SilentlyContinue
        if ($file) { $totalSize = $file.Length }
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

    switch ($Level) {
        "Error" { Write-Host $logMessage -ForegroundColor Red }
        "Warning" { Write-Host $logMessage -ForegroundColor Yellow }
        "Success" { Write-Host $logMessage -ForegroundColor Green }
        "DryRun" { Write-Host $logMessage -ForegroundColor Cyan }
        default { Write-Host $logMessage }
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
    }
}

function Write-ErrorInfo {
    param([string]$Message)

    $icon = [char]::ConvertFromUtf32(0x274C)
    Write-LogMessage ($icon + " " + $Message) -Level Error
}

function Write-SkippedInfo {
    param([string]$Message)

    $icon = [char]::ConvertFromUtf32(0x23ED)
    Write-LogMessage ($icon + " SKIPPED: " + $Message) -Level Warning
}

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
            Remove-Item $Path -Recurse -Force -ErrorAction SilentlyContinue
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
                $processes | Stop-Process -Force -ErrorAction SilentlyContinue
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
# CLEANUP FUNCTIONS
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
    Write-ProgressInfo "Browser Cache Cleanup" "Cleaning browser caches $(if ($CleanupConfig.CleanForAllUsers) {'for all users'} else {'for current user'})"

    $userProfiles = Get-UserProfiles
    $browserProcesses = @("chrome", "msedge", "firefox", "opera", "yandex")

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
            $shell = New-Object -ComObject Shell.Application
            $items = $shell.NameSpace(0xA).Items()
            $itemCount = $items.Count
            foreach ($item in $items) {
                Remove-Item $item.Path -Recurse -Force -ErrorAction SilentlyContinue
            }
            Write-SuccessInfo "Cleaned Recycle Bin for current user - $itemCount items removed"
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
}

function Clear-EventLogs {
    if (-not $CleanupConfig.CleanEventLogs) {
        Write-SkippedInfo "Event Logs Cleanup (disabled in config)"
        return
    }

    Write-ProgressInfo "Event Logs Cleanup" "Archiving and clearing Windows Event Logs"


    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested

    $eventLogs = @("Application", "System", "Setup")

    foreach ($logName in $eventLogs) {
        if ($isDryRun) {
            Write-SuccessInfo "[DRY RUN] Would archive and clear $logName event log"
        } else {
            $archivePath = "$env:TEMP\EventLogBackup_$(Get-Date -Format 'yyyyMMdd')"
            if (-not (Test-Path $archivePath)) {
                New-Item -ItemType Directory -Path $archivePath -Force | Out-Null
            }
            
            $backupFile = Join-Path $archivePath "$logName`_$(Get-Date -Format 'yyyyMMdd').evtx"
            wevtutil export-log $logName $backupFile /overwrite:true 2>$null
            wevtutil clear-log $logName 2>$null
            Write-SuccessInfo "Archived and cleared $logName event log"
        }
    }
}

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
        $null = sfc /scannow
        Write-SuccessInfo "System integrity check completed"
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
        $null = dism /online /cleanup-image /startcomponentcleanup /quiet
        Write-SuccessInfo "Component store optimization completed"
    }

    if ($CleanupConfig.CleanDISMLogs) {
        $dismLogPath = "$env:WINDIR\Logs\DISM\*"
        Remove-PathEnhanced -Path $dismLogPath -Description "DISM logs"
    }
}


# =============================================
# ENHANCED COMPONENT CLEANUP FUNCTIONS
# =============================================

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
            # Правильный вызов schtasks с экранированием путей
            $taskName = "\\Microsoft\\Windows\\Servicing\\StartComponentCleanup"
            $result = schtasks.exe /Run /TN $taskName
            if ($LASTEXITCODE -eq 0) {
                Write-SuccessInfo "Started Component Cleanup scheduled task"
            } else {
                Write-ErrorInfo "Failed to start Component Cleanup task - Exit code: $LASTEXITCODE"
            }
        }
        catch {
            Write-ErrorInfo "Failed to start Component Cleanup task - $($_.Exception.Message)"
        }
    }
}

function Invoke-DISMAdvancedCleanup {
    if (-not $CleanupConfig.RunDISMAdvanced) {
        Write-SkippedInfo "DISM Advanced Cleanup (disabled in config)"
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

function Clear-WindowsUpdateFull {
    if (-not $CleanupConfig.CleanWindowsUpdateFull) {
        Write-SkippedInfo "Windows Update Full Cleanup (disabled in config)"
        return
    }

    Write-ProgressInfo "Windows Update Full Cleanup" "Performing full SoftwareDistribution cleanup"
    
    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested
    
    if ($isDryRun) {
        Write-ProgressInfo "Service Control" "[DRY RUN] Would stop Windows Update service for full cleanup"
        Write-SuccessInfo "[DRY RUN] Would remove entire SoftwareDistribution folder"
        Write-ProgressInfo "Service Control" "[DRY RUN] Would restart Windows Update service"
    } else {
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
}

function Clear-PatchCache {
    if (-not $CleanupConfig.CleanPatchCache) {
        Write-SkippedInfo "Patch Cache Cleanup (disabled in config)"
        return
    }

    Write-ProgressInfo "Patch Cache Cleanup" "Cleaning Windows Installer patch cache"
    
    $patchCachePath = "$env:WINDIR\Installer\$PatchCache$"
    Remove-PathEnhanced -Path $patchCachePath -Description "Windows Installer patch cache"
}



# =============================================
# MAIN EXECUTION
# =============================================

function Start-WindowsCleanup {
    Update-ConfigurationFromParameters


    $isDryRun = $DryRun -or $DryRunShort -or $dryRunRequested

    Show-SystemRequirements

    if (-not (Test-SystemRequirements)) {
        exit 1
    }

    Write-ProgressInfo "Windows Cleanup Started" "Beginning comprehensive system cleanup"
    Write-LogMessage "Log file: $LogPath"
    Write-LogMessage "User scope: $(if ($CleanupConfig.CleanForAllUsers) {'All Users'} else {'Current User Only'})"
    Write-LogMessage "Dry Run Mode: $(if ($isDryRun) {'ENABLED'} else {'DISABLED'})"

    if ($isDryRun) {
        Write-LogMessage "DRY RUN MODE: No changes will be made to the system" -Level DryRun
    }

    $browserProcesses = @("chrome", "msedge", "firefox", "opera", "yandex")
    Stop-ProcessSafely -ProcessNames $browserProcesses

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
    Start-ComponentCleanupTask
    Invoke-ComponentStoreAnalysis
    Invoke-DISMAdvancedCleanup
    Clear-WindowsUpdateFull
    Clear-PatchCache
    Run-SystemFileChecker
    Optimize-ComponentStore

    $duration = (Get-Date) - $Global:StartTime
    $successIcon = [char]::ConvertFromUtf32(0x1F389)

    Write-LogMessage ""
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
}

function Show-UsageHelp {
    Write-Host @"
Windows System Cleanup Script v4.4

USAGE:
    .\Cleanup-Windows.ps1 [OPTIONS]

EXAMPLES:
    # Full cleanup for all users
    .\Cleanup-Windows.ps1

    # Dry run for current user only
    .\Cleanup-Windows.ps1 -NoCleanForAllUsers -DryRun

    # GNU-style dry run
    .\Cleanup-Windows.ps1 --DryRun

    # Show help
    .\Cleanup-Windows.ps1 --Help

    # Clean only browser caches
    .\Cleanup-Windows.ps1 -NoCleanForAllUsers -CleanChrome -CleanEdge -NoCleanTempFiles -NoCleanRecycleBin
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