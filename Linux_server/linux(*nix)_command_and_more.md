
# Linux (*nix) Commands and More

- **`ls`**: Lists directory contents.
  ```sh
  ls
  ```
- **`cd`**: Changes the current directory.
  ```sh
  cd /path/to/directory
  ```
- **`pwd`**: Prints the current working directory.
  ```sh
  pwd
  ```
- **`cp`**: Copies files or directories.
  ```sh
  cp source_file destination_file
  ```
- **`mv`**: Moves or renames files or directories.
  ```sh
  mv old_name new_name
  ```
- **`rm`**: Removes files or directories.
  ```sh
  rm file_name
  ```
- **`mkdir`**: Creates a new directory.
  ```sh
  mkdir new_directory
  ```
- **`rmdir`**: Removes an empty directory.
  ```sh
  rmdir empty_directory
  ```

## File Viewing and Editing
- **`cat`**: Concatenates and displays file content.
  ```sh
  cat file_name
  ```
- **`head`**: Displays the first few lines of a file.
  ```sh
  head file_name
  ```
- **`tail`**: Displays the last few lines of a file.
  ```sh
  tail file_name
  ```
- **`nano`**: A simple text editor.
  ```sh
  nano file_name
  ```
- **`vi`**: A powerful text editor.
  ```sh
  vi file_name
  ```

## System Information
- **`uname`**: Prints system information.
  ```sh
  uname -a
  ```
- **`top`**: Displays real-time system processes.
  ```sh
  top
  ```
- **`df`**: Reports file system disk space usage.
  ```sh
  df -h
  ```
- **`du`**: Estimates file space usage.
  ```sh
  du -sh directory_name
  ```
- **`free`**: Displays memory usage.
  ```sh
  free -h
  ```

## Networking
- **`ifconfig`**: Configures network interfaces.
  ```sh
  ifconfig
  ```
- **`ping`**: Checks network connectivity.
  ```sh
  ping hostname_or_ip
  ```
- **`netstat`**: Displays network connections, routing tables, and more.
  ```sh
  netstat -tuln
  ```
- **`ssh`**: Connects to a remote machine via SSH.
  ```sh
  ssh user@hostname
  ```

## Package Management
- **`apt-get`**: Package handling utility for Debian-based distributions.
  ```sh
  sudo apt-get update
  sudo apt-get install package_name
  ```
- **`yum`**: Package manager for RPM-based distributions.
  ```sh
  sudo yum update
  sudo yum install package_name
  ```

## File Permissions
- **`chmod`**: Changes file permissions.
  ```sh
  chmod 755 file_name
  ```
- **`chown`**: Changes file owner and group.
  ```sh
  chown user:group file_name
  ```

## Miscellaneous
- **`echo`**: Displays a line of text.
  ```sh
  echo "Hello, World!"
  ```
- **`grep`**: Searches for patterns in files.
  ```sh
  grep "search_term" file_name
  ```
- **`find`**: Searches for files in a directory hierarchy.
  ```sh
  find /path/to/search -name "file_name"
  ```
- **`find`** - multiple directory
```sh
find / -type d -iname "Etc" -o -iname "Legal" 
```
- **`tar`**: Archives files.
  ```sh
  tar -cvf archive_name.tar directory_name
  ```
- **`zip`**: Compresses files.
  ```sh
  zip archive_name.zip file_name
  ```
- **`unzip`**: Decompresses files.
  ```sh
  unzip archive_name.zip
  ```

---
```