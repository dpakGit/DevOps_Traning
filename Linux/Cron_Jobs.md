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

The file.sh script contains a simple bash script that creates a new file named testfile in the /home/thor directory. When executed, the script writes "HELLO WORLD" to the newly created file. You can verify the contents of the file by running the cat command on testfile.

pwd # This will give the output where the new file will be created and also it is the location of the file cron_file.sh

vi file.sh
```
bash
#!/bin/bash
OUTPUT_PATH="/home/thor"
echo "HELLO WORLD" > "$OUTPUT_PATH/testfile"
```
cmod +x file.sh
./file.sh # Command to run the bash script
ls
cat testfile 

Output: HELLO WORLD

**Practice-2**
### Now lets create the file using cron job

Cron Job Project

Project Description:

This project demonstrates how to create a simple cron job that runs a bash script every minute, appending "HELLO WORLD" with a timestamp to a file named testfile in a specified directory.

Project Structure:

- file.sh: The bash script that appends "HELLO WORLD" with a timestamp to the testfile.

- crontab: The cron job syntax that runs the file.sh script every minute.

Step-by-Step Guide:

Check the location where file.sh is created and where the new testfile willbe created by using the commnad pwd

Step 1: Create the Bash Script
Create a new file named file.sh with the following contents:
```
bash
#!/bin/bash
OUTPUT_DIR="/home/thor" This is the location where the file.sh is created ,this path can be derived by running the pwd command before creating this file
# To make the output more readable, you could modify the script to include a line break or a separator between each execution
echo "---------------------------------------" >> "$OUTPUT_DIR/testfile" # 
echo "HELLO WORLD $(date)" >> "$OUTPUT_DIR/testfile"
```
This script appends "HELLO WORLD" with the current date and time to the testfile in the specified directory.

Step 2: Make the Script Executable
Run the following command to make the script executable:
```
bash
chmod +x file.sh
```

This command adds execute permissions to the script, allowing it to be run by the cron job.

Step 3: Create the Cron Job
Open the crontab editor by running:

bash
crontab -e

Add the following cron job syntax:
```
bash
* * * * * /home/thor/file.sh
```

This syntax runs the file.sh script every minute.

Step 4: Verify the Cron Job
After setting up the cron job, wait for a minute or two and check the /home/thor/testfile to see if it's being updated with the "HELLO WORLD" message and timestamp.
ls
date
cat testfile
Example Output:

The testfile should contain multiple lines of "HELLO WORLD" with different timestamps, like this:

HELLO WORLD Mon Jul 29 14:30:00 UTC 2024
----------------------------------------
HELLO WORLD Mon Jul 29 14:31:00 UTC 2024
----------------------------------------
HELLO WORLD Mon Jul 29 14:32:00 UTC 2024

Troubleshooting:

- Make sure the script has execute permissions and the cron job syntax is correct.
- Check the system logs for any errors related to the cron job.
- Verify that the testfile is being created in the specified directory.

By following these steps, you should be able to create a simple cron job that runs a bash script every minute, appending "HELLO WORLD" with a timestamp to a file.

 **Cron expression or cron job syntax**
* * * * * /home/thor/file.sh
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

