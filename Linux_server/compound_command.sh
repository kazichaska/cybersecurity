# Create a research directory and copy all system logs along with the shadow, passwd, and hosts files in one long command.
mkdir -p ~/research && cp /var/log/* /etc/shadow /etc/passwd /etc/hosts ~/research/

# Create a list of all executable files in the home folder and save it to a text file in the research folder with one long command.
find /home/sysadmin -type f -name "*.sh" > ~/research/executable_files.txt

# Create a list of the 10 most active processes. The list should only contain USER, PID, %CPU, %MEM, and COMMAND. Save this list to a text file in your research directory with one long command.
ps aux --sort=-%cpu | head -n 11 | awk '{print $1, $2, $3, $4, $11}' > ~/research/top_processes.txt

# Bonus: Create a list of home folders along with user info from the passwd file. Only add the user info to your list if the UID is greater than 1,000.
awk -F: '$3 >= 1000 {print $1, $3, $6}' /etc/passwd > ~/research/user_info.txt