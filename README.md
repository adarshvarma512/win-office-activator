<div align="center">
  <img src="https://img.icons8.com/color/96/windows-11.png" alt="Windows Logo" width="80" height="80">
  <img src="https://img.icons8.com/color/96/microsoft-office-2019.png" alt="Office Logo" width="80" height="80">
  <h1>Enterprise System Activation & Office Deployment Suite</h1>
  <p>Advanced Automation Architecture for Windows OS Licensing and Microsoft Office Deployment Environments</p>

  <p>
    <img src="https://img.shields.io/badge/Platform-Windows%2010%20%2F%2011-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Platform">
    <img src="https://img.shields.io/badge/Architecture-x86%20%7C%20x64-2EA44F?style=for-the-badge&logo=windows&logoColor=white" alt="Architecture">
    <img src="https://img.shields.io/badge/Automation-Batch%20%2F%20PowerShell-555555?style=for-the-badge&logo=powershell&logoColor=white" alt="Automation">
    <img src="https://img.shields.io/badge/Security-Admin%20Privileged-FF5722?style=for-the-badge&logo=windowssecurity&logoColor=white" alt="Security">
  </p>

  <p>
    <a href="#download-center">
      <img src="https://img.shields.io/badge/Access_Download_Center-1F6FEB?style=for-the-badge&logo=github&logoColor=white" alt="Download Center">
    </a>
    <a href="#windows-activation-suite">
      <img src="https://img.shields.io/badge/Windows_Module-005FB8?style=for-the-badge&logo=windows&logoColor=white" alt="Windows Module">
    </a>
    <a href="#office-deployment--licensing-suite">
      <img src="https://img.shields.io/badge/Office_Module-D83B01?style=for-the-badge&logo=microsoftoffice&logoColor=white" alt="Office Module">
    </a>
  </p>
</div>

---

<div align="center">
  <img src="https://via.placeholder.com/1000/F0F4F8/1F2937?text=Enterprise+Automation+and+Licensing+Control+Center" alt="Banner" width="100%">
</div>

---

## Repository Architecture & Core Separation

This repository is segregated into two independent high-performance operational units:
1. **Windows Activation Suite:** Standalone software utility dedicated to operating system license configuration.
2. **Office Deployment & Licensing Suite:** Automated batch-driven scripting engines for Microsoft Office deployment and rearm lifecycle management.

---

<div id="windows-activation-suite"></div>

## Module 1: Windows Activation Suite

<table width="100%">
  <tr>
    <td width="20%" align="center" valign="middle">
      <img src="https://img.icons8.com/color/96/security-checked.png" width="64" alt="Windows Security">
    </td>
    <td width="80%" valign="top">
      <h3>Standalone Utility: <code>Activation Setup V3.0.exe</code></h3>
      <p><b>Target Domain:</b> Windows Operating System Licensing</p>
      <p>Designed as a standalone executable interface that streamlines Windows activation protocols. It handles system registry states and cryptographic licensing tokens efficiently without requiring manual script interventions.</p>
      <ul>
        <li>Single-click standalone executable deployment</li>
        <li>Automated privilege checks and background execution</li>
        <li>Compatible with Windows 10 and Windows 11 builds</li>
      </ul>
    </td>
  </tr>
</table>

---

<div id="office-deployment--licensing-suite"></div>

## Module 2: Office Deployment & Licensing Suite

This module consists of two powerful core logic scripts engineered for silent Office installation and backend rearm management.

### Part A: Automated Office Installation Engine (`install.bat`)
The installation script executes a robust, multi-stage deployment pipeline utilizing the official Microsoft Office Deployment Tool (ODT)[cite: 2]:

* **Administrative Privilege Enforcement:** 
  The script initiates by executing `net session` to verify current user clearance[cite: 2]. If standard execution privileges are detected, it programmatically invokes a PowerShell process to restart and elevate permissions (`Start-Process -FilePath '%~f0' -Verb RunAs`)[cite: 2].
