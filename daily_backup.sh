#!/bin/bash

# Backup Configuration
BACKUP_DIR="/var/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="server_backup_$TIMESTAMP.tar.gz"

# Directories to Backup
SOURCE_DIRS="/home/admin /etc /var/log /var/www/html"

# Database Credentials (Example: MySQL Backup)
DB_USER="backup_admin"
DB_PASS="SecureP@ssw0rd"
DB_NAME="company_db"
DB_BACKUP_FILE="$BACKUP_DIR/db_backup_$TIMESTAMP.sql"

# AWS S3 Configuration 
S3_BUCKET="s3://company-backups"

# Email Notification Settings
EMAIL="admin@company.com"
LOG_FILE="/var/log/backup.log"

# Ensure Backup Directory Exists
mkdir -p "$BACKUP_DIR"

# Backup Files and Directories
tar -czf "$BACKUP_DIR/$BACKUP_FILE" $SOURCE_DIRS

# Backup MySQL Database
mysqldump -u$DB_USER -p$DB_PASS $DB_NAME > "$DB_BACKUP_FILE"

# Upload Backup to AWS S3
aws s3 cp "$BACKUP_DIR/$BACKUP_FILE" "$S3_BUCKET/"

# Clean Up Old Backups 
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

# Log Backup Activity
echo "[$TIMESTAMP] Backup completed successfully!" >> "$LOG_FILE"

# Send Email Notification
mail -s "Daily Backup Completed - $TIMESTAMP" $EMAIL < "$LOG_FILE"
