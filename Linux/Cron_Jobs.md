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


**Output of crontab command to check whether crontab is installed or not**

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

**Practice-1** Manual way of creating a file

The file.sh script contains a simple bash script that creates a new file named testfile in the /home/thor directory. When executed, the script writes "HELLO WORLD" to the newly created file. You can verify the contents of the file by running the cat command on testfile.

pwd # This will give the output where the new file will be created and also it is the location of the file cron_file.sh

**Script -1**

vi file.sh
```
#!/bin/bash
OUTPUT_PATH="/home/thor"
echo "HELLO WORLD" > "$OUTPUT_PATH/testfile"
```

**Script -2**
If you want to append to the file instead of overwriting it, you can use >> instead of >:

vi file.sh
```
#!/bin/bash
OUTPUT_DIR="/home/thor"
echo "HELLO WORLD" >> "$OUTPUT_DIR/cron_testfile"
```

Explanation of what the above script does:

- #!/bin/bash specifies the interpreter that should be used to run the script.
- echo "HELLO WORLD" outputs the string "HELLO WORLD".
- > testfile redirects the output to a file named testfile. If the file doesn't exist, it will be created. If it does exist, its contents will be overwritten.

To run this script:

1. Save it to a file, for example, file.sh.
2. Make the file executable by running the command chmod +x script.sh.
3. Run the script by executing ./file.sh in the terminal.

After running the script, you should see a new file named cron_testfile in the same directory, containing the text "HELLO WORLD".
**Note:** Also, avoid using PATH as a variable name in your script, as it's a reserved variable in Linux that specifies the directories where executable files are located. Instead, I've used OUTPUT_PATH in the example above.
Add execute permissions to the script.
```
cmod +x file.sh
```

Run the following command to execute the file:
```
./file.sh # Command to run the bash script
```
Alternative:

If you're not comfortable with changing permissions, you can also run the script using the bash command:


bash
bash cron_file.sh

This will execute the script without requiring execute permissions.

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


To ensure cron service starts automatically on boot:
You can enable the cron service to start automatically on boot:

