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


## Steps to Install cronie package and start crond service :
You can install the cronie package and start the crond service using the following commands. These commands assume you're using a package manager like yum (for RHEL/CentOS systems):

### 1. Check Status
systemctl status crond.service:

This command checks the current status of the crond.service systemd service.

- systemctl: This is the command-line utility for managing systemd services.
- status: This option displays the current status of the service.
- crond.service: This is the name of the service being queried, which is the cron daemon service.

The output will show whether the service is:

- active (running): The service is currently running.
- inactive (dead): The service is not running.
- failed: The service has failed to start or has crashed.

### 2. Install cronie package
sudo yum install -y cronie

### 3. Start crond service
sudo systemctl start crond.service
Or
sudo systemctl start crond

This command starts the crond.service systemd service.

- sudo: This command prefix is used to run the command with superuser (root) privileges, which is required to manage systemd services.
- systemctl: Same as above.
- start: This option starts the specified service.
- crond.service: Same as above.

When you run this command, systemd will attempt to start the cron daemon service. If the service starts successfully, you won't see any output.

### 4. Rerun Status
systemctl status crond.service (again):

After starting the service, you can run this command again to verify that the service is indeed running.

The output should now show that the service is active (running), indicating that the cron daemon is running and ready to execute scheduled tasks.

### 5. Enable crond service to start on boot
sudo systemctl enable crond

*sudo systemctl enable crond:*

This command enables the crond systemd service to start automatically on boot.

- sudo: Same as before, this prefix is used to run the command with superuser (root) privileges.
- systemctl: Same as before, this is the command-line utility for managing systemd services.
- enable: This option enables the specified service to start automatically on boot.
- crond: This is the name of the service being enabled, which is the cron daemon service.

When you run this command, systemd will configure the crond service to start automatically when the system boots up. This ensures that the cron daemon is running and can execute scheduled tasks even after a system reboot.

*What's the difference between start and enable?*

- start: Starts the service immediately, but doesn't affect the service's behavior on boot.
- enable: Configures the service to start automatically on boot, but doesn't start the service immediately.

To both start the service immediately and enable it to start on boot, you can use:

bash
sudo systemctl start crond
sudo systemctl enable crond

Or, you can use the --now option with enable to achieve the same result:

bash
sudo systemctl enable --now crond

This will both enable the service to start on boot and start it immediately.

When you run this command, systemd will attempt to start the cron daemon service. If the service starts successfully, you won't see any output.

1. Checking the initial status of the cron service.
2. Starting the cron service if it's not already running.
3. Verifying that the service has started successfully.

These commands are essential for managing and troubleshooting systemd services, including the cron daemon.



## Cron Job Project


**Practice-2 Now lets create the the above file that we created in Practice - 1 using cron job**


Project Description:

This project demonstrates how to create a simple cron job that runs a bash script every minute, appending "HELLO WORLD" with a timestamp to a file named testfile in a specified directory.

Project Structure:

- file.sh: The bash script that appends "HELLO WORLD" with a timestamp to the testfile.

- crontab: The cron job syntax that runs the file.sh script every minute.

Step-by-Step Guide:

Check the location where file.sh is created and where the new testfile willbe created by using the commnad pwd
Output: /home/thor

Step 1: Create the Bash Script
Create a new file named file.sh with the following contents:
```
bash
#!/bin/bash
OUTPUT_DIR="/home/thor" # This is the location where the file.sh is created ,this path can be derived by running the pwd command before creating this file
# To make the output more readable, you could modify the script to include a line break or a separator between each execution
echo "---------------------------------------" >> "$OUTPUT_DIR/testfile" # 
echo "HELLO WORLD $(date)" >> "$OUTPUT_DIR/testfile"
```
This script appends "HELLO WORLD" with the current date and time to the testfile in the specified directory.

Step 2: Make the Script Executable
Run the following command to make the script executable: To give execute permission to the file

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
Verify the syntax:
crontab -l

This syntax runs the file.sh script every minute.

Step 4: Verify the Cron Job
After setting up the cron job, wait for a minute or two and check the /home/thor/testfile to see if it's being updated with the "HELLO WORLD" message and timestamp.
ls # Verify that the testfile is being created in the specified directory.
date
cat testfile # cat on testfile to see the contents

Example Output:

The testfile should contain multiple lines of "HELLO WORLD" with different timestamps, like this:

HELLO WORLD Mon Jul 29 14:30:00 UTC 2024
::::::::::::::::::::::::::
HELLO WORLD Mon Jul 29 14:31:00 UTC 2024
:::::::::::::::::::::::::::::
HELLO WORLD Mon Jul 29 14:32:00 UTC 2024


By following these steps, you should be able to create a simple cron job that runs a bash script every minute, appending "HELLO WORLD" with a timestamp to a file.

 **Output of crontab command**

root@jumphost /home/thor# crontab
```
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
```