* **Dependency & Asset Verification:** 
  It scans the working directory for the presence of the Microsoft Office Deployment Tool executable (`officedeploymenttool*.exe`) and the deployment blueprint (`configuration.xml`)[cite: 2]. If either required asset is missing, execution terminates with an error code[cite: 2].
* **Workspace Preparation & Caching:** 
  Establishes a dedicated temporary working directory at `C:\Office 2021` (`TARGET`) and securely copies both the ODT binary and configuration profile into the destination folder[cite: 2].
* **Silent Package Extraction & Execution:** 
  Performs silent extraction of the ODT package using the parameter `"%TARGET%\%ODT_NAME%" /extract:"%TARGET%"`[cite: 2]. Upon verifying that `setup.exe` has been successfully unpacked, it triggers the final configuration sequence: `setup.exe /configure configuration.xml`[cite: 2].

### Part B: Office Licensing & Rearm Utility (`active.bat`)
The licensing utility manages Office grace periods and internal token rearm routines through the native `OSPPREARM.exe` binary[cite: 3]:

* **Privilege Elevation Protocol:** 
  Enforces strict administrator permission checks via `net session`, automatically prompting PowerShell-based elevation if executed under standard user rights[cite: 3].
* **Intelligent Path Scanning & Resolution:** 
  Systematically queries standard system directories and Click-to-Run installation paths to locate `OSPPREARM.exe` across multiple possible locations[cite: 3]:
  * Standard 64-bit Office path: `%ProgramFiles%\Microsoft Office\Office16\OSPPREARM.exe`[cite: 3]
  * 32-bit Office on 64-bit Windows path: `%ProgramFiles(x86)%\Microsoft Office\Office16\OSPPREARM.exe`[cite: 3]
  * Common Click-to-Run installation path: `%ProgramFiles%\Microsoft Office\root\Office16\OSPPREARM.exe`[cite: 3]
  * Alternate Click-to-Run installation path: `%ProgramFiles(x86)%\Microsoft Office\root\Office16\OSPPREARM.exe`[cite: 3]
* **Execution & Exit Code Verification:** 
  Once the valid binary path is resolved, the script executes `OSPPREARM.exe` and captures the resulting exit code (`REARM_RESULT`), providing clear status feedback and guidance on underlying KMS environment configurations[cite: 3].

---

<div id="download-center"></div>

## Master Download & Resource Center

| Module Category | Target Application / System | Component File Name | Status / Action Link |
| :--- | :--- | :--- | :--- |
| **Windows Activation** | Windows 10 / 11 OS | `Activation Setup V3.0.exe` | [![Download EXE](https://img.shields.io/badge/Download_EXE-238636?style=flat-square&logo=windows&logoColor=white)](./Activation/Activation%20Setup%20V3.0.exe) |
| **Office Deployment** | Microsoft Office Suite | `install.bat`[cite: 2] | [![Get Installer](https://img.shields.io/badge/Get_Installer-1F6FEB?style=flat-square&logo=windows-terminal&logoColor=white)](./Office/install.bat) |
| **Office Licensing** | Office Rearm Utility | `active.bat`[cite: 3] | [![Get Utility](https://img.shields.io/badge/Get_Utility-1F6FEB?style=flat-square&logo=windows-terminal&logoColor=white)](./Office/active.bat) |

---

## System Requirements & Execution Guidelines

<table width="100%">
  <tr>
    <td width="50%" valign="top">
      <h3>Operating System Support</h3>
      <p>Fully compatible with <b>Windows 10</b> and <b>Windows 11</b> across both 32-bit (x86) and 64-bit (x64) system architectures.</p>
    </td>
    <td width="50%" valign="top">
      <h3>Security & Network Privileges</h3>
      <p>Administrative rights are strictly mandatory for executing registry modifications, system scripts[cite: 2, 3], and ODT package downloads.</p>
    </td>
  </tr>
</table>

---

<div align="center">
  <img src="https://img.shields.io/badge/Maintained_By-Enterprise_Engineering_Team-success?style=for-the-badge" alt="Maintained">
  <p>Professional Deployment & Activation Infrastructure</p>
</div>
