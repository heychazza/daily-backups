# Daily Backups

A simple script that allows me to automate my database backups, you just need to copy `.env.example` to `.env`, add your DB credentials and thats it. Then run `./backup.sh` to backup your database to a gzipped file.

## Automation
If you've like to do this, I'd hugely recommend configuring a cronjob, and running at night - such as;
```
00 00 * * * path/to/your/backup.sh
```
This will run every night at exactly midnight.
