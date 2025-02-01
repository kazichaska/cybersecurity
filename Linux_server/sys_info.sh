#!/bin/bash

# Protect script from running as root
if [ "$(id -u)" -eq 0 ]; then
        echo "Error: Do not run this script as root or with sudo!"
        exit 1
fi

if [ ! -d ~/research ]; then
        # Create research directory if it doesn't exist
        mkdir -p ~/research
fi

OUTPUT_FILE="/home/sysadmin/research/sys_info.txt"

if [ -f "$OUTPUT_FILE" ]; then
        rm -f "$OUTPUT_FILE"
fi

# Clear previous output file if it exists
> "$OUTPUT_FILE"

# Capture IP Address
IP_INFO=$(ip addr | grep inet | tail -2 | head -1)

# Capture Files with 777 permission
HOME_PERM=$(find /home/sysadmin -type f -perm 777)

# Write system information to sys_info.txt
echo "System Audit Script - $(date)" >> "$OUTPUT_FILE"
echo "======================================" >> "$OUTPUT_FILE"

# Write IP info to the file
echo -e "\nIP Address Information:" >> "$OUTPUT_FILE"
echo "$IP_INFO" >> "$OUTPUT_FILE"

# Find executable files in home directory and append to sys_info.txt
echo -e "\nExecutable Files in /home:" >> "$OUTPUT_FILE"
find /home -type f -name "*.sh" -perm /a+x >> "$OUTPUT_FILE"

# Find top 10 processes consuming CPU and append to sys_info.txt
"sys_info1.sh" 51L, 1492C                                                                           6,7-14        Top
#!/bin/bash

# Protect script from running as root
if [ "$(id -u)" -eq 0 ]; then
        echo "Error: Do not run this script as root or with sudo!"
        exit 1
fi

if [ ! -d ~/research ]; then
        # Create research directory if it doesn't exist
        mkdir -p ~/research
fi

OUTPUT_FILE="/home/sysadmin/research/sys_info.txt"

if [ -f "$OUTPUT_FILE" ]; then
        rm -f "$OUTPUT_FILE"
fi

# Clear previous output file if it exists
> "$OUTPUT_FILE"

# Capture IP Address
IP_INFO=$(ip addr | grep inet | tail -2 | head -1)

# Capture Files with 777 permission
HOME_PERM=$(find /home/sysadmin -type f -perm 777)

# Write system information to sys_info.txt
echo "System Audit Script - $(date)" >> "$OUTPUT_FILE"
echo "======================================" >> "$OUTPUT_FILE"

# Write IP info to the file
echo -e "\nIP Address Information:" >> "$OUTPUT_FILE"
echo "$IP_INFO" >> "$OUTPUT_FILE"

# Find executable files in home directory and append to sys_info.txt
echo -e "\nExecutable Files in /home:" >> "$OUTPUT_FILE"
find /home -type f -name "*.sh" -perm /a+x >> "$OUTPUT_FILE"

# Find top 10 processes consuming CPU and append to sys_info.txt
echo -e "\nTop 10 CPU-Consuming Processes:" >> "$OUTPUT_FILE"
ps aux --sort=-%cpu | awk '{print $1, $2, $3, $4, $11}' | head -n 11 >> "$OUTPUT_FILE"

# Write 777 permission files to the file
echo -e "\nFiles with 777 Permissions:" >> "$OUTPUT_FILE"
echo "$HOME_PERM" >> "$OUTPUT_FILE"

# Indicate completion
echo "Script execution completed. Output saved to $OUTPUT_FILE"