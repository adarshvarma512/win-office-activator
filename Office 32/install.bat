@echo off
setlocal EnableExtensions
title Office 2021 Automatic Setup
set "SOURCE=%~dp0"
set "TARGET=C:\Office 2021"
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting Administrator permission...
    powershell.exe -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)
echo.
echo ============================================================
echo             OFFICE 2021 INSTALLER
echo ============================================================
echo.
set "ODT_EXE="
for /f "delims=" %%F in ('dir /b /a:-d "%SOURCE%officedeploymenttool*.exe" 2^>nul') do (
    set "ODT_EXE=%SOURCE%%%F"
    goto ODT_FOUND
)
:ODT_FOUND
if not defined ODT_EXE (
    echo [ERROR] officedeploymenttool*.exe not found.
    echo.
    echo Keep the ODT EXE in the same folder as this BAT.
    pause
    exit /b 1
)
for %%I in ("%ODT_EXE%") do set "ODT_NAME=%%~nxI"
if not exist "%SOURCE%configuration.xml" (
    echo [ERROR] configuration.xml not found.
    echo.
    echo Keep configuration.xml in the same folder as this BAT.
    pause
    exit /b 1
)
echo [OK] ODT:
echo      %ODT_NAME%
echo [OK] configuration.xml found.
echo.
echo [1] Creating C:\Office 2021 ...
if not exist "%TARGET%\" mkdir "%TARGET%"
if not exist "%TARGET%\" (
    echo [ERROR] C:\Office 2021 could not be created.
    pause
    exit /b 1
)
echo [2] Copying files...
copy /Y "%ODT_EXE%" "%TARGET%\%ODT_NAME%" >nul
if errorlevel 1 (
    echo [ERROR] ODT EXE copy failed.
    pause
    exit /b 1
)
copy /Y "%SOURCE%configuration.xml" "%TARGET%\configuration.xml" >nul
if errorlevel 1 (
    echo [ERROR] configuration.xml copy failed.
    pause
    exit /b 1
)
echo [OK] Both files copied.
echo.
echo [3] EXTRACTING Office Deployment Tool...
echo.
echo Destination:
echo %TARGET%
echo.
cd /d "%TARGET%"
"%TARGET%\%ODT_NAME%" /extract:"%TARGET%"
if errorlevel 1 (
    echo.
    echo [ERROR] ODT extraction command returned an error.
    echo.
    pause
    exit /b 1
)
if not exist "%TARGET%\setup.exe" (
    echo.
    echo [ERROR] EXTRACTION DID NOT CREATE setup.exe
    echo.
    echo Expected file:
    echo %TARGET%\setup.exe
    echo.
    echo ODT files were NOT successfully extracted.
    echo.
    pause
    exit /b 1
)
echo.
echo [OK] EXTRACTION SUCCESSFUL.
echo [OK] setup.exe exists.
echo.
echo [4] RUNNING OFFICE SETUP...
echo.
echo Current location:
cd
echo.
echo Command:
echo setup.exe /configure configuration.xml
echo.
setup.exe /configure configuration.xml
set "SETUP_RESULT=%errorlevel%"
echo.
echo ============================================================
if "%SETUP_RESULT%"=="0" (
    echo Office setup command completed.
) else (
    echo Office setup returned exit code: %SETUP_RESULT%
)
echo ============================================================
echo.
pause
endlocal