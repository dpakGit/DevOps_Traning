## Cron Job

1. Cron Jobs: The Complete Guide for 2025:       https://cronitor.io/guides/cron-jobs
   
2. https://notes.kodekloud.com/docs/Learning-Linux-Basics-Course-Labs/Security-and-File-Permissions/Cronjobs

 A cron job in Linux is a scheduled task that the cron daemon (a background process) executes automatically at specified intervals or times. It is a fundamental tool for automating repetitive administrative and maintenance tasks on Unix-like operating systems.
Key Components of a Cron Job:
**Cron Daemon (crond):**

This is the background service that continuously runs and checks for scheduled jobs in the crontab files.
Crontab (Cron Table):
This is the file where cron job entries are stored. Each line in a crontab file represents a single cron job and specifies both the schedule and the command to be executed.

**Cron Expression:**

This is a five-field string that defines the schedule for a cron job. Each field represents a unit of time:

Minute (0-59)

Hour (0-23)

Day of Month (1-31)

Month (1-12 or Jan-Dec)

Day of Week (0-7 or Sun-Sat, where 0 and 7 are Sunday)

Special characters like * (any value), , (list of values), - (range of values), and / (step values) can be used within these fields to create complex schedules.

**How Cron Jobs Work:**

Users or system administrators add entries to their crontab files using the crontab -e command.

The crond daemon constantly monitors these crontab files (located in /var/spool/cron/crontabs/ for individual users and /etc/crontab and /etc/cron.* for system-wide jobs).

When the scheduled time for a job arrives, crond executes the specified command or script.

**Common Uses of Cron Jobs:**

System Maintenance: Automating tasks like log rotation, temporary file cleanup, and system backups.

Application-Specific Tasks: Scheduling database backups, report generation, data synchronization, and sending out email notifications.

Monitoring: Periodically checking the status of services or system resources.

Example of a Cron Job Entry:

Code

0 2 * * * /usr/bin/backup-script.sh

This entry schedules the backup-script.sh to run every day at 2:00 AM.





<img width="1325" height="1080" alt="Screenshot (77)" src="https://github.com/user-attachments/assets/89808330-568b-40d5-b949-d2f282d95a75" />


**Practice-1** Manual way of creating a file

The cron_file.sh script contains a simple bash script that creates a new file named cron_testfile in the /home/thor directory. When executed, the script writes "HELLO WORLD" to the newly created file. You can verify the contents of the file by running the cat command on cron_testfile.

pwd # This will give the output where the new file will be created and also it is the location of the file cron_file.sh

vi cron_file.sh
```
bash
#!/bin/bash
OUTPUT_PATH="/home/thor"
echo "HELLO WORLD" > "$OUTPUT_PATH/cron_testfile"
```
cmod +x cron_file.sh
./cron_file.sh # Command to run the bash script
ls
cat cron_testfile 

Output: HELLO WORLD

**Practice-2**
### Now lets create the file manually using cron job

Output of thr crontab command:
root@jumphost /home/thor# crontab
crontab: usage error: file name or - (for stdin) must be specified
Usage:
 crontab [options] file
 crontab [options]
 crontab -n [hostname]

Options:
 -u <user>  define user
 -e         edit user's crontab
 -l         list user's crontab
 -r         delete user's crontab
 -i         prompt before deleting
 -n <host>  set host in cluster to run users' crontabs
 -c         get host in cluster to run users' crontabs
 -T <file>  test a crontab file syntax
 -s         selinux context
 -V         print version and exit
 -x <mask>  enable debugging

Default operation is replace, per 1003.2

