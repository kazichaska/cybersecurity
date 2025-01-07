
### Windows System Administration Tasks

To perform common system administration tasks effectively, follow these step-by-step instructions.

---

#### 1. **Audit Processes with Task Manager**

Use Task Manager to monitor and manage system performance.

1. Open Task Manager:
   - Press `Ctrl + Shift + Esc` or right-click on the taskbar and select **Task Manager**.
2. View active processes under the **Processes** tab.
3. End unresponsive or unnecessary tasks:
   - Select the process and click **End Task**.

---

#### 2. **Use Command Line for Information Gathering and File Management**

The Command Prompt (CMD) allows you to gather system information and manage files.

1. Open Command Prompt:
   - Press `Win + R`, type `cmd`, and press **Enter**.
2. Gather system information:
   ```bash
   systeminfo
   ```
3. Create a new file or directory:
   ```bash
   echo "Sample Text" > sample.txt
   mkdir NewFolder
   ```
4. List files in a directory:
   ```bash
   dir
   ```

---

#### 3. **Enforce Password Policies**

Strengthen system security by configuring password requirements.

1. Open Local Group Policy Editor:
   - Press `Win + R`, type `gpedit.msc`, and press **Enter**.
2. Navigate to:
   `Computer Configuration > Windows Settings > Security Settings > Account Policies > Password Policy`
3. Configure policies such as:
   - **Minimum password length**
   - **Password complexity requirements**
   - **Password expiration**

---

#### 4. **Manage Users**

Create and manage user accounts to control access.

1. Open Command Prompt as Administrator:
   - Search for `cmd`, right-click, and select **Run as administrator**.
2. Add a new user:
   ```bash
   net user username password /add
   ```
3. Add a user to a group:
   ```bash
   net localgroup groupname username /add
   ```
4. Delete a user account:
   ```bash
   net user username /delete
   ```

---

#### 5. **Automate Tasks**

Use Task Scheduler to automate repetitive tasks.

1. Open Task Scheduler:
   - Press `Win`, search for **Task Scheduler**, and open it.
2. Create a new task:
   - Click **Create Task** and provide a name and description.
3. Configure triggers:
   - Set the conditions under the **Triggers** tab (e.g., schedule or event-based).
4. Configure actions:
   - Set the program/script to run under the **Actions** tab (e.g., a batch file).

---

### Summary of Commands and Tools

1. **Task Manager**:
   - Open: `Ctrl + Shift + Esc` or right-click the taskbar.
   - End Task: Select process → Click **End Task**.

2. **Command Prompt**:
   - Gather system info: `systeminfo`
   - Create file: `echo "Sample Text" > sample.txt`
   - Create folder: `mkdir NewFolder`
   - List directory: `dir`

3. **Password Policies**:
   - Use Local Group Policy Editor (`gpedit.msc`).

4. **User Management**:
   - Add user: `net user username password /add`
   - Add to group: `net localgroup groupname username /add`
   - Delete user: `net user username /delete`

5. **Task Scheduler**:
   - Automate tasks based on triggers and actions.

---

Now, you're equipped to manage Windows systems effectively and automate tasks for improved productivity. Let me know if you'd like to expand on any of these topics!