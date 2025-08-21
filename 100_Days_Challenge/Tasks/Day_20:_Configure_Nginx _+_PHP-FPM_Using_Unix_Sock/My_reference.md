### Task Explanation: Deploying PHP Application on Nautilus Infra
The task involves setting up a PHP-based application on app server 2 (stapp02) in the Stratos DC infrastructure. The production support team has given specific requirements for configuring the infrastructure.

Requirements Breakdown
a. Install nginx on app server 2
- Install Nginx on stapp02.
- Configure Nginx:
- Use port 8092.
- Document root: /var/www/html.

b. Install php-fpm version 8.1
- Install PHP-FPM version 8.1 on stapp02.
- Configure PHP-FPM to use a Unix socket: /var/run/php-fpm/default.sock.
- Create parent directories if they don't exist.

c. Configure php-fpm and nginx to work together
- Set up Nginx to communicate with PHP-FPM via the Unix socket /var/run/php-fpm/default.sock.
- Ensure Nginx passes PHP requests to PHP-FPM for processing.

d. Test the setup
- Use curl http://stapp02:8092/index.php from the jump host to test the website.

Steps to Achieve This
1. Install Nginx on stapp02, configure to listen on port 8092, root /var/www/html.
2. Install PHP-FPM 8.1, configure to use /var/run/php-fpm/default.sock.
3. Configure Nginx to use PHP-FPM via the socket for PHP files.
4. *Test with curl*.

Do you need help with:
- Specific commands to install/configure Nginx and PHP-FPM?
- Troubleshooting Nginx + PHP-FPM setup?
- Something else related to this task?

### *Meaning of listen 80; listen [::]:80;*
- *listen 80;*: Tells Nginx to listen on port 80 for IPv4 connections.
- *listen [::]:80;*: Tells Nginx to listen on port 80 for IPv6 connections.

Why Both?
- Nginx can listen on both IPv4 and IPv6 for the same port (here, port 80).
- Having both lines ensures Nginx binds to:
- IPv4 (listen 80;)
- IPv6 (listen [::]:80;)

Why Not Use One Line?
- IPv4 and IPv6 are separate protocols.
- Specifying both ensures Nginx listens on both stacks.
- Some systems might handle dual-stack differently, so explicit is safer for full coverage.

Do you need help with:
- Configuring Nginx for IPv4/IPv6?
- Understanding IPv4 vs IPv6 differences?
- Something else related to Nginx networking?

### Command to Go to Line 59 in Vi/Vim
In Vi/Vim, to go to a specific line (like line 59):
- Open the file: vi /etc/nginx/nginx.conf
- In command mode, type: :59
- Press Enter. You'll be taken to line 59.

Alternative
- You can also use G to go to a line: 59G

Do you need help with:
- Editing the Nginx config in Vi/Vim?
- Understanding Vi/Vim commands?
- Something else related to editing config files?

### Checking Config Syntax
- Use sudo nginx -t to check for syntax errors in /etc/nginx/nginx.conf.

### Editing Nginx Config Files
- Best practice: Edit the site-specific config in /etc/nginx/sites-available/default.
- Reason:
- /etc/nginx/nginx.conf is the main Nginx config with global settings.
- /etc/nginx/sites-available/default is for site-specific config.
- This keeps site configs modular and separate from main config.

In This Case
- We edited /etc/nginx/sites-available/default to configure the site on port 8095.
- Main nginx.conf typically doesn't need edits for this task.

Do you need help with:
- Understanding Nginx config file structure?
- Managing multiple sites in Nginx?
- Something else related to Nginx config?

### PHP-FPM Unix Socket Config
- You've found the listen directive in /etc/php-fpm.d/www.conf.
- To use the socket /var/run/php-fpm/default.sock, you've set:

listen = /var/run/php-fpm/default.sock

- Permissions for socket:
- listen.owner, listen.group, listen.mode control socket permissions.
- Typically you'd set listen.owner = nginx (if Nginx user is nginx) for Nginx to connect.

Example

listen = /var/run/php-fpm/default.sock
listen.owner = nginx
listen.group = nginx
listen.mode = 0660


Do you need help with:
- Setting correct permissions for the PHP-FPM socket?
- Testing Nginx + PHP-FPM setup after config changes?
- Something else related to PHP-FPM socket config?


### Check if php-fpm is installed:

bash
rpm -qa | grep php-fpm

### Command to Check Linux Distribution
- Use cat /etc/os-release to see distro details.

bash
cat /etc/os-release

- Or use hostnamectl for more system info.

bash
hostnamectl


Do you need help with:
- *Reading output of /etc/os-release*?
- Something else related to system info?
- Other Linux commands you'd like to know?


### Check Nginx Port
- Use netstat or ss to see if Nginx is listening on what port:

bash
sudo netstat -tlnp | grep nginx

- Or with ss:

bash
sudo ss -tlnp | grep nginx


### Files in /var/www/html
- You've got index.php and info.php in /var/www/html.
- So:
- curl http://stapp03:8094/index.php should execute index.php.
- curl http://stapp03:8094/info.php should show PHP info.

Try curl Again

bash
curl http://stapp03:8094/index.php

- Does it execute PHP and show "Welcome to xFusionCorp Industries!" (from earlier code)?

Do you need help with:
- Checking PHP output for index.php?
- *Something else related to Nginx + PHP on stapp03*?
- Other server config tweaks?

### PHP-FPM is Running
- php-fpm.service is active (running).
- Should be passing PHP files to PHP-FPM for execution.

Still 404 on index.php?
- Double-check Nginx logs for specifics on the 404:

bash
sudo tail -f /var/log/nginx/error.log

- Hit localhost:8094/index.php again and check logs.

Do you need help with:
- Reading Nginx error logs for clues?
- *Something else related to Nginx+PHP on stapp03*?
- Other server config tweaks?



