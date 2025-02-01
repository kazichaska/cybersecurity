### **Windows Server Hardening Guide 🚀**  
To **secure your Windows Server 2016** (or Windows 10), follow these steps to **prevent brute-force attacks, credential theft, and phishing exploits**.

---

## **1. Secure RDP Against Brute Force Attacks**
🔹 **Disable RDP if Not Needed**  
If RDP isn’t necessary, disable it:  
```powershell
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 1
```

🔹 **Change RDP Port from Default (3389)**
Hackers often scan for open **port 3389** to find RDP servers. Change it to a random port (e.g., 4567):  
```powershell
New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -Name "PortNumber" -PropertyType DWord -Value 4567 -Force
```
Then restart RDP service:
```powershell
Restart-Service TermService -Force
```

🔹 **Enable Account Lockout Policy (Prevents Brute-Force Attacks)**  
Set **3 failed login attempts** before locking the account for 15 minutes:  
```powershell
net accounts /lockoutthreshold:3
net accounts /lockoutduration:15
```

🔹 **Use Windows Firewall to Restrict RDP Access**
Allow RDP only from **specific IP addresses**:  
```powershell
New-NetFirewallRule -DisplayName "Allow RDP from Specific IP" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 4567 -RemoteAddress 192.168.1.100
```

🔹 **Enable Network Level Authentication (NLA)**
NLA ensures only authorized users can reach the RDP login screen:  
```powershell
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name 'UserAuthentication' -Value 1
```

---

## **2. Prevent Pass-the-Hash Attacks**
🔹 **Enable Credential Guard (Prevents Hash Dumping)**
To **prevent tools like Mimikatz** from extracting NTLM hashes, enable Credential Guard:  
```powershell
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LsaCfgFlags" -PropertyType DWord -Value 1
```

🔹 **Disable WDigest (Prevents Plaintext Password Storage)**
Older Windows versions store **passwords in memory** if WDigest is enabled. Disable it:  
```powershell
reg add HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential /t REG_DWORD /d 0 /f
```

🔹 **Disable LM and NTLMv1 Authentication (Legacy & Insecure)**
```powershell
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v NoLMHash /t REG_DWORD /d 1 /f
```

🔹 **Use Strong Passwords**
Force users to **set complex passwords**:  
```powershell
net accounts /minpwlen:12 /maxpwage:30 /uniquepw:5
```
This enforces:
- **Minimum 12 characters**
- **Password change every 30 days**
- **Cannot reuse last 5 passwords**

---

## **3. Block PowerShell-Based Phishing Attacks**
🔹 **Set PowerShell Execution Policy**
Prevent unauthorized script execution:  
```powershell
Set-ExecutionPolicy Restricted -Force
```
If your admins need PowerShell but **want to block remote scripts**, use:  
```powershell
Set-ExecutionPolicy RemoteSigned -Force
```

🔹 **Enable PowerShell Logging (Detect Malicious Scripts)**
To log all PowerShell commands:  
```powershell
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -Value 1
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription" -Name "EnableTranscripting" -Value 1
```
Logs can be found in **Event Viewer** → **Windows Logs** → **PowerShell**.

🔹 **Monitor Event Logs for Suspicious PowerShell Activity**
Check for **Event ID 4688** in Event Viewer:  
```
Event Viewer > Windows Logs > Security
```
Look for:
- PowerShell spawning **cmd.exe** or **mshta.exe**
- PowerShell downloading files from the internet

---

## **4. Detect & Prevent Unauthorized Access**
🔹 **Enable Windows Defender Attack Surface Reduction (ASR)**
```powershell
Set-MpPreference -AttackSurfaceReductionRules_Ids D4F940AB-401B-4EFC-AADC-AD5F3C50688A -AttackSurfaceReductionRules_Actions Enable
```
This **blocks malicious scripts and exploit payloads**.

🔹 **Enable Windows Defender Application Control (WDAC)**
Block unknown applications from running:  
```powershell
Set-ProcessMitigation -Name "PowerShell.exe" -Enable DEP -Enable ASLR
```

🔹 **Use Sysmon for Advanced Logging**
Install **Sysmon** to log process activity:  
1. **Download Sysmon** from Microsoft:  
   https://docs.microsoft.com/en-us/sysinternals/downloads/sysmon  
2. **Install Sysmon and configure rules:**
   ```powershell
   sysmon -accepteula -i
   ```

🔹 **Block Windows Services Used by Hackers**
Disable common attack tools like **PsExec** and **WMI**:
```powershell
sc config RemoteRegistry start= disabled
sc config wuauserv start= disabled
sc config winrm start= disabled
```

---

## **5. Protect Against Fileless Malware & Exploits**
🔹 **Block Macros in Office Documents**
```powershell
reg add "HKCU\Software\Microsoft\Office\16.0\Word\Security" /v "VBAWarnings" /t REG_DWORD /d 3 /f
```
This **disables macros**, preventing phishing payloads.

🔹 **Block Untrusted Executables**
Use **AppLocker** to block unknown applications:
```powershell
New-AppLockerPolicy -Xml -FilePath C:\AppLockerPolicy.xml
```

🔹 **Enable Windows Defender Exploit Guard**
```powershell
Set-MpPreference -EnableControlledFolderAccess Enabled
```
This **blocks ransomware** from modifying system files.

---

## **6. Regularly Audit Your System for Breaches**
### **Check Active Network Connections**
See **all active connections**:  
```powershell
netstat -ano
```
Look for **suspicious foreign IPs**.

### **Find Hidden User Accounts**
Check for **users with admin privileges**:  
```powershell
net localgroup Administrators
```

### **Monitor Scheduled Tasks**
List **all scheduled tasks**:
```powershell
schtasks /query /fo LIST /v
```

### **Audit Firewall Rules**
```powershell
netsh advfirewall firewall show rule name=all
```

### **Detect Suspicious Processes**
```powershell
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
```
This shows processes **using the most CPU**, which may indicate malware.

---

## **Final Thoughts**
By following these steps, you **harden your Windows Server** against common cyber threats:
✅ **Block brute-force attacks on RDP**  
✅ **Prevent Pass-the-Hash attacks**  
✅ **Detect and block PowerShell-based phishing**  
✅ **Restrict unauthorized access**  
✅ **Monitor and log suspicious activities**  

Would you like a **custom security script** to automate these protections? 🚀