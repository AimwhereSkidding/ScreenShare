@echo off
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
setlocal enabledelayedexpansion                                      
color b 
                                                             
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq dps" /fi "services eq dps" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
powershell -Command "$result = 'Process Not Running: DPS'; Write-Host $result -ForegroundColor Red"
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: DPS ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq Sysmain" /fi "services eq Sysmain" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: Sysmain'; Write-Host $result -Foreground Red
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: Sysmain ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq PcaSvc" /fi "services eq PcaSvc" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: PcaSvc'; Write-Host $result -Foreground Red
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: PcaSvc ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq Dusmsvc" /fi "services eq Dusmsvc" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: Dusmsvc'; Write-Host $result -Foreground Red
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: Dusmsvc ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq Eventlog" /fi "services eq Eventlog" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: Eventlog'; Write-Host $result -Foreground Red
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: Eventlog ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq Appinfo" /fi "services eq Appinfo" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: Appinfo'; Write-Host $result -Foreground Red
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: Appinfo ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq DcomLaunch" /fi "services eq DcomLaunch" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: BAM'; Write-Host $result -Foreground Red
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: BAM ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq DiagTrack" /fi "services eq DiagTrack" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: DiagTrack'; Write-Host $result -Foreground Red
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: DiagTrack ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

:: Windows Defender Antivirus
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq WinDefend" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: WinDefend'; Write-Host $result -Foreground Red"
) else (
    powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: WinDefend ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

:: File Services (e.g., Server service)
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq lanmanserver" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: lanmanserver'; Write-Host $result -Foreground Red"
) else (
    powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: lanmanserver ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

:: Windows Update (Wuauserv service)
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq wuauserv" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: wuauserv'; Write-Host $result -Foreground Red"
) else (
    powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: wuauserv ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

:: Task Scheduler (Schedule service)
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq schedule" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: schedule'; Write-Host $result -Foreground Red"
) else (
    powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: schedule ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

:: Windows Management Instrumentation (WMI) service
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq winmgmt" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: winmgmt'; Write-Host $result -Foreground Red"
) else (
    powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: winmgmt ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

:: Distributed Link Tracking Client (trkWks service)
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq trkwks" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: trkwks'; Write-Host $result -Foreground Red"
) else (
    powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: trkwks ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

:: Volume Shadow Copy (vssvc)
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq vssvc" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: vssvc'; Write-Host $result -Foreground Red"
) else (
    powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: vssvc ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

:: Windows Search (WSearch)
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq WSearch" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: WSearch'; Write-Host $result -Foreground Red"
) else (
    powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: WSearch ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

:: Remote Desktop Services (TermService)
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq TermService" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: TermService'; Write-Host $result -Foreground Red"
) else (
    powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: TermService ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

:: Background Intelligent Transfer Service (BITS)
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq BITS" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: BITS'; Write-Host $result -Foreground Red"
) else (
    powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: BITS ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

:: Distributed File System (dfs)
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq dfs" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: dfs'; Write-Host $result -Foreground Red"
) else (
    powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: dfs ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

:: Security Accounts Manager (SamSs)
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq SamSs" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: SamSs'; Write-Host $result -Foreground Red"
) else (
    powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: SamSs ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

:: Remote Procedure Call (rpcss)
for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq rpcss" ^| findstr /i "svchost.exe"') do set pid=%%a
if not defined pid (
    powershell -Command "$result = 'Process Not Running: rpcss'; Write-Host $result -Foreground Red"
) else (
    powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: rpcss ' + ' Start Time: ' + $process.StartTime; Write-Host $result -Foreground Green}"
)
set pid=

for /f "tokens=4,5" %%i in ('systeminfo 2^>nul ^| find "System Boot Time"') do echo PC Started: %%i %%j
powershell -Command Write-Host Made by Azik -Foreground DarkYellow
powershell -Command Write-Host Improved  by Aimwhere -Foreground DarkYellow
pause>nul