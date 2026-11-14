@echo off
setlocal EnableExtensions
title Office 2021 Automatic Setup

REM ============================================================
REM  OFFICE 2021 - REAL AUTOMATIC INSTALLATION
REM
REM Put these 3 files beside this BAT:
REM   1. officedeploymenttool_20228-20124.exe
REM   2. configuration.xml
REM   3. this BAT file
REM
REM It will:
REM   - run as Administrator
REM   - create C:\Office 2021
REM   - copy ODT EXE + configuration.xml there
REM   - ACTUALLY EXTRACT the ODT EXE into C:\Office 2021
REM   - verify setup.exe exists
REM   - ACTUALLY RUN setup.exe /configure configuration.xml
REM ============================================================

set "SOURCE=%~dp0"
set "TARGET=C:\Office 2021"

REM ------------------------------------------------------------
REM ADMIN CHECK
REM ------------------------------------------------------------
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting Administrator permission...
    powershell.exe -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo.
echo ============================================================
echo             OFFICE 2021 AUTOMATIC INSTALLER
echo ============================================================
echo.

REM ------------------------------------------------------------
REM FIND ODT EXE
REM ------------------------------------------------------------
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

REM ------------------------------------------------------------
REM CREATE TARGET FOLDER
REM ------------------------------------------------------------
echo [1] Creating C:\Office 2021 ...
if not exist "%TARGET%\" mkdir "%TARGET%"

if not exist "%TARGET%\" (
    echo [ERROR] C:\Office 2021 could not be created.
    pause
    exit /b 1
)

REM ------------------------------------------------------------
REM COPY FILES
REM ------------------------------------------------------------
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

REM ------------------------------------------------------------
REM IMPORTANT:
REM ACTUALLY EXTRACT THE ODT EXE INTO THE SAME FOLDER.
REM
REM This is the same command you would manually use:
REM officedeploymenttool_20228-20124.exe /extract:C:\Office 2021
REM ------------------------------------------------------------
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

REM ------------------------------------------------------------
REM VERIFY EXTRACTION
REM ------------------------------------------------------------
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

REM ------------------------------------------------------------
REM RUN SETUP
REM This BAT is already Administrator, so this command is also
REM running as Administrator.
REM ------------------------------------------------------------
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
