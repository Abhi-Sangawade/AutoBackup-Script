# Automated Linux Backup Script
Overview
This project provides a Bash script to automate the backup process for system files, directories, and MySQL databases. It also includes encryption, AWS S3 upload, and automated cleanup of old backups.

Features
✅ Backup important directories (/home, /etc, /var/log, /var/www/html).
✅ MySQL database backup with secure credentials.
✅ Compress and encrypt backups using AES-256 encryption.
✅ Automatically upload backups to AWS S3 for cloud storage.
✅ Remove old backups (older than 7 days) to save storage.
✅ Email notifications for backup status.


Prerequisites
Ensure the following are installed on your Linux system:

✅ Bash Shell (/bin/bash)
✅ tar (For file compression)
✅ mysqldump (For database backup)
✅ openssl (For encryption)
✅ AWS CLI (For S3 uploads)

Installation & Usage
1️⃣ Clone the repository
2️⃣ Edit the script (backup.sh) to configure
3️⃣ Make the script executable & run it: 
  chmod +x backup.sh
  ./backup.sh
4️⃣ Automate using cron job
