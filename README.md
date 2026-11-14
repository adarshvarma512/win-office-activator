<div align="center">
  <img src="https://img.icons8.com/fluency/96/windows-11.png" alt="System Logo" width="80" height="80">
  <h1>Comprehensive Technical Documentation</h1>
  <p>Enterprise-Grade Windows Activation and Office Deployment Architecture</p>

  <p>
    <img src="https://img.shields.io/badge/Platform-Windows%2010%20%2F%2011-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Platform">
    <img src="https://img.shields.io/badge/Architecture-x86%20%7C%20x64-2EA44F?style=for-the-badge" alt="Architecture">
    <img src="https://img.shields.io/badge/Automation-Batch%20%2F%20PowerShell-555555?style=for-the-badge&logo=powershell&logoColor=white" alt="Automation">
  </p>
</div>

---

<div align="center">
  <img src="https://via.placeholder.com/900x450/0D1117/58A6FF?text=System+Activation+and+Office+Deployment+Control+Center" alt="Suite Banner" width="90%">
</div>

---

## Component Overview

This repository contains professional automation components managing two primary domains:
1. **Windows Activation Utility (`Activation Setup V3.0.exe`):** Standalone executable designed for automated Windows system licensing and activation management.
2. **Office Deployment Engine (`install.bat`):** Batch script utilizing the Microsoft Office Deployment Tool (ODT) and custom configuration parameters for automated deployments[cite: 2].
3. **Office Licensing Utility (`active.bat`):** Advanced utility executing the native `OSPPREARM.exe` binary to manage Office licensing rearm routines[cite: 3].

---

## Detailed Logic Breakdown: Office Installation (`install.bat`)

The `install.bat` script executes a multi-stage automated deployment pipeline[cite: 2]:

* **Administrator Privilege Enforcement:** 
  The script validates administrative rights using `net session`. If standard privileges are detected, it invokes a PowerShell process to relaunch and elevate permissions via `Verb RunAs`[cite: 2].
* **Dependency & File Verification:** 
  The script searches the local directory for the Microsoft Office Deployment Tool executable (`officedeploymenttool*.exe`) and `configuration.xml`[cite: 2]. If either dependency is missing, execution terminates with an error code[cite: 2].
* **Workspace Preparation & Caching:** 
  A dedicated working directory is established at `C:\Office 2021`, and both the ODT executable and configuration file are securely copied to the target path[cite: 2].
* **Package Extraction & Execution:** 
  The ODT package is extracted silently using the parameter `/extract:"C:\Office 2021"`[cite: 2]. Following successful extraction and verification of `setup.exe`, the core deployment command is executed: `setup.exe /configure configuration.xml`[cite: 2].

---

## Detailed Logic Breakdown: Office Licensing (`active.bat`)

The `active.bat` script manages Office licensing states through the native `OSPPREARM.exe` utility[cite: 3]:

* **Privilege Validation:** 
  Enforces administrator security checks using `net session`, automatically requesting elevation via PowerShell if necessary[cite: 3].
* **Intelligent Path Scanning:** 
  Systematically scans standard and Click-to-Run installation directories to locate `OSPPREARM.exe`[cite: 3]:
  * Standard 64-bit path: `%ProgramFiles%\Microsoft Office\Office16\OSPPREARM.exe`[cite: 3]
  * 32-bit Office on 64-bit Windows path: `%ProgramFiles(x86)%\Microsoft Office\Office16\OSPPREARM.exe`[cite: 3]
  * Common Click-to-Run path: `%ProgramFiles%\Microsoft Office\root\Office16\OSPPREARM.exe`[cite: 3]
  * Alternate Click-to-Run path: `%ProgramFiles(x86)%\Microsoft Office\root\Office16\OSPPREARM.exe`[cite: 3]
* **Execution & Exit Code Verification:** 
  Upon locating the executable, the script executes `OSPPREARM.exe` to perform the rearm operation, capturing exit codes (`errorlevel`) to verify execution status[cite: 3].

---

## Download & Resource Center

| Component Module | Target System / Application | Primary Executable / Script File | Action Link |
| :--- | :--- | :--- | :--- |
| **Windows Activation Suite** | Windows OS Licensing | `Activation Setup V3.0.exe` | [![Download EXE](https://img.shields.io/badge/Download_EXE-238636?style=flat-square&logo=windows&logoColor=white)](./Activation/Activation%20Setup%20V3.0.exe) |
| **Office Deployment Engine** | Microsoft Office Suite | `install.bat`[cite: 2] | [![Get Script](https://img.shields.io/badge/Get_Installer-1F6FEB?style=flat-square&logo=windows-terminal&logoColor=white)](./Office/install.bat) |
| **Office Licensing Utility** | Office Rearm / Activation | `active.bat`[cite: 3] | [![Get Utility](https://img.shields.io/badge/Get_Utility-1F6FEB?style=flat-square&logo=windows-terminal&logoColor=white)](./Office/active.bat) |

---

## Execution Prerequisites & System Requirements

* **Operating System Compatibility:** Windows 10 or Windows 11 (32-bit and 64-bit architectures).
* **Security Permissions:** Administrator privileges are mandatory for executing system-level scripts and utility configurations[cite: 2, 3].
* **Network Connectivity:** Active internet connection is required for downloading deployment packages via the ODT engine[cite: 2].

---

<div align="center">
  <p>Professional Deployment & Activation Suite</p>
</div>
