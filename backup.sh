# Read environment variables.
set -o allexport; source .env; set +o allexport

# Backup storage directory
backupFolder=storage

# MySQL user
user=$DB_USERNAME
# MySQL password
password=$DB_PASSWORD

# Number of days to store the backup
keep_day=30

fileName=$(date +%d-%m-%Y_%H-%M-%S)
sqlfile=all-database-$fileName.sql
zipfile=$backupFolder/all-database-$fileName.zip

# Create a backup
mysqldump -u $user -p$password --all-databases --single-transaction > $sqlfile
if [ $? == 0 ]; then
  echo '[BACKUP] Successfully created SQL dump.'
else
  echo '[BACKUP] Failed to perform SQL dump.'
  exit
fi
# Compress backup
zip $zipfile $sqlfile
if [ $? == 0 ]; then
  echo '[BACKUP] Successfully compressed SQL dump.'
else
    echo '[BACKUP] Failed to compress SQL dump.'
    exit
fi
    rm $sqlfile
    echo $zipfile
    # Delete old backups
    find $backupfolder -mtime +$keep_day -delete