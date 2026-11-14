<div align="center">
  <img src="https://img.icons8.com/fluency/96/windows-11.png" alt="System Logo" width="80" height="80">
  <h1>Automated System Activation & Office Deployment Suite</h1>
  <p>Enterprise-Grade Automation Scripts for Windows Licensing and Microsoft Office Deployment</p>

  <p>
    <img src="https://img.shields.io/badge/Platform-Windows%2010%20%2F%2011-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Platform">
    <img src="https://img.shields.io/badge/Architecture-x86%20%7C%20x64-2EA44F?style=for-the-badge" alt="Architecture">
    <img src="https://img.shields.io/badge/Automation-Batch%20%2F%20PowerShell-555555?style=for-the-badge&logo=powershell&logoColor=white" alt="Automation">
    <img src="https://img.shields.io/badge/Security-Admin%20Privileges-FF5722?style=for-the-badge&logo=windowssecurity&logoColor=white" alt="Security">
  </p>

  <p>
    <a href="#download-center">
      <img src="https://img.shields.io/badge/Access_Download_Center-1F6FEB?style=for-the-badge&logo=github&logoColor=white" alt="Download">
    </a>
    <a href="#core-automation-logic">
      <img src="https://img.shields.io/badge/View_Script_Logic-30363D?style=for-the-badge&logo=read-the-docs&logoColor=white" alt="Logic Docs">
    </a>
  </p>
</div>

---

<div align="center">
  <img src="https://via.placeholder.com/900x450/0D1117/58A6FF?text=System+Activation+and+Office+Deployment+Control+Center" alt="Suite Banner" width="90%">
</div>

---

## Architecture Overview & Core Modules

<table>
  <tr>
    <td width="33%" valign="top" align="center">
      <img src="https://img.icons8.com/fluency/64/security-checked.png" width="48" alt="Windows Activation">
      <h3>Windows Activation</h3>
      <p><b>File:</b> <code>Activation Setup V3.0.exe</code></p>
      <p>Standalone utility engineered for automated Windows system activation and licensing verification.</p>
    </td>
    <td width="33%" valign="top" align="center">
      <img src="https://img.icons8.com/fluency/64/microsoft-excel-2019.png" width="48" alt="Office Installer">
      <h3>Office Installation</h3>
      <p><b>File:</b> <code>install.bat</code></p>
      <p>Automated deployment engine utilizing Microsoft Office Deployment Tool (ODT) and custom XML configurations[cite: 2].</p>
    </td>
    <td width="33%" valign="top" align="center">
      <img src="https://img.icons8.com/fluency/64/services.png" width="48" alt="Office Activation">
      <h3>Office Licensing</h3>
      <p><b>File:</b> <code>active.bat</code></p>
      <p>Advanced OSPPREARM utility that scans and executes licensing rearm routines for Office environments[cite: 3].</p>
    </td>
  </tr>
</table>

---

## Core Automation Logic & Script Breakdown

<div align="center">
  <img src="https://img.shields.io/badge/Deep_Dive-Logic_Implementation-blue?style=for-the-badge" alt="Logic Deep Dive">
</div>

### 1. Office Installation Logic (`install.bat`)
The installation script executes a robust, multi-stage automated deployment pipeline[cite: 2]:
* **Administrator Privilege Validation:** Automatically checks execution rights via `net session`. If standard privileges are detected, it invokes a PowerShell process to restart the script with elevated administrative permissions (`Verb RunAs`)[cite: 2].
* **Environment & Dependency Verification:** Locates the Microsoft Office Deployment Tool executable (`officedeploymenttool*.exe`) and the deployment blueprint (`configuration.xml`) within the local directory. Halts execution with an error code if dependencies are missing[cite: 2].
* **Workspace Preparation:** Creates a dedicated working directory at `C:\Office 2021` and securely copies the ODT executable and configuration file into the target directory[cite: 2].
* **Automated Extraction & Deployment:** Executes silent extraction of the ODT package (`/extract:"C:\Office 2021"`), validates the existence of the generated `setup.exe`, and triggers the primary setup command: `setup.exe /configure configuration.xml`[cite: 2].

### 2. Office Licensing & Rearm Logic (`active.bat`)
The activation script manages Office licensing states through the native `OSPPREARM.exe` utility[cite: 3]:
* **Privilege Elevation Check:** Enforces administrator security checks via `net session`, relaunching through PowerShell with elevated privileges if necessary[cite: 3].
* **Intelligent Path Scanning:** Systematically searches standard and deep system directories for `OSPPREARM.exe` across multiple potential locations[cite: 3]:
  * Standard 64-bit path: `%ProgramFiles%\Microsoft Office\Office16\`[cite: 3]
  * 32-bit Office on 64-bit Windows path: `%ProgramFiles(x86)%\Microsoft Office\Office16\`[cite: 3]
  * Common Click-to-Run path: `%ProgramFiles%\Microsoft Office\root\Office16\`[cite: 3]
  * Alternate Click-to-Run path: `%ProgramFiles(x86)%\Microsoft Office\root\Office16\`[cite: 3]
* **Execution & Error Handling:** Once located, the script executes `OSPPREARM.exe` to reset the evaluation/licensing grace period, capturing and reporting exit codes to verify successful operation[cite: 3].

---

## Download & Resource Center

| Component Module | Target Application / System | Primary Executable / Script | Action Status |
| :--- | :--- | :--- | :--- |
| **Windows Activation Suite** | Windows OS Licensing | `Activation Setup V3.0.exe` | [![Download EXE](https://img.shields.io/badge/Download_EXE-238636?style=flat-square&logo=windows&logoColor=white)](./Activation/Activation%20Setup%20V3.0.exe) |
| **Office Deployment Engine** | Microsoft Office Suite | `install.bat`[cite: 2] | [![View Script](https://img.shields.io/badge/Get_Installer-1F6FEB?style=flat-square&logo=windows-terminal&logoColor=white)](./Office/install.bat) |
| **Office Licensing Utility** | Office Rearm / Activation | `active.bat`[cite: 3] | [![View Script](https://img.shields.io/badge/Get_Utility-1F6FEB?style=flat-square&logo=windows-terminal&logoColor=white)](./Office/active.bat) |

---

## Execution Guidelines & System Requirements

<div align="center">
  <img src="https://img.shields.io/badge/System_Requirements-Windows_10_%2F_11-informational?style=for-the-badge&logo=windows" alt="Requirements">
</div>

* **Operating System Compatibility:** Windows 10 or Windows 11 (32-bit & 64-bit architectures).
* **Execution Security:** Administrative rights are mandatory for batch script execution and standalone system utilities.
* **Network Connectivity:** Internet connection required during Office installation for downloading deployment packages via the ODT engine.

---

<div align="center">
  <img src="https://img.shields.io/badge/Maintained_By-System_Administrator-success?style=for-the-badge" alt="Maintained">
  <p>Professional Deployment & Activation Suite</p>
</div>
