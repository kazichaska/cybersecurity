```markdown
# Using Loops in Bash Scripts

## We will use loops to:

### 1. Run Through a List of Packages and Check if Certain Ones are Installed

You can use a `for` loop to iterate through a list of packages and check if each one is installed.

### Example
```bash
#!/bin/bash
packages=("curl" "wget" "git")
for package in "${packages[@]}"; do
  if dpkg -l | grep -q $package; then
    echo "$package is installed."
  else
    echo "$package is not installed."
  fi
done
```

### 2. Search Users’ Home Directories for Scripts and Print a Confirmation Statement

You can use a `for` loop to search through users' home directories for scripts and print a confirmation statement for each script found.

### Example
```bash
#!/bin/bash
for user in /home/*; do
  if [ -d "$user" ]; then
    for script in "$user"/*.sh; do
      if [ -f "$script" ]; then
        echo "Found script: $script"
      fi
    done
  fi
done
```

### 3. Loop Through Scripts in Your Scripts Folder and Change the Permissions to Execute

You can use a `for` loop to iterate through all scripts in your `~/scripts` folder and change their permissions to make them executable.

### Example
```bash
#!/bin/bash
for script in ~/scripts/*.sh; do
  if [ -f "$script" ]; then
    chmod +x "$script"
    echo "Changed permissions to execute for: $script"
  fi
done
```

### 4. Create a `for` Loop that Moves Through a Group of Files and Creates a Hash of Each File

You can use a `for` loop to iterate through a group of files and create a hash (e.g., SHA256) of each file.

### Example
```bash
#!/bin/bash
for file in ~/files/*; do
  if [ -f "$file" ]; then
    sha256sum "$file" > "$file".sha256
    echo "Created hash for: $file"
  fi
done
```

---

This document provides a comprehensive guide to using `for` loops in Bash scripts to run through a list of packages, search users' home directories for scripts, change permissions on scripts, and create hashes of files.
```