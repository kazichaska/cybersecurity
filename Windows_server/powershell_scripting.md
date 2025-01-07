
### PowerShell for Windows Management

This guide outlines how to use PowerShell for navigating Windows, managing files, retrieving system logs, and combining advanced scripting concepts.

---

#### 1. **Basic PowerShell Cmdlets for Navigation and File Management**

PowerShell provides cmdlets for working with directories and files.

1. **Navigate the File System**:
   - List files and directories:
     ```powershell
     Get-ChildItem
     ```
   - Change directory:
     ```powershell
     Set-Location <Path>
     ```
   - View current directory:
     ```powershell
     Get-Location
     ```

2. **Manage Files and Directories**:
   - Create a directory:
     ```powershell
     New-Item -Path <Path> -ItemType Directory
     ```
   - Create a file:
     ```powershell
     New-Item -Path <Path\FileName.txt> -ItemType File
     ```
   - Copy a file:
     ```powershell
     Copy-Item -Path <SourcePath> -Destination <DestinationPath>
     ```
   - Delete a file or directory:
     ```powershell
     Remove-Item -Path <Path>
     ```

---

#### 2. **Retrieve System Event Logs Using Pipelines**

PowerShell pipelines streamline operations by chaining cmdlets to process and filter data.

1. **Retrieve System Event Logs**:
   - List available event logs:
     ```powershell
     Get-EventLog -List
     ```
   - Retrieve entries from a specific log (e.g., Application log):
     ```powershell
     Get-EventLog -LogName Application
     ```
   - Filter logs by event type (e.g., Error):
     ```powershell
     Get-EventLog -LogName Application -EntryType Error
     ```
   - Combine cmdlets with pipelines to count specific log types:
     ```powershell
     Get-EventLog -LogName Application -EntryType Error | Measure-Object
     ```

---

#### 3. **Combine Shell Scripting Concepts**

PowerShell scripts allow combining cmdlets, parameters, conditions, and file imports for complex automation.

1. **Use Parameters and Conditions**:
   - Example: Check if a directory exists and create it if not:
     ```powershell
     $Path = "C:\ExampleFolder"
     if (-Not (Test-Path -Path $Path)) {
         New-Item -Path $Path -ItemType Directory
         Write-Host "Directory created at $Path"
     } else {
         Write-Host "Directory already exists at $Path"
     }
     ```

2. **Import and Process Files**:
   - Import a CSV file and process its contents:
     ```powershell
     $Data = Import-Csv -Path "C:\ExampleData.csv"
     foreach ($Row in $Data) {
         Write-Host "Processing item: $($Row.Name)"
     }
     ```

3. **Define and Use Data Structures**:
   - Create a custom object for structured data:
     ```powershell
     $User = [PSCustomObject]@{
         Name  = "John Doe"
         Role  = "Administrator"
         Active = $true
     }
     Write-Host "User Info: $($User.Name), Role: $($User.Role), Active: $($User.Active)"
     ```

4. **Combine Cmdlets in a Script**:
   - Example script to archive and delete old log files:
     ```powershell
     $LogPath = "C:\Logs"
     $ArchivePath = "C:\ArchivedLogs"
     Get-ChildItem -Path $LogPath -Filter "*.log" -Recurse | Where-Object {
         $_.LastWriteTime -lt (Get-Date).AddDays(-30)
     } | ForEach-Object {
         Move-Item -Path $_.FullName -Destination $ArchivePath
         Write-Host "Archived file: $($_.Name)"
     }
     ```

---

### Summary of Key Cmdlets and Concepts

1. **Navigation and File Management**:
   - `Get-ChildItem`, `Set-Location`, `New-Item`, `Remove-Item`.

2. **System Event Logs**:
   - `Get-EventLog`, pipelines (`|`), filtering (`Where-Object`).

3. **Advanced Scripting**:
   - Parameters: `$Variable`
   - Conditions: `if`, `else`
   - File import: `Import-Csv`
   - Data structures: `[PSCustomObject]`
   - Combining cmdlets for automation.

---