bash
```
sudo systemctl enable crond.service
```
This way, you won't need to manually start the service every time you reboot your system

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
**Always makesure the script has execute permissions (chmod +x /home/thor/cron_file.sh) and the shebang line (#!/bin/bash) is correctly specified.**
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
**The syntax * * * * * /home/thor/cron_file.sh is called a cron expression or cron job syntax.**

Here's a breakdown of the five asterisks (*) and what they represent:

1. Minute (0-59): * means every minute
2. Hour (0-23): * means every hour
3. Day of the month (1-31): * means every day of the month
4. Month (1-12): * means every month
5. Day of the week (0-6): * means every day of the week (0 = Sunday, 1 = Monday, ..., 6 = Saturday)

The cron expression specifies when the command /home/thor/cron_file.sh should be executed. In this case, the command will be executed every minute, every hour, every day of the month, every month, and every day of the week.

Common cron expression examples:

- * * * * * : Run every minute
- 0 * * * * : Run every hour (at minute 0)
- 0 0 * * * : Run every day at midnight
- 0 0 1 * * : Run on the 1st day of every month at midnight
- 0 0 * * 0 : Run every Sunday at midnight

The cron expression is a powerful way to schedule tasks in Unix-like systems, and it's widely used for automating system maintenance, backups, and other repetitive tasks.
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



### Timestamps are repeated in the output or repeated timestamps

Output: following is the output - 
HELLO WORLD Wed Jul 30 06:05:01 UTC 2025
HELLO WORLD Wed Jul 30 06:06:01 UTC 2025
HELLO WORLD Wed Jul 30 06:06:01 UTC 2025
HELLO WORLD Wed Jul 30 06:07:01 UTC 2025
HELLO WORLD Wed Jul 30 06:07:01 UTC 2025
HELLO WORLD Wed Jul 30 06:08:01 UTC 2025
HELLO WORLD Wed Jul 30 06:08:02 UTC 2025
HELLO WORLD Wed Jul 30 06:09:01 UTC 2025
HELLO WORLD Wed Jul 30 06:09:01 UTC 2025

Solution:
The output shows that the cron job is running successfully and appending "HELLO WORLD" with the current timestamp to the file every minute.

However, you might notice that some timestamps are repeated (e.g., 06:06:01 UTC 2025 appears twice). This could be due to one of the following reasons:

1. Multiple cron jobs: Make sure you don't have multiple cron jobs running the same script. Check your crontab file for any duplicate entries.
2. Script execution time: If the script takes longer than expected to execute, it might be triggered again before the previous execution completes, resulting in duplicate timestamps.
3. System clock: Although unlikely, system clock issues or NTP synchronization might cause timestamp discrepancies.

If you're concerned about the duplicate timestamps, you can modify the script to log more detailed information, such as the process ID or a unique identifier, to help you understand the execution pattern.

Additional suggestion:

To make the output more readable, you could modify the script to include a line break or a separator between each execution:

bash
echo "-------------------------" >> "$OUTPUT_DIR/testfile"
echo "HELLO WORLD $(date)" >> "$OUTPUT_DIR/testfile"

This will add a line break with a separator, making it easier to distinguish between each execution.
By following these steps, you should be able to create a simple cron job that runs a bash script every minute, appending "HELLO WORLD" with a timestamp to a file.


## Using an environment variable in a cron job:

Let's say you want to use an environment variable LOG_FILE to specify the log file path for a cron job.

Step 1: Define the environment variable in the crontab file

You can define environment variables directly in the crontab file using the VAR=value syntax. Here's an example:


bash
LOG_FILE=/var/log/my_job.log
*/15 * * * * /path/to/your/script.sh >> $LOG_FILE 2>&1


In this example:

- LOG_FILE is the environment variable.
- /var/log/my_job.log is the value assigned to the LOG_FILE variable.
- The cron job runs every 15 minutes and appends the output to the log file specified by LOG_FILE.

Note: Environment variables defined in the crontab file are only available to the cron jobs defined in that file.

Alternative approach:

If you have many environment variables or want to keep them separate from the crontab file, you can define them in a separate file (e.g., ~/.bashrc or /etc/environment) and then source that file in your cron job.

For example, you can add the following line to your cron job:


bash
*/15 * * * * source ~/.bashrc && /path/to/your/script.sh >> $LOG_FILE 2>&1


Assuming you've defined LOG_FILE in ~/.bashrc.

Syntax:

The general syntax for defining environment variables in a crontab file is:


bash
VAR=value


You can define multiple environment variables by adding more VAR=value lines.

Tips:

- Use >> to append output to the log file instead of overwriting it.
- Use 2>&1 to redirect both stdout and stderr to the log file.

By using environment variables in your cron jobs, you can make your scripts more flexible and easier to maintain.

## Troubleshoot

Case : 1
The issue might be due to the script overwriting the file every minute with the same content. However, if the file is not being created at all, it's likely due to one of the following reasons:

1. Permission issues: Make sure the cron job has permission to write to the /home/thor directory.
2. Script not executing: Ensure the script has execute permissions (chmod +x /home/thor/cron_file.sh).
3. Cron job not running: Check the system logs to see if the cron job is running successfully.

**To troubleshoot, you can modify the script to append to the file instead of overwriting it, and also add some logging to see if the script is running:**


bash
#!/bin/bash
OUTPUT_PATH="/home/thor"
echo "HELLO WORLD $(date)" >> "$OUTPUT_PATH/cron_testfile" 2>&1


This will append the current date and time to the file every minute, along with any error messages.

Also, ensure that the cron daemon is running:

- On systemd-based systems: sudo systemctl status cron
- On non-systemd systems: sudo service cron status

If the cron daemon is not running, start it:

- On systemd-based systems: sudo systemctl start cron
- On non-systemd systems: sudo service cron start

Check cron logs:

You can also check the system logs to see if there are any errors related to the cron job:

- On Ubuntu/Debian-based systems: grep CRON /var/log/syslog
- On Red Hat/Fedora-based systems: journalctl -u crond

By adding logging and checking the system logs, you should be able to identify the issue and fix it.



## crond
is a daemon (a background process) that runs on Unix-like systems, including Linux. It's responsible for executing scheduled tasks, known as cron jobs, at specified intervals.

Here's a breakdown of what crond does:

1. Reads cron tables: crond reads the cron tables (crontabs) for each user, including the system crontab.
2. Schedules tasks: Based on the crontab entries, crond schedules tasks to run at specific times or intervals, such as every minute, hour, day, or month.
3. Executes tasks: When the scheduled time arrives, crond executes the corresponding task, which can be a command, script, or program.
4. Logs activity: crond typically logs its activity, including successful and failed job executions, to system logs.

In the context of the previous command, sudo systemctl start crond starts the crond daemon, allowing it to manage and execute scheduled cron jobs on the system.

crond is an essential component of Unix-like systems, enabling automation of repetitive tasks, maintenance, and other system administration activities.

## 
