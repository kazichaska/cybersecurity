````markdown
# Cybersecurity Glossary and Introduction

## Linux Server Administration

### Backup and Recovery
- **Full Backup**: Complete copy of all selected data
- **Incremental Backup**: Backup of data changed since the last backup
- **Differential Backup**: Backup of data changed since the last full backup
- **tar**: Tape Archive tool for creating archives and backups
  - Common options: `-cvf` (create), `-xvf` (extract), `-tvf` (list)

### Cron Jobs and Automation
- **crontab**: Tool for scheduling regular tasks
- **cron syntax**: Five-field time specification (minute, hour, day, month, weekday)
- **Maintenance scripts**: Automated system maintenance tasks
- **Security scripts**: Automated security checks and monitoring

### Bash Scripting
- **Variables**: Store and manipulate data in scripts
- **if statements**: Conditional execution in scripts
- **Lists**: Arrays of data in Bash
- **for loops**: Iterate through lists or sequences
- **Compound commands**: Combining commands with `&&`, `|`, and redirects

## Windows Server Administration

### Active Directory
- **Domain Controllers**: Servers managing authentication and authorization
- **Organizational Units (OUs)**: Containers for organizing AD objects
- **Group Policy Objects (GPOs)**: Settings applied to users and computers
- **Sites and Subnets**: Network topology in Active Directory

### System Administration
- **Task Manager**: Monitor and manage processes and performance
- **Services**: Background processes providing system functionality
- **Startup Applications**: Programs that run at system boot
- **User Permissions**: Access control for users and groups

### SCCM (System Center Configuration Manager)
- **Software Update Groups**: Collections of updates for deployment
- **Deployment**: Process of distributing updates to systems
- **Compliance**: Monitoring update installation status
- **Test Environment**: Isolated environment for testing updates

### Security Concepts
- **User Space Attacks**: Malicious activities in user-accessible areas
- **Common Malware Locations**:
  - C:\Windows\Tasks
  - C:\Windows\Temp
  - C:\Users\<username>\AppData
- **Process Analysis**: Identifying suspicious processes
- **Service Verification**: Validating legitimate Windows services

## Best Practices

### Documentation
- **Structure Documentation**: Recording system organization
- **Change Logs**: Tracking modifications to systems
- **Policy Documentation**: Recording security and configuration policies

### Security
- **Principle of Least Privilege**: Give minimum necessary permissions
- **Regular Updates**: Keep systems patched and current
- **Monitoring**: Regular system and security monitoring
- **Backup Strategy**: Regular backups following 3-2-1 rule

### Testing
- **Test Environment**: Isolated environment for testing changes
- **Validation**: Verifying changes before production deployment
- **Rollback Plans**: Procedures for reverting changes

---

This glossary provides a high-level overview of key concepts covered in the cybersecurity repository. Each term links to more detailed documentation in the respective sections.
````