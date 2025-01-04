# Summary Report

## Checklist of Completed Tasks

- [x] Gathered details from sshd configuration file
- [x] Updated packages and services
- [x] Upgraded packages
- [x] Listed all installed packages
- [x] Displayed logging configuration data
- [x] Displayed logrotate configuration data
- [x] Scheduled `hardening_script1.sh` to run once a month on the first of the month using cron
- [x] Scheduled `hardening_script2.sh` to run once a week every Monday using cron

## Summary of Findings and Security Concerns

### SSH Configuration
- **Findings**: The SSH configuration file was successfully gathered and reviewed.
- **Concerns**: Ensure that SSH is configured with strong security settings, such as disabling root login and using key-based authentication.

### Package Management
- **Findings**: Packages and services were updated and upgraded to the latest versions.
- **Concerns**: Regular updates are crucial to patch vulnerabilities. Ensure that automatic updates are configured where possible.

### Installed Packages
- **Findings**: A comprehensive list of installed packages was generated.
- **Concerns**: Review installed packages for any unnecessary or potentially vulnerable software. Remove or replace as needed.

### Logging Configuration
- **Findings**: Logging configuration data from `journald.conf` and `logrotate.conf` was successfully gathered.
- **Concerns**: Ensure that logging is configured to capture all relevant security events and that logs are rotated and archived securely.

### Permissions and Access Control
- **Findings**: Permissions for engineering and finance scripts were updated to restrict access to the respective groups.
- **Concerns**: Regularly review and audit file permissions to ensure that sensitive data is protected from unauthorized access.

### Backup and Recovery
- **Findings**: A backup script was created to archive the `/home/sysadmin` directory.
- **Concerns**: Ensure that backups are performed regularly and stored securely. Test recovery procedures to verify that backups can be restored successfully.

### Scheduling and Automation
- **Findings**: Scripts were scheduled using cron to run at specified intervals.
- **Concerns**: Regularly review and update scheduled tasks to ensure they align with current security policies and operational requirements.

## Conclusion

Overall, the hardening scripts and scheduled tasks have significantly improved the security posture of the system. However, continuous monitoring, regular updates, and periodic audits are essential to maintain and enhance security. Addressing the identified concerns and implementing best practices will further strengthen the system's defenses against potential threats.

---

Submit this report in BootcampSpot as part of your project submission.