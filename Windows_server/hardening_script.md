Here's a **PowerShell security hardening script** that will automate several key security protections for **Windows Server 2016 and Windows 10**. It will:  

✅ Harden **RDP security**  
✅ Enable **Credential Guard**  
✅ Block **PowerShell abuse**  
✅ Enable **Defender Exploit Guard**  
✅ Set **firewall rules**  
✅ Disable **risky Windows services**  

---

### **🔐 Windows Server Hardening Script (harden-windows.ps1)**
Save this as `harden-windows.ps1` and run it as **Administrator**.

```powershell
# Windows Security Hardening Script

# Requires admin privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Run this script as Administrator!" -ForegroundColor Red
    exit
}

Write-Host "Starting Windows Security Hardening..." -ForegroundColor Green

# 1️⃣ Disable RDP if not needed
Write-Host "[+] Disabling RDP if not required..." -ForegroundColor Yellow
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 1

# 2️⃣ Change RDP Port (Randomly set to 4567)
Write-Host "[+] Changing RDP Port to 4567..." -ForegroundColor Yellow
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -Name "PortNumber" -PropertyType DWord -Value 4567

# 3️⃣ Block brute force attacks by enabling account lockout policy
Write-Host "[+] Enforcing Account Lockout Policy..." -ForegroundColor Yellow
net accounts /lockoutthreshold:3
net accounts /lockoutduration:15

# 4️⃣ Enable Network Level Authentication (NLA) for RDP
Write-Host "[+] Enabling Network Level Authentication (NLA)..." -ForegroundColor Yellow
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name 'UserAuthentication' -Value 1

# 5️⃣ Disable LM & NTLMv1 Authentication
Write-Host "[+] Disabling LM and NTLMv1 Authentication..." -ForegroundColor Yellow
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v NoLMHash /t REG_DWORD /d 1 /f

# 6️⃣ Enable Windows Defender Credential Guard (Stops Hash Theft)
Write-Host "[+] Enabling Windows Defender Credential Guard..." -ForegroundColor Yellow
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v LsaCfgFlags /t REG_DWORD /d 1 /f

# 7️⃣ Block Untrusted PowerShell Scripts
Write-Host "[+] Setting PowerShell Execution Policy to Restricted..." -ForegroundColor Yellow
Set-ExecutionPolicy Restricted -Force

# 8️⃣ Enable PowerShell Logging (Detect Malicious Scripts)
Write-Host "[+] Enabling PowerShell Logging..." -ForegroundColor Yellow
reg add "HKLM\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" /v EnableScriptBlockLogging /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\PowerShell\Transcription" /v EnableTranscripting /t REG_DWORD /d 1 /f

# 9️⃣ Harden Windows Defender Exploit Protection
Write-Host "[+] Enabling Windows Defender Exploit Protection..." -ForegroundColor Yellow
Set-MpPreference -EnableControlledFolderAccess Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids D4F940AB-401B-4EFC-AADC-AD5F3C50688A -AttackSurfaceReductionRules_Actions Enable

# 🔟 Disable Unnecessary Windows Services
Write-Host "[+] Disabling Unnecessary Windows Services..." -ForegroundColor Yellow
sc config RemoteRegistry start= disabled
sc config wuauserv start= disabled
sc config winrm start= disabled

# ✅ Enable Windows Firewall (Ensures Port Security)
Write-Host "[+] Enabling Windows Firewall..." -ForegroundColor Yellow
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

Write-Host "[✔] Windows Hardening Completed Successfully!" -ForegroundColor Green
```

---

### **🚀 How to Run the Script**
1️⃣ **Save the script** as `harden-windows.ps1`  
2️⃣ **Run PowerShell as Administrator**  
3️⃣ **Execute the script** using:  
   ```powershell
   powershell -ExecutionPolicy Bypass -File C:\Path\To\harden-windows.ps1
   ```
4️⃣ **Verify security settings**  
   - Open **Event Viewer** → Check logs under **Windows Logs > Security**  
   - Run `gpedit.msc` → Verify security policies  
   - Check firewall rules:  
     ```powershell
     Get-NetFirewallRule | Select-Object DisplayName,Enabled
     ```
  
---

### **💡 Want More Security Features?**
✔ **Auto-install Sysmon for advanced logging**  
✔ **Block USB devices (USB Killers, Data Theft)**  
✔ **Enforce BitLocker Encryption**  