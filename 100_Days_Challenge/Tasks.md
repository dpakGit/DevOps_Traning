**TASK : 1**
To accommodate the backup agent tool's specifications, the system admin team at xFusionCorp Industries requires the creation of a user with a non-interactive shell. Here's your task:

   Create a user named kirsty with a non-interactive shell on App Server 3.

Sol:
The task was to create a new user named kirsty with a non-interactive shell on App Server 3.

Steps:
1. Connect to App Server 3: SSH into App Server 3 using ssh username@172.16.238.12, where username is a valid user on App Server 3.

IP Address Context
172.16.238.12 is the IP address of App Server 3, not of a user.
Explanation
- Server IP: Used to connect to App Server 3 via SSH or other network means.
- User context: Users don't have IP addresses in this context; they have usernames, passwords, and permissions on the server.
  

2. *Create user kirsty*:

    - Check existing users:
    ```
     cut -d: -f1 /etc/passwd
    ```
    - Create user kirsty with non-interactive shell:
    ```
    sudo useradd -s /sbin/nologin kirsty
    ```
    
    - Verify user creation: cut -d: -f1 /etc/passwd

4. Exit SSH session: Use exit to return to the original user.

Notes
- To SSH into App Server 3, you need a valid username, IP address (172.16.238.12), and credentials.
- Commands are for a Linux environment.

Do you need help with refining these steps further, or something else regarding user creation on App Server 3?
