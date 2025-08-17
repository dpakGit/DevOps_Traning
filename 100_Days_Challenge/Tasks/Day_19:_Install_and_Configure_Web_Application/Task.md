## Task:
xFusionCorp Industries is planning to host two static websites on their infra in Stratos Datacenter. The development of these websites is still in-progress, but we want to get the servers ready. Please perform the following steps to accomplish the task:



a. Install httpd package and dependencies on app server 3.


b. Apache should serve on port 8086.


c. There are two website's backups /home/thor/ecommerce and /home/thor/cluster on jump_host. Set them up on Apache in a way that ecommerce should work on the link http://localhost:8086/ecommerce/ and cluster should work on link http://localhost:8086/cluster/ on the mentioned app server.


d. Once configured you should be able to access the website using curl command on the respective app server, i.e curl http://localhost:8086/ecommerce/ and curl http://localhost:8086/cluster/


### What I did



#### Terminal-1 This is the terminal of Thor_Jumphost

History of commands on Junphost

```
thor@jumphost ~$ history |cut -c 8-
ls -s /home/thor/
ls -l /home/thor/
# This is the terminal of Thor_Jumphost
ls -l /home/thor/
 scp -r /home/thor/ecommerce/* banner@172.16.238.12:/var/www/html/ecommerce/
 scp -r /home/thor/cluster/* banner@172.16.238.12:/var/www/html/cluster/
# Now check if this two index.html files are copied to the respective destination
history |cut -c 8-
```

The entire procedure 

```
thor@jumphost ~$ ls -s /home/thor/
total 8
4 cluster  4 ecommerce
thor@jumphost ~$ ls -l /home/thor/
total 8
drwxr-xr-x 2 thor thor 4096 Aug 17 05:22 cluster
drwxr-xr-x 2 thor thor 4096 Aug 17 05:22 ecommerce
thor@jumphost ~$ # This is the terminal of Thor_Jumphost
thor@jumphost ~$ ls -l /home/thor/
total 8
drwxr-xr-x 2 thor thor 4096 Aug 17 05:22 cluster
drwxr-xr-x 2 thor thor 4096 Aug 17 05:22 ecommerce
thor@jumphost ~$  scp -r /home/thor/ecommerce/* banner@172.16.238.12:/var/www/html/ecommerce/
The authenticity of host '172.16.238.12 (172.16.238.12)' can't be established.
ED25519 key fingerprint is SHA256:M2Rf/AqwzDebul8qfX5oOVrDqqGKEKQb96Jwtqp+bgk.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:1: stapp03
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.16.238.12' (ED25519) to the list of known hosts.
banner@172.16.238.12's password: 
index.html                             100%  122   191.9KB/s   00:00    
thor@jumphost ~$  scp -r /home/thor/cluster/* banner@172.16.238.12:/var/www/html/cluster/
banner@172.16.238.12's password: 
index.html                             100%  120   223.5KB/s   00:00    
thor@jumphost ~$ # Now check if this two index.html files are copied to the respective destination
thor@jumphost ~$ 
```


#### Terminal-2

