


**What I Did**


I've written a shell script apache.sh to configure iptables on App Servers, allowing access to port 3002 only from the Load Balancer (LB) host (172.16.238.14).

**Following is the breakdown of commands in the shell script**

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
# Allows TCP traffic on port 3002 only from LB host (172.16.238.14).

```
sudo iptables -A INPUT -p tcp --dport 3002 -j DROP
```
# Drops all other TCP traffic on port 3002 from other IPs.

```
sudo systemctl enable iptables
```
# Enables iptables service to start on boot.

```
sudo systemctl start iptables
```
# Starts the iptables service.

```
sudo iptables-save | sudo tee /etc/sysconfig/iptables
```
# Saves current iptables rules to /etc/sysconfig/iptables.

#### Post-script commands explanation

```
sudo chmod +x secure_apache_3002.sh
```
- Makes the script executable (note: filename mismatch with apache.sh in script description).

```
sudo ./secure_apache_3002.sh - Runs the script.
```

From LB Host:

```
curl http://<app-server-IP>:3002 - *Tests access to App Server port 3002*.
```
--------------------------------
