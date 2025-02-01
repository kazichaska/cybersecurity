# User Space Attack Demonstration

In this demonstration, we’ll walk the students through a real-world scenario highlighting how attackers exploit user permissions, disguise their malware, and leverage common file locations for persistence. By examining practical tools and methods, you’ll learn to identify and mitigate these threats effectively.

## Scenario Overview

Imagine a scenario where a seemingly legitimate service is consuming unusually high CPU resources. An initial glance at the process name suggests it’s a system service. However, a closer inspection reveals discrepancies. With the right knowledge and tools, we can uncover this hidden threat and take steps to eliminate it.

## Understand User Permissions

1. **Log in to the Windows 10 machine with administrator privileges.**
2. **Open Computer Management**:
   - Press `Win + X` and select `Computer Management`.
   - Navigate to `Local Users and Groups > Users`.
3. **Review User Account Permissions**:
   - Identify accounts with Local Administrator.
     - Example: Look for accounts listed under the "Administrators" group.
   - Highlight accounts that should not have elevated access and discuss why reducing permissions is critical for security.
     - Example: If you find a user account like `guest` with administrator privileges, this should be corrected.

## Inspect Common Malware Locations

1. **Open File Explorer and Navigate to Common Malware Hiding Spots**:
   - Click on `Local Disk (C:)`.

2. **Review the Following Locations**:
   - **C:\Windows\Tasks**:
     - Navigate to `C:\Windows\Tasks`.
     - Example: Look for any unusual or unknown scheduled tasks.
   - **C:\Windows\Temp**:
     - Navigate to `C:\Windows\Temp`.
     - Example: Check for any suspicious files or folders that do not belong to known applications.
   - **C:\Users\<username>\AppData**:
     - Navigate to `C:\Users\<username>\AppData`.
     - Example: Look through subfolders like `Local`, `LocalLow`, and `Roaming` for any unfamiliar files or folders.

## Examine Running Processes

1. **Open Task Manager and Navigate to the Processes Tab**:
   - Press `Ctrl + Shift + Esc` to open Task Manager.
   - Click on the `More Details` button at the bottom if not already expanded.
2. **Sort Processes by CPU or Memory Usage to Identify Anomalies**:
   - Click on the `CPU` or `Memory` column header to sort processes by usage.
   - Example: Look for processes with unusually high CPU or memory usage that you do not recognize.
   - Explain to students that they can search the process name on the internet to get additional information on the process.
     - Example: If you see a process named `svchost1.exe`, search for it online to verify its legitimacy.

## Review Windows Services

1. **Open the Services Application**:
   - Press `Win + R` to open the Run dialog.
   - Type `services.msc` and press Enter.
2. **Double-click on the BitLocker Drive Encryption Service**:
   - Find and double-click on `BitLocker Drive Encryption Service`.
   - Demonstrate to students the:
     - **Service name**: BDESVC
     - **Executable Path**: `C:\Windows\System32\svchost.exe -k netsvcs -p`
   - Point out that the service uses `svchost.exe` as the executable.
   - Send students the link [svchost.exe](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/svchost) for additional information on `svchost.exe`.

3. **Explain How Attackers Disguise Malicious Services by Mimicking Native Service Names**:
   - Example: A legitimate service like `svchost.exe` may be spoofed with a name like `svchost1.exe`.
   - Cross-check the service name and description with official documentation.
   - Review the service’s executable path for anomalies.
     - Example: If the executable path is `C:\Windows\System32\svchost1.exe`, this is suspicious and should be investigated further.
