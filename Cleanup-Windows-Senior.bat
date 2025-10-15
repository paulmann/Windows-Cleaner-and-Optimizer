@echo off
setlocal enabledelayedexpansion

:: Windows System Cleanup Script (Batch Version)
:: Senior-level cleanup tool for Windows systems
:: Version: 2.1 (Batch) - Enhanced with additional cleanup commands
:: Author: Mikhail Deynekin
:: WWW: https://deynekin.com
:: Email: mid1977@gmail.com

set "SCRIPT_VERSION=2.1"
set "SCRIPT_NAME=Cleanup_Windows_Senior.bat"

:: Initialize configuration
set "CLEAN_FOR_ALL_USERS=1"
set "CLEAN_CHROME=1"
set "CLEAN_EDGE=1"
set "CLEAN_FIREFOX=1"
set "CLEAN_OPERA=1"
set "CLEAN_YANDEX=1"
set "CLEAN_TEMP_FILES=1"
set "CLEAN_PREFETCH=1"
set "CLEAN_RECYCLE_BIN=1"
set "CLEAN_THUMBNAILS=1"
set "CLEAN_WINDOWS_TEMP=1"
set "CLEAN_USER_TEMP=1"
set "CLEAN_EVENT_LOGS=1"
set "CLEAN_IIS_LOGS=1"
set "CLEAN_WINDOWS_UPDATE=1"
set "CLEAN_ERROR_REPORTS=1"
set "CLEAN_CRASH_DUMPS=1"
set "RUN_SFC=1"
set "OPTIMIZE_COMPONENTS=1"
set "CLEAN_DISM_LOGS=1"
set "CLEAN_APP_CACHE=1"
set "CLEAN_DOWNLOADS=0"
set "CLEAN_MEMORY_DUMPS=1"
set "CLEAN_DELIVERY_OPTIMIZATION=1"
set "CLEAN_BRANCH_CACHE=1"

:: New cleanup options
set "RUN_COMPONENT_CLEANUP_TASK=1"
set "CLEAN_COMPONENT_STORE_ADVANCED=1"
set "CLEAN_PATCH_CACHE=1"
set "ANALYZE_COMPONENT_STORE=1"

set "LOG_PATH=%TEMP%\WindowsCleanup.log"
set "DRY_RUN=0"
set "DAYS_OLD=30"

:: Parse command line arguments
:PARSE_ARGS
if "%~1"=="" goto :END_PARSE_ARGS

if /i "%~1"=="/?" goto :SHOW_HELP
if /i "%~1"=="/help" goto :SHOW_HELP
if /i "%~1"=="/h" goto :SHOW_HELP

if /i "%~1"=="/LogPath" (
    set "LOG_PATH=%~2"
    shift
    goto :PARSE_ARGS
)

if /i "%~1"=="/DaysOld" (
    set "DAYS_OLD=%~2"
    shift
    goto :PARSE_ARGS
)

