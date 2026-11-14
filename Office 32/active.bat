@echo off
setlocal EnableExtensions
title Office OSPPREARM Utility

echo.
echo ============================================================
echo              OFFICE OSPPREARM UTILITY
echo ============================================================
echo.

:: ============================================================
:: 1. CHECK ADMINISTRATOR PERMISSION
:: ============================================================

net session >nul 2>&1

if %errorlevel% neq 0 (
    echo [INFO] Administrator permission required.
    echo [INFO] Requesting Administrator permission...
    echo.

    powershell.exe -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"

    exit /b
)

echo [OK] Administrator permission confirmed.
echo.

:: ============================================================
:: 2. FIND OSPPREARM.EXE
:: ============================================================

set "OSPPREARM="

echo [1] Searching for OSPPREARM.EXE...
echo.

:: ------------------------------------------------------------
:: Standard 64-bit Office path
:: ------------------------------------------------------------

if exist "%ProgramFiles%\Microsoft Office\Office16\OSPPREARM.exe" (
    set "OSPPREARM=%ProgramFiles%\Microsoft Office\Office16\OSPPREARM.exe"
    goto OSPP_FOUND
)

:: ------------------------------------------------------------
:: 32-bit Office on 64-bit Windows
:: ------------------------------------------------------------

if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\OSPPREARM.exe" (
    set "OSPPREARM=%ProgramFiles(x86)%\Microsoft Office\Office16\OSPPREARM.exe"
    goto OSPP_FOUND
)

:: ------------------------------------------------------------
:: Common Click-to-Run location
:: ------------------------------------------------------------

if exist "%ProgramFiles%\Microsoft Office\root\Office16\OSPPREARM.exe" (
    set "OSPPREARM=%ProgramFiles%\Microsoft Office\root\Office16\OSPPREARM.exe"
    goto OSPP_FOUND
)

if exist "%ProgramFiles(x86)%\Microsoft Office\root\Office16\OSPPREARM.exe" (
    set "OSPPREARM=%ProgramFiles(x86)%\Microsoft Office\root\Office16\OSPPREARM.exe"
    goto OSPP_FOUND
)

:: ============================================================
:: 3. OSPPREARM NOT FOUND
:: ============================================================

echo [ERROR] OSPPREARM.EXE was not found.
echo.
echo Checked common Office16 locations:
echo.
echo %ProgramFiles%\Microsoft Office\Office16\
echo %ProgramFiles(x86)%\Microsoft Office\Office16\
echo %ProgramFiles%\Microsoft Office\root\Office16\
echo %ProgramFiles(x86)%\Microsoft Office\root\Office16\
echo.
echo Make sure Office is installed.
echo.
pause
exit /b 1


:: ============================================================
:: 4. OSPPREARM FOUND
:: ============================================================

:OSPP_FOUND

echo [OK] OSPPREARM.EXE found.
echo.
echo Location:
echo %OSPPREARM%
echo.

:: ============================================================
:: 5. RUN OSPPREARM
:: ============================================================

echo [2] Running OSPPREARM.EXE...
echo.
echo Please wait...
echo.

"%OSPPREARM%"

set "REARM_RESULT=%errorlevel%"

echo.
echo ============================================================
echo                    RESULT
echo ============================================================
echo.

if "%REARM_RESULT%"=="0" (
    echo [OK] OSPPREARM completed successfully.
) else (
    echo [INFO] OSPPREARM returned exit code: %REARM_RESULT%
)

echo.
echo ============================================================
echo.

echo OSPPREARM process has finished.
echo.
echo IMPORTANT:
echo OSPPREARM does not by itself guarantee Office activation.
echo It performs the Office licensing/rearm operation.
echo.
echo If this system uses a legitimate KMS environment,
echo Office activation still depends on the KMS configuration
echo and connectivity of this computer.
echo.
pause

endlocal
exit /b %REARM_RESULT%