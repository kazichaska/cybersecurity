```markdown
# Windows System Administration

## Audit Processes with Task Manager

Task Manager is a powerful tool for monitoring and managing processes on a Windows system.

### Steps to Audit Processes
1. **Open Task Manager**:
   - Press `Ctrl + Shift + Esc` to open Task Manager directly.
   - Alternatively, press `Ctrl + Alt + Delete` and select "Task Manager".

2. **View Running Processes**:
   - Click on the "Processes" tab to see a list of all running processes.
   - You can sort the processes by CPU, Memory, Disk, or Network usage by clicking on the respective column headers.

3. **Identify Resource-Intensive Processes**:
   - Look for processes that are using a high amount of CPU, Memory, Disk, or Network resources.
   - Right-click on a process and select "End Task" to terminate it if necessary.

## Use the Command Line to Gather Information and Create Files

The Command Prompt (CMD) allows you to perform various administrative tasks using commands.

### Gather System Information
- **System Information**:
  ```cmd
  systeminfo
  ```

- **Network Configuration**:
  ```cmd
  ipconfig /all
  ```

### Create Files
- **Create a Text File**:
  ```cmd
  echo This is a test file. > testfile.txt
  ```

- **View File Contents**:
  ```cmd
  type testfile.txt
  ```

## Enforce Password Policies

Password policies can be enforced using the Group Policy Editor (`gpedit.msc`).

### Steps to Enforce Password Policies
1. **Open Group Policy Editor**:
   - Press `Win + R` to open the Run dialog.
   - Type `gpedit.msc` and press Enter.

2. **Navigate to Password Policy**:
   - Go to `Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy`.

3. **Configure Password Policies**:
   - Set policies such as minimum password length, password complexity requirements, and password expiration.

## Manage Users

User accounts can be managed using the `net` command in the Command Prompt.

### Create a New User
```cmd
net user username password /add
```
- Example:
  ```cmd
  net user newuser password123 /add
  ```

### Delete a User
```cmd
net user username /delete
```
- Example:
  ```cmd
  net user newuser /delete
  ```

### View User Information
```cmd
net user username
```
- Example:
  ```cmd
  net user newuser
  ```

## Automate Tasks

Tasks can be automated using Task Scheduler.

### Steps to Automate Tasks
1. **Open Task Scheduler**:
   - Press `Win + R` to open the Run dialog.
   - Type `taskschd.msc` and press Enter.

2. **Create a Basic Task**:
   - In the Task Scheduler, click on "Create Basic Task" in the Actions pane.
   - Follow the wizard to set up the task, including the name, trigger (schedule), and action (command or script to run).

### Example: Schedule a Script to Run Daily
1. **Open Task Scheduler**.
2. **Click "Create Basic Task"**.
3. **Name the Task** (e.g., "Daily Backup").
4. **Set the Trigger to "Daily"** and specify the time.
5. **Set the Action to "Start a program"** and browse to the script you want to run.
6. **Finish the Wizard** to create the task.