if /i "%~1"=="/DryRun" (
    set "DRY_RUN=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/dr" (
    set "DRY_RUN=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/CleanForAllUsers" (
    set "CLEAN_FOR_ALL_USERS=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/au" (
    set "CLEAN_FOR_ALL_USERS=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/NoCleanForAllUsers" (
    set "CLEAN_FOR_ALL_USERS=0"
    goto :PARSE_ARGS
)
if /i "%~1"=="/nau" (
    set "CLEAN_FOR_ALL_USERS=0"
    goto :PARSE_ARGS
)

:: Browser parameters
if /i "%~1"=="/CleanChrome" (
    set "CLEAN_CHROME=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/ch" (
    set "CLEAN_CHROME=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/NoCleanChrome" (
    set "CLEAN_CHROME=0"
    goto :PARSE_ARGS
)
if /i "%~1"=="/nch" (
    set "CLEAN_CHROME=0"
    goto :PARSE_ARGS
)

if /i "%~1"=="/CleanEdge" (
    set "CLEAN_EDGE=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/ed" (
    set "CLEAN_EDGE=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/NoCleanEdge" (
    set "CLEAN_EDGE=0"
    goto :PARSE_ARGS
)
if /i "%~1"=="/ned" (
    set "CLEAN_EDGE=0"
    goto :PARSE_ARGS
)

if /i "%~1"=="/CleanFirefox" (
    set "CLEAN_FIREFOX=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/ff" (
    set "CLEAN_FIREFOX=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/NoCleanFirefox" (
    set "CLEAN_FIREFOX=0"
    goto :PARSE_ARGS
)
if /i "%~1"=="/nff" (
    set "CLEAN_FIREFOX=0"
    goto :PARSE_ARGS
)

if /i "%~1"=="/CleanOpera" (
    set "CLEAN_OPERA=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/op" (
    set "CLEAN_OPERA=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/NoCleanOpera" (
    set "CLEAN_OPERA=0"
    goto :PARSE_ARGS
)
if /i "%~1"=="/nop" (
    set "CLEAN_OPERA=0"
    goto :PARSE_ARGS
)

if /i "%~1"=="/CleanYandex" (
    set "CLEAN_YANDEX=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/ya" (
    set "CLEAN_YANDEX=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/NoCleanYandex" (
    set "CLEAN_YANDEX=0"
    goto :PARSE_ARGS
)
if /i "%~1"=="/nya" (
    set "CLEAN_YANDEX=0"
    goto :PARSE_ARGS
)

:: System cleanup parameters
if /i "%~1"=="/CleanTempFiles" (
    set "CLEAN_TEMP_FILES=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/tmp" (
    set "CLEAN_TEMP_FILES=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/NoCleanTempFiles" (
    set "CLEAN_TEMP_FILES=0"
    goto :PARSE_ARGS
)
if /i "%~1"=="/ntmp" (
    set "CLEAN_TEMP_FILES=0"
    goto :PARSE_ARGS
)

if /i "%~1"=="/CleanPrefetch" (
    set "CLEAN_PREFETCH=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/pf" (
    set "CLEAN_PREFETCH=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/NoCleanPrefetch" (
    set "CLEAN_PREFETCH=0"
    goto :PARSE_ARGS
)
if /i "%~1"=="/npf" (
    set "CLEAN_PREFETCH=0"
    goto :PARSE_ARGS
)

if /i "%~1"=="/CleanRecycleBin" (
    set "CLEAN_RECYCLE_BIN=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/rb" (
    set "CLEAN_RECYCLE_BIN=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/NoCleanRecycleBin" (
    set "CLEAN_RECYCLE_BIN=0"
    goto :PARSE_ARGS
)
if /i "%~1"=="/nrb" (
    set "CLEAN_RECYCLE_BIN=0"
    goto :PARSE_ARGS
)

:: New parameters for additional cleanup features
if /i "%~1"=="/RunComponentCleanupTask" (
    set "RUN_COMPONENT_CLEANUP_TASK=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/rcct" (
    set "RUN_COMPONENT_CLEANUP_TASK=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/NoRunComponentCleanupTask" (
    set "RUN_COMPONENT_CLEANUP_TASK=0"
    goto :PARSE_ARGS
)
if /i "%~1"=="/nrcct" (
    set "RUN_COMPONENT_CLEANUP_TASK=0"
    goto :PARSE_ARGS
)

if /i "%~1"=="/CleanComponentStoreAdvanced" (
    set "CLEAN_COMPONENT_STORE_ADVANCED=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/ccsa" (
    set "CLEAN_COMPONENT_STORE_ADVANCED=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/NoCleanComponentStoreAdvanced" (
    set "CLEAN_COMPONENT_STORE_ADVANCED=0"
    goto :PARSE_ARGS
)
if /i "%~1"=="/nccsa" (
    set "CLEAN_COMPONENT_STORE_ADVANCED=0"
    goto :PARSE_ARGS
)

if /i "%~1"=="/CleanPatchCache" (
    set "CLEAN_PATCH_CACHE=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/cpc" (
    set "CLEAN_PATCH_CACHE=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/NoCleanPatchCache" (
    set "CLEAN_PATCH_CACHE=0"
    goto :PARSE_ARGS
)
if /i "%~1"=="/ncpc" (
    set "CLEAN_PATCH_CACHE=0"
    goto :PARSE_ARGS
)

if /i "%~1"=="/AnalyzeComponentStore" (
    set "ANALYZE_COMPONENT_STORE=1"
    goto :PARSE_ARGS
)
if /i "%~1"=="/acs" (
    set "ANALYZE_COMPONENT_STORE=1"
    goto :PARSE_ARGS
)

if /i "%~1"=="/NoAnalyzeComponentStore" (
    set "ANALYZE_COMPONENT_STORE=0"
    goto :PARSE_ARGS
)
if /i "%~1"=="/nacs" (
    set "ANALYZE_COMPONENT_STORE=0"
    goto :PARSE_ARGS
)

shift
goto :PARSE_ARGS

:END_PARSE_ARGS

:: Initialize
set "START_TIME=%TIME%"
set "TOTAL_FILES_DELETED=0"
set "TOTAL_SPACE_FREED=0"

:: Check administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: This script requires Administrator privileges. Please run as Administrator.
    exit /b 1
)

:: Create log file
echo [%DATE% %TIME%] [Info] Windows Cleanup Started - Batch Version %SCRIPT_VERSION% > "%LOG_PATH%"
echo [%DATE% %TIME%] [Info] Log file: %LOG_PATH% >> "%LOG_PATH%"

:: Show header
echo ========================================
echo   Windows System Cleanup Script
echo   Batch Version %SCRIPT_VERSION%
echo ========================================
echo.

if "%DRY_RUN%"=="1" (
    echo [DRY RUN MODE] No changes will be made to the system
    echo [%DATE% %TIME%] [DryRun] DRY RUN MODE: No changes will be made >> "%LOG_PATH%"
)

:: Main execution
call :LOG_MESSAGE "Starting Windows cleanup process..."

:: Stop browser processes
call :STOP_BROWSER_PROCESSES

:: Execute cleanup operations
if "%CLEAN_TEMP_FILES%"=="1" call :CLEAN_TEMP_FILES
if "%CLEAN_CHROME%"=="1" call :CLEAN_BROWSER_CACHES
if "%CLEAN_RECYCLE_BIN%"=="1" call :CLEAN_RECYCLE_BIN
if "%CLEAN_WINDOWS_UPDATE%"=="1" call :CLEAN_WINDOWS_UPDATE_CACHE
if "%CLEAN_EVENT_LOGS%"=="1" call :CLEAN_EVENT_LOGS
if "%CLEAN_ERROR_REPORTS%"=="1" call :CLEAN_ERROR_REPORTS
if "%CLEAN_CRASH_DUMPS%"=="1" call :CLEAN_CRASH_DUMPS
if "%CLEAN_IIS_LOGS%"=="1" call :CLEAN_IIS_LOGS
if "%CLEAN_APP_CACHE%"=="1" call :CLEAN_APP_CACHE
if "%CLEAN_DELIVERY_OPTIMIZATION%"=="1" call :CLEAN_DELIVERY_OPTIMIZATION
if "%RUN_SFC%"=="1" call :RUN_SYSTEM_FILE_CHECKER
if "%OPTIMIZE_COMPONENTS%"=="1" call :OPTIMIZE_COMPONENT_STORE

:: New cleanup operations
if "%RUN_COMPONENT_CLEANUP_TASK%"=="1" call :RUN_COMPONENT_CLEANUP_TASK
if "%CLEAN_COMPONENT_STORE_ADVANCED%"=="1" call :CLEAN_COMPONENT_STORE_ADVANCED
if "%ANALYZE_COMPONENT_STORE%"=="1" call :ANALYZE_COMPONENT_STORE
if "%CLEAN_PATCH_CACHE%"=="1" call :CLEAN_PATCH_CACHE

:: Final statistics
call :SHOW_STATISTICS
goto :EOF

:: ========================================
:: FUNCTION: Log message
:: ========================================
:LOG_MESSAGE
echo [%DATE% %TIME%] [Info] %~1
echo [%DATE% %TIME%] [Info] %~1 >> "%LOG_PATH%"
goto :EOF

:LOG_SUCCESS
echo [%DATE% %TIME%] [Success] %~1
echo [%DATE% %TIME%] [Success] %~1 >> "%LOG_PATH%"
goto :EOF

:LOG_ERROR
echo [%DATE% %TIME%] [Error] %~1
echo [%DATE% %TIME%] [Error] %~1 >> "%LOG_PATH%"
goto :EOF

:LOG_WARNING
echo [%DATE% %TIME%] [Warning] %~1
echo [%DATE% %TIME%] [Warning] %~1 >> "%LOG_PATH%"
goto :EOF

:: ========================================
:: FUNCTION: Stop browser processes
:: ========================================
:STOP_BROWSER_PROCESSES
call :LOG_MESSAGE "Stopping browser processes..."

if "%DRY_RUN%"=="1" (
    call :LOG_MESSAGE "[DRY RUN] Would stop browser processes"
    goto :EOF
)

taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM firefox.exe >nul 2>&1
taskkill /F /IM opera.exe >nul 2>&1
taskkill /F /IM browser.exe >nul 2>&1

call :LOG_SUCCESS "Browser processes stopped"
goto :EOF

:: ========================================
:: FUNCTION: Clean temporary files
:: ========================================
:CLEAN_TEMP_FILES
call :LOG_MESSAGE "Cleaning temporary files..."

set "CLEAN_PATHS="

:: System temp
if "%CLEAN_WINDOWS_TEMP%"=="1" (
    if exist "%WINDIR%\Temp" set "CLEAN_PATHS=%CLEAN_PATHS% "%WINDIR%\Temp\*""
)

:: User temp files
if "%CLEAN_USER_TEMP%"=="1" (
    if exist "%USERPROFILE%\AppData\Local\Temp" set "CLEAN_PATHS=%CLEAN_PATHS% "%USERPROFILE%\AppData\Local\Temp\*""
    if exist "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files" set "CLEAN_PATHS=%CLEAN_PATHS% "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*""
)

:: Prefetch
if "%CLEAN_PREFETCH%"=="1" (
    if exist "%WINDIR%\Prefetch" set "CLEAN_PATHS=%CLEAN_PATHS% "%WINDIR%\Prefetch\*""
)

:: Thumbnails
if "%CLEAN_THUMBNAILS%"=="1" (
    if exist "%USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer" (
        set "CLEAN_PATHS=%CLEAN_PATHS% "%USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db""
    )
    if exist "%USERPROFILE%\AppData\Local\IconCache.db" (
        set "CLEAN_PATHS=%CLEAN_PATHS% "%USERPROFILE%\AppData\Local\IconCache.db""
    )
)

for %%P in (%CLEAN_PATHS%) do (
    if exist %%P (
        if "%DRY_RUN%"=="1" (
            call :LOG_MESSAGE "[DRY RUN] Would clean: %%P"
        ) else (
            del /Q /F /S %%P >nul 2>&1
            if !errorlevel! equ 0 (
                call :LOG_SUCCESS "Cleaned: %%P"
            ) else (
                call :LOG_WARNING "Failed to clean: %%P"
            )
        )
    )
)

goto :EOF

:: ========================================
:: FUNCTION: Clean browser caches
:: ========================================
:CLEAN_BROWSER_CACHES
call :LOG_MESSAGE "Cleaning browser caches..."

:: Chrome
if "%CLEAN_CHROME%"=="1" (
    if exist "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache" (
        if "%DRY_RUN%"=="1" (
            call :LOG_MESSAGE "[DRY RUN] Would clean Chrome cache"
        ) else (
            rmdir /Q /S "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache" >nul 2>&1
            call :LOG_SUCCESS "Chrome cache cleaned"
        )
    )
)

:: Edge
if "%CLEAN_EDGE%"=="1" (
    if exist "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Cache" (
        if "%DRY_RUN%"=="1" (
            call :LOG_MESSAGE "[DRY RUN] Would clean Edge cache"
        ) else (
            rmdir /Q /S "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1
            call :LOG_SUCCESS "Edge cache cleaned"
        )
    )
)

:: Firefox
if "%CLEAN_FIREFOX%"=="1" (
    if exist "%USERPROFILE%\AppData\Local\Mozilla\Firefox\Profiles" (
        if "%DRY_RUN%"=="1" (
            call :LOG_MESSAGE "[DRY RUN] Would clean Firefox cache"
        ) else (
            for /d %%D in ("%USERPROFILE%\AppData\Local\Mozilla\Firefox\Profiles\*") do (
                if exist "%%D\cache2" rmdir /Q /S "%%D\cache2" >nul 2>&1
                if exist "%%D\thumbnails" rmdir /Q /S "%%D\thumbnails" >nul 2>&1
            )
            call :LOG_SUCCESS "Firefox cache cleaned"
        )
    )
)

:: Opera
if "%CLEAN_OPERA%"=="1" (
    if exist "%USERPROFILE%\AppData\Roaming\Opera Software\Opera Stable\Cache" (
        if "%DRY_RUN%"=="1" (
            call :LOG_MESSAGE "[DRY RUN] Would clean Opera cache"
        ) else (
            rmdir /Q /S "%USERPROFILE%\AppData\Roaming\Opera Software\Opera Stable\Cache" >nul 2>&1
            call :LOG_SUCCESS "Opera cache cleaned"
        )
    )
)

:: Yandex
if "%CLEAN_YANDEX%"=="1" (
    if exist "%USERPROFILE%\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cache" (
        if "%DRY_RUN%"=="1" (
            call :LOG_MESSAGE "[DRY RUN] Would clean Yandex cache"
        ) else (
            rmdir /Q /S "%USERPROFILE%\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cache" >nul 2>&1
            call :LOG_SUCCESS "Yandex cache cleaned"
        )
    )
)

goto :EOF

:: ========================================
:: FUNCTION: Clean recycle bin
:: ========================================
:CLEAN_RECYCLE_BIN
call :LOG_MESSAGE "Cleaning recycle bin..."

if "%DRY_RUN%"=="1" (
    call :LOG_MESSAGE "[DRY RUN] Would clean recycle bin"
    goto :EOF
)

:: Clean current user's recycle bin using PowerShell
powershell -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" >nul 2>&1

:: Also clean system recycle bin folder
if exist "C:\$Recycle.Bin" (
    for /d %%D in ("C:\$Recycle.Bin\*") do (
        rmdir /Q /S "%%D" >nul 2>&1
    )
)

call :LOG_SUCCESS "Recycle bin cleaned"
goto :EOF

:: ========================================
:: FUNCTION: Clean Windows Update cache
:: ========================================
:CLEAN_WINDOWS_UPDATE_CACHE
call :LOG_MESSAGE "Cleaning Windows Update cache..."

if "%DRY_RUN%"=="1" (
    call :LOG_MESSAGE "[DRY RUN] Would clean Windows Update cache and SoftwareDistribution folder"
    goto :EOF
)

:: Stop Windows Update services
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
net stop cryptsvc >nul 2>&1

:: Clean update cache using multiple methods
if exist "%WINDIR%\SoftwareDistribution" (
    call :LOG_MESSAGE "Cleaning entire SoftwareDistribution folder..."
    rmdir /Q /S "%WINDIR%\SoftwareDistribution" >nul 2>&1
)

if exist "%WINDIR%\System32\catroot2" (
    rmdir /Q /S "%WINDIR%\System32\catroot2" >nul 2>&1
)

:: Restart Windows Update services
net start cryptsvc >nul 2>&1
net start bits >nul 2>&1
net start wuauserv >nul 2>&1

call :LOG_SUCCESS "Windows Update cache and SoftwareDistribution folder cleaned"
goto :EOF

:: ========================================
:: FUNCTION: Clean event logs
:: ========================================
:CLEAN_EVENT_LOGS
call :LOG_MESSAGE "Cleaning event logs..."

if "%DRY_RUN%"=="1" (
    call :LOG_MESSAGE "[DRY RUN] Would clean event logs"
    goto :EOF
)

for %%L in ("Application" "System" "Setup") do (
    wevtutil clear-log %%L >nul 2>&1
)

call :LOG_SUCCESS "Event logs cleaned"
goto :EOF

:: ========================================
:: FUNCTION: Clean error reports
:: ========================================
:CLEAN_ERROR_REPORTS
call :LOG_MESSAGE "Cleaning error reports..."

set "ERROR_PATHS="
set "ERROR_PATHS=%ERROR_PATHS% "%ProgramData%\Microsoft\Windows\WER\*""
set "ERROR_PATHS=%ERROR_PATHS% "%WINDIR%\System32\WerFault.exe.ReportQueue\*""
set "ERROR_PATHS=%ERROR_PATHS% "%USERPROFILE%\AppData\Local\Microsoft\Windows\WER\*""

for %%P in (%ERROR_PATHS%) do (
    if exist %%P (
        if "%DRY_RUN%"=="1" (
            call :LOG_MESSAGE "[DRY RUN] Would clean error reports: %%P"
        ) else (
            rmdir /Q /S %%P >nul 2>&1
        )
    )
)

if "%DRY_RUN%" neq "1" call :LOG_SUCCESS "Error reports cleaned"
goto :EOF

:: ========================================
:: FUNCTION: Clean crash dumps
:: ========================================
:CLEAN_CRASH_DUMPS
call :LOG_MESSAGE "Cleaning crash dumps..."

set "DUMP_PATHS="
set "DUMP_PATHS=%DUMP_PATHS% "%WINDIR%\Minidump\*""
set "DUMP_PATHS=%DUMP_PATHS% "%WINDIR%\MEMORY.DMP""
set "DUMP_PATHS=%DUMP_PATHS% "%USERPROFILE%\AppData\Local\CrashDumps\*""

for %%P in (%DUMP_PATHS%) do (
    if exist %%P (
        if "%DRY_RUN%"=="1" (
            call :LOG_MESSAGE "[DRY RUN] Would clean crash dumps: %%P"
        ) else (
            del /Q /F /S %%P >nul 2>&1
        )
    )
)

if "%DRY_RUN%" neq "1" call :LOG_SUCCESS "Crash dumps cleaned"
goto :EOF

:: ========================================
:: FUNCTION: Clean IIS logs
:: ========================================
:CLEAN_IIS_LOGS
call :LOG_MESSAGE "Cleaning IIS logs..."

if not exist "%WINDIR%\System32\LogFiles" goto :EOF

for /d %%D in ("%WINDIR%\System32\LogFiles\W3SVC*") do (
    if exist "%%D\*.log" (
        if "%DRY_RUN%"=="1" (
            call :LOG_MESSAGE "[DRY RUN] Would clean IIS logs: %%D"
        ) else (
            del /Q /F "%%D\*.log" >nul 2>&1
        )
    )
)

if "%DRY_RUN%" neq "1" call :LOG_SUCCESS "IIS logs cleaned"
goto :EOF

:: ========================================
:: FUNCTION: Clean application cache
:: ========================================
:CLEAN_APP_CACHE
call :LOG_MESSAGE "Cleaning application cache..."

set "APP_CACHE_PATHS="
set "APP_CACHE_PATHS=%APP_CACHE_PATHS% "%USERPROFILE%\AppData\Local\Microsoft\Windows\AppCache\*""
set "APP_CACHE_PATHS=%APP_CACHE_PATHS% "%USERPROFILE%\AppData\Local\ConnectedDevicesPlatform\*""

for %%P in (%APP_CACHE_PATHS%) do (
    if exist %%P (
        if "%DRY_RUN%"=="1" (
            call :LOG_MESSAGE "[DRY RUN] Would clean app cache: %%P"
        ) else (
            rmdir /Q /S %%P >nul 2>&1
        )
    )
)

:: Clean UWP app cache
if exist "%USERPROFILE%\AppData\Local\Packages" (
    if "%DRY_RUN%"=="1" (
        call :LOG_MESSAGE "[DRY RUN] Would clean UWP app cache"
    ) else (
        for /d %%D in ("%USERPROFILE%\AppData\Local\Packages\*") do (
            if exist "%%D\AC" rmdir /Q /S "%%D\AC" >nul 2>&1
        )
    )
)

if "%DRY_RUN%" neq "1" call :LOG_SUCCESS "Application cache cleaned"
goto :EOF

:: ========================================
:: FUNCTION: Clean delivery optimization
:: ========================================
:CLEAN_DELIVERY_OPTIMIZATION
call :LOG_MESSAGE "Cleaning delivery optimization cache..."

set "DO_PATHS="
set "DO_PATHS=%DO_PATHS% "%WINDIR%\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\*""
set "DO_PATHS=%DO_PATHS% "%ProgramData%\Microsoft\Windows\DeliveryOptimization\*""

for %%P in (%DO_PATHS%) do (
    if exist %%P (
        if "%DRY_RUN%"=="1" (
            call :LOG_MESSAGE "[DRY RUN] Would clean delivery optimization: %%P"
        ) else (
            rmdir /Q /S %%P >nul 2>&1
        )
    )
)

if "%DRY_RUN%" neq "1" call :LOG_SUCCESS "Delivery optimization cache cleaned"
goto :EOF

:: ========================================
:: FUNCTION: Run System File Checker
:: ========================================
:RUN_SYSTEM_FILE_CHECKER
call :LOG_MESSAGE "Running System File Checker..."

if "%DRY_RUN%"=="1" (
    call :LOG_MESSAGE "[DRY RUN] Would run SFC /scannow"
    goto :EOF
)

sfc /scannow >nul 2>&1
call :LOG_SUCCESS "System File Checker completed"
goto :EOF

:: ========================================
:: FUNCTION: Optimize component store
:: ========================================
:OPTIMIZE_COMPONENT_STORE
call :LOG_MESSAGE "Optimizing component store..."

if "%DRY_RUN%"=="1" (
    call :LOG_MESSAGE "[DRY RUN] Would run DISM cleanup and analyze component store"
    goto :EOF
)

:: Run standard DISM cleanup
dism /Online /Cleanup-Image /StartComponentCleanup >nul 2>&1

:: Clean DISM logs
if "%CLEAN_DISM_LOGS%"=="1" (
    if exist "%WINDIR%\Logs\DISM" (
        rmdir /Q /S "%WINDIR%\Logs\DISM" >nul 2>&1
    )
)

call :LOG_SUCCESS "Component store optimization completed"
goto :EOF

:: ========================================
:: FUNCTION: Run Component Cleanup Task
:: ========================================
:RUN_COMPONENT_CLEANUP_TASK
call :LOG_MESSAGE "Running Component Cleanup scheduled task..."

if "%DRY_RUN%"=="1" (
    call :LOG_MESSAGE "[DRY RUN] Would run: schtasks.exe /Run /TN "\Microsoft\Windows\Servicing\StartComponentCleanup""
    goto :EOF
)

schtasks.exe /Run /TN "\Microsoft\Windows\Servicing\StartComponentCleanup" >nul 2>&1
if !errorlevel! equ 0 (
    call :LOG_SUCCESS "Component Cleanup task started successfully"
) else (
    call :LOG_WARNING "Failed to run Component Cleanup task (may not exist on this system)"
)
goto :EOF

:: ========================================
:: FUNCTION: Advanced Component Store Cleanup
:: ========================================
:CLEAN_COMPONENT_STORE_ADVANCED
call :LOG_MESSAGE "Performing advanced Component Store cleanup..."

if "%DRY_RUN%"=="1" (
    call :LOG_MESSAGE "[DRY RUN] Would run: Dism.exe /online /Cleanup-Image /StartComponentCleanup"
    call :LOG_MESSAGE "[DRY RUN] Would run: Dism.exe /online /Cleanup-Image /SPSuperseded"
    call :LOG_MESSAGE "[DRY RUN] Would run: Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase"
    goto :EOF
)

call :LOG_MESSAGE "Running: Dism.exe /online /Cleanup-Image /StartComponentCleanup"
Dism.exe /online /Cleanup-Image /StartComponentCleanup >nul 2>&1
if !errorlevel! equ 0 (
    call :LOG_SUCCESS "Component Store cleanup completed"
) else (
    call :LOG_WARNING "Component Store cleanup completed with warnings or errors"
)

call :LOG_MESSAGE "Running: Dism.exe /online /Cleanup-Image /SPSuperseded"
Dism.exe /online /Cleanup-Image /SPSuperseded >nul 2>&1
if !errorlevel! equ 0 (
    call :LOG_SUCCESS "Superseded components cleanup completed"
) else (
    call :LOG_WARNING "Superseded components cleanup may not be applicable"
)

call :LOG_MESSAGE "Running: Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase"
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1
if !errorlevel! equ 0 (
    call :LOG_SUCCESS "Component Store reset base completed"
) else (
    call :LOG_WARNING "Component Store reset base completed with warnings or errors"
)

goto :EOF

:: ========================================
:: FUNCTION: Analyze Component Store
:: ========================================
:ANALYZE_COMPONENT_STORE
call :LOG_MESSAGE "Analyzing Component Store..."

if "%DRY_RUN%"=="1" (
    call :LOG_MESSAGE "[DRY RUN] Would run: Dism.exe /online /Cleanup-image /AnalyzeComponentStore"
    goto :EOF
)

Dism.exe /online /Cleanup-image /AnalyzeComponentStore
if !errorlevel! equ 0 (
    call :LOG_SUCCESS "Component Store analysis completed"
) else (
    call :LOG_WARNING "Component Store analysis completed with warnings"
)
goto :EOF

:: ========================================
:: FUNCTION: Clean Patch Cache
:: ========================================
:CLEAN_PATCH_CACHE
call :LOG_MESSAGE "Cleaning patch cache..."

if "%DRY_RUN%"=="1" (
    call :LOG_MESSAGE "[DRY RUN] Would clean: %WINDIR%\Installer\$PatchCache$"
    goto :EOF
)

if exist "%WINDIR%\Installer\$PatchCache$" (
    rmdir /Q /S "%WINDIR%\Installer\$PatchCache$" >nul 2>&1
    if !errorlevel! equ 0 (
        call :LOG_SUCCESS "Patch cache cleaned successfully"
    ) else (
        call :LOG_WARNING "Failed to clean patch cache (may be in use)"
    )
) else (
    call :LOG_MESSAGE "Patch cache directory not found"
)
goto :EOF

:: ========================================
:: FUNCTION: Show statistics
:: ========================================
:SHOW_STATISTICS
set "END_TIME=%TIME%"

echo.
echo ========================================
echo           CLEANUP COMPLETED
echo ========================================

if "%DRY_RUN%"=="1" (
    echo [DRY RUN] No changes were made to the system
) else (
    echo Cleanup completed successfully!
)

echo Start Time: %START_TIME%
echo End Time:   %END_TIME%
echo Log File:   %LOG_PATH%
echo.

echo Configuration Summary:
echo   CleanForAllUsers:           %CLEAN_FOR_ALL_USERS%
echo   CleanChrome:                %CLEAN_CHROME%
echo   CleanEdge:                  %CLEAN_EDGE%
echo   CleanFirefox:               %CLEAN_FIREFOX%
echo   CleanOpera:                 %CLEAN_OPERA%
echo   CleanYandex:                %CLEAN_YANDEX%
echo   CleanTempFiles:             %CLEAN_TEMP_FILES%
echo   CleanPrefetch:              %CLEAN_PREFETCH%
echo   CleanRecycleBin:            %CLEAN_RECYCLE_BIN%
echo   CleanEventLogs:             %CLEAN_EVENT_LOGS%
echo   CleanWindowsUpdate:         %CLEAN_WINDOWS_UPDATE%
echo   RunSFC:                     %RUN_SFC%
echo   OptimizeComponents:         %OPTIMIZE_COMPONENTS%
echo   RunComponentCleanupTask:    %RUN_COMPONENT_CLEANUP_TASK%
echo   CleanComponentStoreAdvanced:%CLEAN_COMPONENT_STORE_ADVANCED%
echo   AnalyzeComponentStore:      %ANALYZE_COMPONENT_STORE%
echo   CleanPatchCache:            %CLEAN_PATCH_CACHE%

echo.
echo Check the log file for detailed information: %LOG_PATH%

:: Log completion
echo [%DATE% %TIME%] [Success] Cleanup completed successfully >> "%LOG_PATH%"
echo [%DATE% %TIME%] [Info] Start Time: %START_TIME% >> "%LOG_PATH%"
echo [%DATE% %TIME%] [Info] End Time: %END_TIME% >> "%LOG_PATH%"

goto :EOF

:: ========================================
:: FUNCTION: Show help
:: ========================================
:SHOW_HELP
echo.
echo %SCRIPT_NAME% - Windows System Cleanup Script v%SCRIPT_VERSION%
echo.
echo USAGE:
echo   %SCRIPT_NAME% [OPTIONS]
echo.
echo OPTIONS:
echo   /LogPath ^<path^>        Log file path ^(default: TEMP\WindowsCleanup.log^)
echo   /DaysOld ^<days^>        Age threshold for files ^(default: 30^)
echo   /DryRun, /dr            Dry run mode ^(no changes made^)
echo.
echo USER SCOPE:
echo   /CleanForAllUsers, /au   Clean for all users ^(default^)
echo   /NoCleanForAllUsers, /nau Clean only for current user
echo.
echo BROWSER CLEANUP:
echo   /CleanChrome, /ch        Clean Chrome cache
echo   /NoCleanChrome, /nch     Don't clean Chrome cache
echo   /CleanEdge, /ed          Clean Edge cache
echo   /NoCleanEdge, /ned       Don't clean Edge cache
echo   /CleanFirefox, /ff       Clean Firefox cache
echo   /NoCleanFirefox, /nff    Don't clean Firefox cache
echo   /CleanOpera, /op         Clean Opera cache
echo   /NoCleanOpera, /nop      Don't clean Opera cache
echo   /CleanYandex, /ya        Clean Yandex cache
echo   /NoCleanYandex, /nya     Don't clean Yandex cache
echo.
echo SYSTEM CLEANUP:
echo   /CleanTempFiles, /tmp    Clean temporary files
echo   /NoCleanTempFiles, /ntmp Don't clean temporary files
echo   /CleanPrefetch, /pf      Clean prefetch files
echo   /NoCleanPrefetch, /npf   Don't clean prefetch files
echo   /CleanRecycleBin, /rb    Clean recycle bin
echo   /NoCleanRecycleBin, /nrb Don't clean recycle bin
echo.
echo ADVANCED CLEANUP:
echo   /RunComponentCleanupTask, /rcct    Run Component Cleanup scheduled task
echo   /NoRunComponentCleanupTask, /nrcct Don't run Component Cleanup task
echo   /CleanComponentStoreAdvanced, /ccsa Advanced Component Store cleanup
echo   /NoCleanComponentStoreAdvanced, /nccsa Don't perform advanced cleanup
echo   /AnalyzeComponentStore, /acs      Analyze Component Store
echo   /NoAnalyzeComponentStore, /nacs    Don't analyze Component Store
echo   /CleanPatchCache, /cpc            Clean patch cache
echo   /NoCleanPatchCache, /ncpc         Don't clean patch cache
echo.
echo EXAMPLES:
echo   %SCRIPT_NAME%                          - Full cleanup with defaults
echo   %SCRIPT_NAME% /DryRun                  - Dry run ^(preview changes^)
echo   %SCRIPT_NAME% /NoCleanForAllUsers      - Clean current user only
echo   %SCRIPT_NAME% /ch /ed /nff             - Clean only Chrome and Edge
echo   %SCRIPT_NAME% /ccsa /cpc               - Advanced cleanup with patch cache
echo.
echo NOTE: This script requires Administrator privileges.
goto :EOF