linux_sysadmin_fundamentals.md

 file:

```markdown
# Linux Sysadmin Fundamentals

## User and Authentication Management

- **Add a new user**
  ```sh
  sudo useradd username
  ```

- **Delete a user**
  ```sh
  sudo userdel username
  ```

- **Change a user's password**
  ```sh
  sudo passwd username
  ```

- **Add a user to a group**
  ```sh
  sudo usermod -aG groupname username
  ```

- **List locked or empty password accounts**
  ```sh
  cat /etc/shadow | awk -F: '($2=="!" || $2=="*" || $2==""){print $1}'
  ```

## Service Management

- **Stop vsftpd service**
  ```sh
  systemctl stop vsftpd
  ```

- **Disable vsftpd service**
  ```sh
  systemctl disable vsftpd
  ```

- **Remove vsftpd package**
  ```sh
  apt remove vsftpd -y
  ```

- **Check vsftpd service status**
  ```sh
  systemctl status vsftpd
  ```

- **List installed vsftpd package**
  ```sh
  dpkg -l | grep vsftpd
  ```

- **List all running services**
  ```sh
  systemctl list-units --type=service --state=running
  ```

## Telnet Management

- **Check telnet service status**
  ```sh
  systemctl status telnet
  ```

- **Start telnet client**
  ```sh
  telnet
  ```

- **Locate telnet binary**
  ```sh
  which telnet
  ```

- **List installed telnet packages**
  ```sh
  dpkg -l | grep telnet
  ```

- **Check telnet processes**
  ```sh
  ps aux | grep telnet
  ```

- **Remove telnet server package**
  ```sh
  apt remove telnetd
  ```

- **Remove telnet client package**
  ```sh
  apt remove telnet
  ```

## SSH Management

- **Check SSH service status**
  ```sh
  systemctl status ssh
  ```

## Web Server Management

- **List installed HTTP packages**
  ```sh
  dpkg -l | grep http
  ```

- **Check HTTP processes**
  ```sh
  ps aux | grep http
  ```

- **List installed Apache packages**
  ```sh
  dpkg -l | grep apache
  ```

- **List installed Nginx packages**
  ```sh
  dpkg -l | grep nginx
  ```

- **Check Apache service status**
  ```sh
  systemctl status apache2
  ```

- **Check Nginx service status**
  ```sh
  systemctl status nginx
  ```

- **Check HTTPD service status**
  ```sh
  systemctl status httpd
  ```

- **Stop Apache service**
  ```sh
  systemctl stop apache2
  ```

- **Disable Apache service**
  ```sh
  systemctl disable apache2
  ```

- **Stop Nginx service**
  ```sh
  systemctl stop nginx
  ```

- **Disable Nginx service**
  ```sh
  systemctl disable nginx
  ```

---

This document provides fundamental commands for Linux system administration, covering user management, service management, and web server management.
```