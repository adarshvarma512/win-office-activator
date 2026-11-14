<div align="center">
  <img src="https://img.icons8.com/fluency/96/windows-11.png" alt="Logo" width="80" height="80">
  <h1>Office Deployment & System Activation Suite</h1>
  <p>Automated Microsoft Office (32-bit & 64-bit) Deployment and System Activation Utilities</p>

  <p>
    <img src="https://img.shields.io/badge/Platform-Windows%2010%20%2F%2011-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Platform">
    <img src="https://img.shields.io/badge/Architecture-x86%20%7C%20x64-2EA44F?style=for-the-badge" alt="Architecture">
    <img src="https://img.shields.io/badge/Version-3.0-orange?style=for-the-badge" alt="Version">
  </p>

  <p>
    <a href="#download-center">
      <img src="https://img.shields.io/badge/Download_All_Packages-1F6FEB?style=for-the-badge&logo=github&logoColor=white" alt="Download">
    </a>
    <a href="#repository-structure">
      <img src="https://img.shields.io/badge/View_Documentation-30363D?style=for-the-badge&logo=readthedocs&logoColor=white" alt="Docs">
    </a>
  </p>
</div>

---

## Interface & Preview

<div align="center">
  <!-- Apne software ya setup ka screenshot yahan lagayein (assets folder mein image daal kar path update karein) -->
  <img src="https://via.placeholder.com/800x400/0D1117/58A6FF?text=Replace+With+Your+Software+Screenshot" alt="Application Preview" width="85%">
</div>

---

## Included Tools & Modules

<table>
  <tr>
    <td width="50%" valign="top">
      <h3>
        <img src="https://img.icons8.com/fluency/48/key-security.png" width="22" align="absmiddle">
        Activation Utility (V3.0)
      </h3>
      <p><b>Directory:</b> <code>/Activation</code></p>
      <p>Standalone executable utility (<code>Activation Setup V3.0.exe</code>) designed for automated Windows and Office licensing configuration.</p>
      <ul>
        <li>One-click standalone setup</li>
        <li>Automated script execution</li>
        <li>Supports standard Windows & Office builds</li>
      </ul>
    </td>
    <td width="50%" valign="top">
      <h3>
        <img src="https://img.icons8.com/fluency/48/microsoft-office-2019.png" width="22" align="absmiddle">
        Office Deployment (32-Bit & 64-Bit)
      </h3>
      <p><b>Directories:</b> <code>/Office 32</code> & <code>/Office 64</code></p>
      <p>Pre-configured Microsoft Office Deployment Tool (ODT) packages for silent, customized installation and activation.</p>
      <ul>
        <li><code>Configuration.xml</code> — Custom app & language selection</li>
        <li><code>install.bat</code> — Automated ODT download & setup</li>
        <li><code>active.bat</code> — Post-installation license activation</li>
      </ul>
    </td>
  </tr>
</table>

---

## Download Center

Direct access to individual installers and deployment scripts:

| Module | Architecture | Key File | Direct Action |
| :--- | :--- | :--- | :--- |
| **Activation Setup V3.0**[cite: 1] | Universal (x86/x64) | `Activation Setup V3.0.exe`[cite: 1] | [![Download](https://img.shields.io/badge/Download_EXE-238636?style=flat-square&logo=windows&logoColor=white)](./Activation/Activation%20Setup%20V3.0.exe) |
| **Office Deployment (32-Bit)**[cite: 1] | 32-Bit (x86) | `install.bat` / `Configuration.xml`[cite: 1] | [![Open Folder](https://img.shields.io/badge/Open_Office_32-1F6FEB?style=flat-square&logo=files&logoColor=white)](./Office%2032) |
| **Office Deployment (64-Bit)**[cite: 1] | 64-Bit (x64) | `install.bat` / `Configuration.xml`[cite: 1] | [![Open Folder](https://img.shields.io/badge/Open_Office_64-1F6FEB?style=flat-square&logo=files&logoColor=white)](./Office%2064) |

---

## Repository Structure

```text
├── Activation/
│   └── Activation Setup V3.0.exe        # Main standalone activation installer
│
├── Office 32/
│   ├── Configuration.xml                # 32-bit Office deployment parameters
│   ├── install.bat                      # 32-bit automated installer script
│   ├── active.bat                       # 32-bit activation script
│   └── officedeploymenttool_20228...    # Official Microsoft ODT binary
│
└── Office 64/
    ├── Configuration.xml                # 64-bit Office deployment parameters
    ├── install.bat                      # 64-bit automated installer script
    ├── active.bat                       # 64-bit activation script
    └── officedeploymenttool_20228...    # Official Microsoft ODT binary
