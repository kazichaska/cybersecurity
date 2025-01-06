
### 01. **Set File Permissions for Sensitive Files on the System**

File permissions are crucial for protecting sensitive files on the system. Below are examples of setting permissions for common sensitive files:

#### Example 1: Setting Permissions for `/etc/shadow`

The `/etc/shadow` file contains hashed passwords and should only be readable and writable by the root user.

```bash
# Set permissions to only allow root to read and write the file
sudo chmod 600 /etc/shadow
```

- `600` means:
  - The owner (root) has read and write access.
  - All others have no access to the file.

#### Example 2: Setting Permissions for `/etc/passwd`

The `/etc/passwd` file contains user account information. Typically, it should be readable by all users, but only root should have write access.

```bash
# Set permissions to allow root to write and all users to read
sudo chmod 644 /etc/passwd
```

- `644` means:
  - The owner (root) has read and write access.
  - All others have read-only access.

#### Example 3: Securing SSH Configuration File (`/etc/ssh/sshd_config`)

The `sshd_config` file defines SSH settings. It should be readable by root only.

```bash
# Set permissions to ensure only root has read and write access
sudo chmod 600 /etc/ssh/sshd_config
```

#### Example 4: Making Log Files Read-Only for Users

Log files, such as `/var/log/auth.log`, contain system logs that should only be accessed by system administrators.

```bash
# Make the auth.log file readable by everyone but writable only by root
sudo chmod 644 /var/log/auth.log
```

---

### 02. **Managed and Monitored Services on the System, Removing Unused Services**

Services should be monitored to ensure no unused or insecure services are running on the system.

#### Example 1: List All Running Services

Use `systemctl` to list all services running on the system.

```bash
# List all active services
sudo systemctl list-units --type=service
```

#### Example 2: Stop and Disable Unused Services (e.g., FTP)

If FTP is not used, stop and disable the service to prevent unnecessary risk.

```bash
# Stop the FTP service (e.g., vsftpd)
sudo systemctl stop vsftpd

# Disable the FTP service to prevent it from starting at boot
sudo systemctl disable vsftpd
```

#### Example 3: Uninstall Unused Services

If you no longer need a service (e.g., FTP), uninstall it to free up system resources.

```bash
# Uninstall the vsftpd package (FTP)
sudo apt-get remove --purge vsftpd
```

#### Example 4: Check for Active SSH Service

Make sure that SSH is still running and configured properly.

```bash
# Check the status of the SSH service
sudo systemctl status ssh
```

---

### 03. **Assigned Users for Services**

Each service typically runs with its own user to limit access and reduce security risks. Here's how you can assign users to services.

#### Example 1: Assign a User for FTP (e.g., `vsftpd`)

1. Create a service user for FTP:
   ```bash
   sudo useradd -r -s /usr/sbin/nologin -M ftpuser
   ```

   - `-r` creates a system account.
   - `-s /usr/sbin/nologin` prevents login access for the service user.
   - `-M` prevents the creation of a home directory.

2. Set ownership for FTP service files to the service user:
   ```bash
   sudo chown ftpuser:ftpuser /etc/vsftpd.conf
   ```

#### Example 2: Assign a User for Web Server (e.g., `apache2`)

1. Apache2 typically runs under a `www-data` user. Ensure it is configured to use the correct user:
   ```bash
   sudo useradd -r -s /usr/sbin/nologin -M apache
   ```

2. Set file ownership for web content to the Apache user:
   ```bash
   sudo chown apache:apache /var/www/html
   ```

#### Example 3: Assign a User for Tripwire

For Tripwire, a dedicated service user should be created to run the program with limited privileges:

1. Create a service user for Tripwire:
   ```bash
   sudo useradd -r -s /usr/sbin/nologin -M tripwire
   ```

2. Ensure Tripwire files are owned by the `tripwire` user:
   ```bash
   sudo chown tripwire:tripwire /opt/tripwire
   ```

3. Ensure no login is allowed for the service user:
   ```bash
   sudo chsh -s /usr/sbin/nologin tripwire
   ```

---

These examples cover setting file permissions, managing services, and assigning users to services to ensure that your system follows best practices for security and resource management.