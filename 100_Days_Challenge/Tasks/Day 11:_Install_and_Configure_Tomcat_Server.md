## The Nautilus application development team recently finished the beta version of one of their Java-based applications, which they are planning to deploy on one of the app servers in Stratos DC. After an internal team meeting, they have decided to use the tomcat application server. Based on the requirements mentioned below complete the task:

### a. Install tomcat server on App Server 2.

### b. Configure it to run on port 3003.

### c. There is a ROOT.war file on Jump host at location /tmp.

### Deploy it on this tomcat server and make sure the webpage works directly on base URL i.e curl http://stapp02:3003


**What I Did**
--------------------------------------------
Step-1
ssh steve@172.16.238.11

Step-6 : From Jump host, use scp to copy /tmp/ROOT.war to App Server 2's Tomcat webapps directory.
sudo scp /tmp/ROOT.war steve@172.16.238.11:/var/lib/tomcat/webapps/
curl http://stapp02:3003
history | cut -c 8-
**Note: Before applying this copy command on Jump-Host make sure to run the Change ownership command on App Server-2 "i:e; Step-5"**

[steve@stapp02 ~]$ history | cut -c 8-  App Server - 2
Step -2
sudo yum update && sudo yum install -y tomcat
Step-3
systemctl status tomcat
sudo systemctl start tomcat
systemctl status tomcat

ls /etc/ # to verify tomcat dir exits

ls /etc/tomcat/ # to verify server.xml file exits
Step-4
sudo vi /etc/tomcat/server.xml # Change port from 8080 to 3003

Output:
``` -->
    <Connector port="3003" protocol="HTTP/1.1" # Changed port 8080 to 3003
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />```

sudo systemctl restart tomcat
systemctl status tomcat
ls /var/lib/tomcat/ # to verify the webapps dir exits
exit
Step-5 Change ownership of the directory. :If you want steve to have full control over the webapps directory on 172.16.238.11, run:
sudo chown -R steve /var/lib/tomcat/webapps/

-----------------------------------------------------
How run the command sudo chown -R steve /var/lib/tomcat/webapps/ on App Server 2 (stapp02) from Jump-host.
You can do it via SSH.Here's how:
- SSH into App Server 2 from Jump-host:
```
bash
ssh steve@stapp02 "sudo chown -R steve /var/lib/tomcat/webapps/"
```
What it does: This command connects to stapp02 via SSH and runs the chown command on the remote server. You'll likely be prompted for steve's password (or use SSH keys if configured).

---------------------------------------------------------

Step-7 # To verify if Root.war file is copied
 ls /var/lib/tomcat/webapps/ 
exit

----------------------------------------------------------

#### The following link will take you to the documentation of how to perform the task :  https://tundedamian.medium.com/day-11-of-100-days-of-devops-deploying-a-java-app-on-tomcat-18d7e36eccc7
