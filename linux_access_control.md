
### 01. **Cracked Password Hashes with John the Ripper**

John the Ripper (John) is a password cracking tool that can help you identify weak or easily cracked passwords from password hashes.

#### Example 1: Using John to Crack Password Hashes

1. **Extract Password Hashes:**
   First, extract the password hashes from the system. Common files include `/etc/shadow` (Linux) or `/etc/passwd`.

   ```bash
   sudo cat /etc/shadow
   ```

   Example hash output:
   ```
   user:$6$rounds=5000$saltsalt$hashedpassword:17962:0:99999:7:::
   ```

2. **Use John to Crack the Password:**

   To crack a password hash using John, use the following command:

   ```bash
   sudo john --wordlist=/usr/share/wordlists/rockyou.txt --format=sha512crypt /etc/shadow
   ```

   - `--wordlist=rockyou.txt`: Specifies the wordlist file to use for cracking (you can use other wordlists too).
   - `--format=sha512crypt`: Specifies the hash format (SHA-512 in this case).
   - `/etc/shadow`: The file containing the hashed passwords.

3. **Monitor Progress:**

   You can monitor the progress of John:

   ```bash
   sudo john --status
   ```

4. **Show Cracked Passwords:**

   After John finishes running, display the cracked passwords with:

   ```bash
   sudo john --show /etc/shadow
   ```

   Example output:

   ```
   user:password123
   ```

---

### 02. **Escalated Privileges with `su` and `sudo`**

Privilege escalation is the process of gaining higher-level privileges (like root) on a system.

#### Example 1: Using `su` to Switch to Root

The `su` command allows you to switch users, typically to root:

1. **Switch User to Root with `su`:**

   ```bash
   su -
   ```

   This will ask for the root password. Once you enter it, you'll have a root shell.

   - `su -`: Switches to the root user and loads the root user's environment.

#### Example 2: Using `sudo` for Command Execution

The `sudo` command allows users to run commands with elevated privileges:

1. **Run a Command with `sudo`:**

   For example, to list files in a restricted directory (`/root`), you can use:

   ```bash
   sudo ls /root
   ```

2. **Execute a Command as Root Using `sudo`:**

   If you're a user with sudo privileges, you can run commands as root. For example:

   ```bash
   sudo shutdown -h now
   ```

   - This command shuts down the system immediately, but it requires `sudo` privileges.

3. **Escalating Privileges to Root via `sudo` (if permitted):**

   If your account has sudo privileges configured to allow root access, use:

   ```bash
   sudo -i
   ```

   - `-i` gives you an interactive root shell.

#### Example 3: Sudo Access for Specific Commands

In the `/etc/sudoers` file, you can configure which users can run which commands. For example:

```bash
username ALL=(ALL) NOPASSWD: /usr/bin/ls
```

This would allow the user `username` to run `ls` as root without a password prompt.

---

### 03. **Managed Users and Groups**

Managing users and groups is essential to ensure proper access control on the system.

#### Example 1: Create a New User

1. **Create a New User:**

   To create a new user:

   ```bash
   sudo useradd john
   ```

   - This command creates a user named `john`.

2. **Set a Password for the New User:**

   After creating a user, set a password for them:

   ```bash
   sudo passwd john
   ```

   - You'll be prompted to enter a password for the user `john`.

#### Example 2: Add User to a Group

1. **Add a User to a Group:**

   To add the user `john` to the group `admin`:

   ```bash
   sudo usermod -aG admin john
   ```

   - `-aG` appends the user to the specified group (`admin` in this case).

#### Example 3: Remove a User

To remove a user from the system, use:

```bash
sudo userdel john
```

- This deletes the user `john`.

#### Example 4: Create a New Group

1. **Create a New Group:**

   To create a new group `testgroup`:

   ```bash
   sudo groupadd testgroup
   ```

2. **Add a User to the Group:**

   Add `john` to the `testgroup`:

   ```bash
   sudo usermod -aG testgroup john
   ```

#### Example 5: Change User's Primary Group

You can change a user’s primary group using the `usermod` command. For example, to change `john`'s primary group to `testgroup`:

```bash
sudo usermod -g testgroup john
```

#### Example 6: Verify User’s Group Memberships

To verify which groups a user is part of, use:

```bash
groups john
```

This will show the groups `john` belongs to.

---

These examples give you a practical understanding of how to:

- **Crack password hashes** using John the Ripper.
- **Escalate privileges** with `su` and `sudo`.
- **Manage users and groups** on the system to control access effectively.