#### Things done on Terminal-2
```
History of commands on Appserver-3

[banner@stapp03 ~]$ history |cut -c 8-
This is the terminal of App Server-3
# This is the terminal of App Server-3
yum install httpd -y
sudo yum install httpd -y
grep Listen /etc/httpd/conf/httpd.conf
cat /etc/httpd/conf/httpd.conf | grep Listen
sudo vi /etc/httpd/conf/httpd.conf
# Or use the following command to change listen fron 80 to 8086
sudo sed -i 's/Listen 80/Listen 8086/g' /etc/httpd/conf/httpd.conf
# Verify
cat /etc/httpd/conf/httpd.conf | grep Listen
grep Listen /etc/httpd/conf/httpd.conf
ls -l  /var/www/html/
# Before running the copy command on Jumphost to copy the backups here on App Server-3 Create the directories ecommerce and cluster
mkdir -p /var/www/html/ecommerce 
sudo mkdir -p /var/www/html/ecommerce 
sudo mkdir -p /var/www/html/cluster
# verify the same
grep Listen /etc/httpd/conf/httpd.conf
ls -l  /var/www/html/
# notice the owner of the directories is rood ,change it
sudo chown -R apache:apache /var/www/html/
ls -l  /var/www/html/
sudo chown banner /var/www/html/ecommerce/
sudo chown banner /var/www/html/cluster/
ls -l  /var/www/html/
sudo chmod o+w /var/www/html/ecommerce/
sudo chmod o+w /var/www/html/cluster/
ls -l  /var/www/html/
ls /etc/httpd/conf.d/sites.conf
# The output confirms that /etc/httpd/conf.d/sites.conf doesn't exist.
sudo touch /etc/httpd/conf.d/sites.conf
ls /etc/httpd/conf.d/sites.conf
sudo bash -c 'cat >> /etc/httpd/conf.d/sites.conf <<EOF
news "/var/www/html/news"
ory "/var/www/html/news">
uire all granted
tory>

apps "/var/www/html/apps"
ory "/var/www/html/apps">
uire all granted
tory>

sudo systemctl start httpd
sudo systemctl enable httpd
ls -l /var/www/html/cluster/
ls -l /var/www/html/ecommerce/
# After running the copy command on Jump host it is verified that the two index.html files are copied to App Server-3
curl localhost:8086/ecommerce/
http://localhost:8086/ecommerce/
curl http://localhost:8086/ecommerce/
curl http://localhost:8086/cluster
curl http://localhost:8086/cluster/
history |cut -c 8-
[banner@stapp03 ~]$ 

```
```
Last login: Sun Aug 17 05:28:15 UTC 2025 on pts/0
thor@jumphost ~$ ssh banner@stapp03
The authenticity of host 'stapp03 (172.16.238.12)' can't be established.
ED25519 key fingerprint is SHA256:M2Rf/AqwzDebul8qfX5oOVrDqqGKEKQb96Jwtqp+bgk.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp03' (ED25519) to the list of known hosts.
banner@stapp03's password: 
[banner@stapp03 ~]$ This is the terminal of App Server-3
-bash: This: command not found
[banner@stapp03 ~]$ # This is the terminal of App Server-3
[banner@stapp03 ~]$ yum install httpd -y
Error: This command has to be run with superuser privileges (under the root user on most systems).
[banner@stapp03 ~]$ sudo yum install httpd -y

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for banner: 
CentOS Stream 9 - BaseOS                  34 kB/s | 7.3 kB     00:00    
CentOS Stream 9 - BaseOS                 9.1 MB/s | 8.8 MB     00:00    
CentOS Stream 9 - AppStream               41 kB/s | 7.5 kB     00:00    
CentOS Stream 9 - AppStream               20 MB/s |  25 MB     00:01    
CentOS Stream 9 - Extras packages         32 kB/s | 8.0 kB     00:00    
CentOS Stream 9 - Extras packages         47 kB/s |  19 kB     00:00    
Extra Packages for Enterprise Linux 9 -   69 kB/s |  24 kB     00:00    
Extra Packages for Enterprise Linux 9 -   17 MB/s |  20 MB     00:01    
Extra Packages for Enterprise Linux 9 op 5.3 kB/s | 993  B     00:00    
Extra Packages for Enterprise Linux 9 -  113 kB/s |  25 kB     00:00    
Extra Packages for Enterprise Linux 9 -  369 kB/s | 279 kB     00:00    
Dependencies resolved.
=========================================================================
 Package                Arch       Version           Repository     Size
=========================================================================
Installing:
 httpd                  x86_64     2.4.62-5.el9      appstream      46 k
Installing dependencies:
 apr                    x86_64     1.7.0-12.el9      appstream     123 k
 apr-util               x86_64     1.6.1-23.el9      appstream      95 k
 apr-util-bdb           x86_64     1.6.1-23.el9      appstream      13 k
 centos-logos-httpd     noarch     90.8-3.el9        appstream     1.5 M
 httpd-core             x86_64     2.4.62-5.el9      appstream     1.5 M
 httpd-filesystem       noarch     2.4.62-5.el9      appstream      12 k
 httpd-tools            x86_64     2.4.62-5.el9      appstream      80 k
 libbrotli              x86_64     1.0.9-7.el9       baseos        313 k
 mailcap                noarch     2.1.49-5.el9      baseos         33 k
Installing weak dependencies:
 apr-util-openssl       x86_64     1.6.1-23.el9      appstream      15 k
 mod_http2              x86_64     2.0.26-4.el9      appstream     163 k
 mod_lua                x86_64     2.4.62-5.el9      appstream      59 k

Transaction Summary
=========================================================================
Install  13 Packages

Total download size: 3.9 M
Installed size: 9.5 M
Downloading Packages:
(1/13): mailcap-2.1.49-5.el9.noarch.rpm  379 kB/s |  33 kB     00:00    
(2/13): apr-1.7.0-12.el9.x86_64.rpm      970 kB/s | 123 kB     00:00    
(3/13): apr-util-1.6.1-23.el9.x86_64.rpm 755 kB/s |  95 kB     00:00    
(4/13): apr-util-bdb-1.6.1-23.el9.x86_64 146 kB/s |  13 kB     00:00    
(5/13): libbrotli-1.0.9-7.el9.x86_64.rpm 1.4 MB/s | 313 kB     00:00    
(6/13): apr-util-openssl-1.6.1-23.el9.x8 383 kB/s |  15 kB     00:00    
(7/13): httpd-2.4.62-5.el9.x86_64.rpm    897 kB/s |  46 kB     00:00    
(8/13): httpd-filesystem-2.4.62-5.el9.no 426 kB/s |  12 kB     00:00    
(9/13): centos-logos-httpd-90.8-3.el9.no  12 MB/s | 1.5 MB     00:00    
(10/13): httpd-tools-2.4.62-5.el9.x86_64 1.5 MB/s |  80 kB     00:00    
(11/13): httpd-core-2.4.62-5.el9.x86_64.  12 MB/s | 1.5 MB     00:00    
(12/13): mod_http2-2.0.26-4.el9.x86_64.r 2.4 MB/s | 163 kB     00:00    
(13/13): mod_lua-2.4.62-5.el9.x86_64.rpm 1.1 MB/s |  59 kB     00:00    
-------------------------------------------------------------------------
Total                                    5.4 MB/s | 3.9 MB     00:00     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                 1/1 
  Installing       : apr-1.7.0-12.el9.x86_64                        1/13 
  Installing       : apr-util-bdb-1.6.1-23.el9.x86_64               2/13 
  Installing       : apr-util-openssl-1.6.1-23.el9.x86_64           3/13 
  Installing       : apr-util-1.6.1-23.el9.x86_64                   4/13 
  Installing       : httpd-tools-2.4.62-5.el9.x86_64                5/13 
  Running scriptlet: httpd-filesystem-2.4.62-5.el9.noarch           6/13 
  Installing       : httpd-filesystem-2.4.62-5.el9.noarch           6/13 
  Installing       : centos-logos-httpd-90.8-3.el9.noarch           7/13 
  Installing       : mailcap-2.1.49-5.el9.noarch                    8/13 
  Installing       : httpd-core-2.4.62-5.el9.x86_64                 9/13 
  Installing       : mod_lua-2.4.62-5.el9.x86_64                   10/13 
  Installing       : libbrotli-1.0.9-7.el9.x86_64                  11/13 
  Installing       : mod_http2-2.0.26-4.el9.x86_64                 12/13 
  Installing       : httpd-2.4.62-5.el9.x86_64                     13/13 
  Running scriptlet: httpd-2.4.62-5.el9.x86_64                     13/13 
  Verifying        : libbrotli-1.0.9-7.el9.x86_64                   1/13 
  Verifying        : mailcap-2.1.49-5.el9.noarch                    2/13 
  Verifying        : apr-1.7.0-12.el9.x86_64                        3/13 
  Verifying        : apr-util-1.6.1-23.el9.x86_64                   4/13 
  Verifying        : apr-util-bdb-1.6.1-23.el9.x86_64               5/13 
  Verifying        : apr-util-openssl-1.6.1-23.el9.x86_64           6/13 
  Verifying        : centos-logos-httpd-90.8-3.el9.noarch           7/13 
  Verifying        : httpd-2.4.62-5.el9.x86_64                      8/13 
  Verifying        : httpd-core-2.4.62-5.el9.x86_64                 9/13 
  Verifying        : httpd-filesystem-2.4.62-5.el9.noarch          10/13 
  Verifying        : httpd-tools-2.4.62-5.el9.x86_64               11/13 
  Verifying        : mod_http2-2.0.26-4.el9.x86_64                 12/13 
  Verifying        : mod_lua-2.4.62-5.el9.x86_64                   13/13 

Installed:
  apr-1.7.0-12.el9.x86_64                                                
  apr-util-1.6.1-23.el9.x86_64                                           
  apr-util-bdb-1.6.1-23.el9.x86_64                                       
  apr-util-openssl-1.6.1-23.el9.x86_64                                   
  centos-logos-httpd-90.8-3.el9.noarch                                   
  httpd-2.4.62-5.el9.x86_64                                              
  httpd-core-2.4.62-5.el9.x86_64                                         
  httpd-filesystem-2.4.62-5.el9.noarch                                   
  httpd-tools-2.4.62-5.el9.x86_64                                        
  libbrotli-1.0.9-7.el9.x86_64                                           
  mailcap-2.1.49-5.el9.noarch                                            
  mod_http2-2.0.26-4.el9.x86_64                                          
  mod_lua-2.4.62-5.el9.x86_64                                            

Complete!
[banner@stapp03 ~]$ grep Listen /etc/httpd/conf/httpd.conf
# Listen: Allows you to bind Apache to specific IP addresses and/or
# Change this to Listen on a specific IP address, but note that if
#Listen 12.34.56.78:80
Listen 80
[banner@stapp03 ~]$ cat /etc/httpd/conf/httpd.conf | grep Listen
# Listen: Allows you to bind Apache to specific IP addresses and/or
# Change this to Listen on a specific IP address, but note that if
#Listen 12.34.56.78:80
Listen 80
[banner@stapp03 ~]$ sudo vi /etc/httpd/conf/httpd.conf
[banner@stapp03 ~]$ # Or use the following command to change listen fron 80 to 8086
[banner@stapp03 ~]$ sudo sed -i 's/Listen 80/Listen 8086/g' /etc/httpd/conf/httpd.conf
[banner@stapp03 ~]$ # Verify
[banner@stapp03 ~]$ cat /etc/httpd/conf/httpd.conf | grep Listen
# Listen: Allows you to bind Apache to specific IP addresses and/or
# Change this to Listen on a specific IP address, but note that if
#Listen 12.34.56.78:80
Listen 8086
[banner@stapp03 ~]$ grep Listen /etc/httpd/conf/httpd.conf
# Listen: Allows you to bind Apache to specific IP addresses and/or
# Change this to Listen on a specific IP address, but note that if
#Listen 12.34.56.78:80
Listen 8086
[banner@stapp03 ~]$ ls -l  /var/www/html/
total 0
[banner@stapp03 ~]$ # Before running the copy command on Jumphost to copy the backups here on App Server-3 Create the directories ecommerce and cluster
[banner@stapp03 ~]$ mkdir -p /var/www/html/ecommerce 
mkdir: cannot create directory ‘/var/www/html/ecommerce’: Permission denied
[banner@stapp03 ~]$ sudo mkdir -p /var/www/html/ecommerce 
[sudo] password for banner: 
[banner@stapp03 ~]$ sudo mkdir -p /var/www/html/cluster
[banner@stapp03 ~]$ # verify the same
[banner@stapp03 ~]$ grep Listen /etc/httpd/conf/httpd.conf
# Listen: Allows you to bind Apache to specific IP addresses and/or
# Change this to Listen on a specific IP address, but note that if
#Listen 12.34.56.78:80
Listen 8086
[banner@stapp03 ~]$ ls -l  /var/www/html/
total 8
drwxr-xr-x 2 root root 4096 Aug 17 05:44 cluster
drwxr-xr-x 2 root root 4096 Aug 17 05:44 ecommerce
[banner@stapp03 ~]$ # notice the owner of the directories is rood ,change it
[banner@stapp03 ~]$ sudo chown -R apache:apache /var/www/html/
[banner@stapp03 ~]$ ls -l  /var/www/html/
total 8
drwxr-xr-x 2 apache apache 4096 Aug 17 05:44 cluster
drwxr-xr-x 2 apache apache 4096 Aug 17 05:44 ecommerce
[banner@stapp03 ~]$ sudo chown banner /var/www/html/ecommerce/
[banner@stapp03 ~]$ sudo chown banner /var/www/html/cluster/
[banner@stapp03 ~]$ ls -l  /var/www/html/
total 8
drwxr-xr-x 2 banner apache 4096 Aug 17 05:44 cluster
drwxr-xr-x 2 banner apache 4096 Aug 17 05:44 ecommerce
[banner@stapp03 ~]$ sudo chmod o+w /var/www/html/ecommerce/
[banner@stapp03 ~]$ sudo chmod o+w /var/www/html/cluster/
[banner@stapp03 ~]$ ls -l  /var/www/html/
total 8
drwxr-xrwx 2 banner apache 4096 Aug 17 05:44 cluster
drwxr-xrwx 2 banner apache 4096 Aug 17 05:44 ecommerce
[banner@stapp03 ~]$ ls /etc/httpd/conf.d/sites.conf
ls: cannot access '/etc/httpd/conf.d/sites.conf': No such file or directory
[banner@stapp03 ~]$ # The output confirms that /etc/httpd/conf.d/sites.conf doesn't exist.
[banner@stapp03 ~]$ sudo touch /etc/httpd/conf.d/sites.conf
[banner@stapp03 ~]$ ls /etc/httpd/conf.d/sites.conf
/etc/httpd/conf.d/sites.conf
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ sudo bash -c 'cat >> /etc/httpd/conf.d/sites.conf <<EOF
Alias /news "/var/www/html/news"
<Directory "/var/www/html/news">
    Require all granted
</Directory>

Alias /apps "/var/www/html/apps"
<Directory "/var/www/html/apps">
    Require all granted
</Directory>
EOF'
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ sudo systemctl start httpd
[banner@stapp03 ~]$ sudo systemctl enable httpd
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.
[banner@stapp03 ~]$ ls -l /var/www/html/cluster/
total 4
-rw-r--r-- 1 banner banner 120 Aug 17 05:57 index.html
[banner@stapp03 ~]$ ls -l /var/www/html/ecommerce/
total 4
-rw-r--r-- 1 banner banner 122 Aug 17 05:57 index.html
[banner@stapp03 ~]$ # After running the copy command on Jump host it is verified that the two index.html files are copied to App Server-3
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ curl localhost:8086/ecommerce/
<!DOCTYPE html>
<html>
<body>

<h1>KodeKloud</h1>

<p>This is a sample page for our ecommerce website</p>

</body>
</html>[banner@stapphttp://localhost:8086/ecommerce/mmerce/
-bash: http://localhost:8086/ecommerce/: No such file or directory
[banner@stapp03 ~]$ http://localhost:8086/ecommerce/
-bash: http://localhost:8086/ecommerce/: No such file or directory
[banner@stapp03 ~]$ http://localhost:8086/ecommerce/
-bash: http://localhost:8086/ecommerce/: No such file or directory
[banner@stapp03 ~]$ curl http://localhost:8086/ecommerce/
<!DOCTYPE html>
<html>
<body>

<h1>KodeKloud</h1>

<p>This is a sample page for our ecommerce website</p>

</body>
</html>[banner@stapp03 ~]$ curl http://localhost:8086/cluster
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="http://localhost:8086/cluster/">here</a>.</p>
</body></html>
[banner@stapp03 ~]$ curl http://localhost:8086/cluster/
<!DOCTYPE html>
<html>
<body>

<h1>KodeKloud</h1>

<p>This is a sample page for our cluster website</p>

</body>
</html>[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ 
```
