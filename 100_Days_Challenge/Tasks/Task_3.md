### Task : Day 3: Secure Root SSH Access

#### Following security audits, the xFusionCorp Industries security team has rolled out new protocols, including the restriction of direct root SSH login.

#### Your task is to disable direct SSH root login on all app servers within the Stratos Datacenter.

#### Solution:

**What i Did**
```
 1  ssh steve@172.16.238.11 
 2   history | cut -c 8-


[steve@stapp02 ~]$ history

 sudo vi /etc/ssh/sshd_config # by using vi editor and going inside the file i made the changes or you can follow the bello command
    
 sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config # Changing the permission from the command line itself

 sudo systemctl restart sshd # This is a must command otherwise the changes will not be implemented

 sudo grep PermitRootLogin /etc/ssh/sshd_config # To Check/Verify wheteher the Permission has changed or not

 history | cut -c 8-
```
I did the same thing for the first three users tony, steve and banner then the task was marked completed .
