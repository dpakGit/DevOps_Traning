## Task :

Provide a detailed and clear explanation of the following task - We have one of our websites up and running on our Nautilus infrastructure in Stratos DC. Our security team has raised a concern that right now Apache’s port i.e 6300 is open for all since there is no firewall installed on these hosts. So we have decided to add some security layer for these hosts and after discussions and recommendations we have come up with the following requirements:

1. Install iptables and all its dependencies on each app host.


2. Block incoming port 6300 on all apps for everyone except for LBR host.


3. Make sure the rules remain, even after system reboot.
   


### What I Did


#### I've written a shell script apache.sh to configure iptables on App Servers, allowing access to port 3002 only from the Load Balancer (LB) host (172.16.238.14).

```
#!/bin/bash
sudo yum install iptables-services -y
iptables -F
sudo iptables -A INPUT -p tcp --dport 3002 -s 172.16.238.14 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 3002 -j DROP
sudo systemctl enable iptables
sudo systemctl start iptables
sudo iptables-save | sudo tee /etc/sysconfig/iptables
```

### Post-script commands explanation


```
sudo chmod +x apache.sh
```
Makes the script executable (note: filename mismatch with apache.sh in script description).


```
sudo ./apache.sh - Runs the script.
```


From LB Host:

```
curl http://<app-server-IP>:3002 - *Tests access to App Server port 3002*.
```
----------------------------------------

### Following is the breakdown of commands in the shell script :

```
#!/bin/bash
```

```
sudo yum install iptables-services -y
```
Installs iptables-services package for managing iptables rules.


```
iptables -F
```
Flushes (clears) all existing iptables rules.


```
sudo iptables -A INPUT -p tcp --dport 3002 -s 172.16.238.14 -j ACCEPT
```
Allows TCP traffic on port 3002 only from LB host (172.16.238.14).


```
sudo iptables -A INPUT -p tcp --dport 3002 -j DROP
```
Drops all other TCP traffic on port 3002 from other IPs.


```
sudo systemctl enable iptables
```
Enables iptables service to start on boot.


```
sudo systemctl start iptables
```
Starts the iptables service.


```
sudo iptables-save | sudo tee /etc/sysconfig/iptables
```
Saves current iptables rules to /etc/sysconfig/iptables.


--------------------------------
