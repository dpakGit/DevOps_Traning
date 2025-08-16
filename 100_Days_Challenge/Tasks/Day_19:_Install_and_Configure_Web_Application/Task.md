# Terminal-1

thor@jumphost ~$ ls -l /home/thor/
total 8
drwxr-xr-x 2 thor thor 4096 Aug 16 16:34 apps
drwxr-xr-x 2 thor thor 4096 Aug 16 16:34 news
thor@jumphost ~$ scp -r /home/thor/news/* steve@172.16.238.12:/var/www/html/official/
The authenticity of host '172.16.238.12 (172.16.238.12)' can't be established.
ED25519 key fingerprint is SHA256:0Ip0al82r/4pco/WYa8Qqpr57TQ6noy3OMfRK7eTnGI.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.16.238.12' (ED25519) to the list of known hosts.
steve@172.16.238.12's password: 
Permission denied, please try again.
steve@172.16.238.12's password: 
thor@jumphost ~$ ls  /home/thor
apps  news
thor@jumphost ~$ scp -r /home/thor/news/* steve@172.16.238.12:/var/www/html/news/
steve@172.16.238.12's password: 
Permission denied, please try again.
steve@172.16.238.12's password: 
thor@jumphost ~$ scp -r /home/thor/news/* steve@172.16.238.11:/var/www/html/news/
The authenticity of host '172.16.238.11 (172.16.238.11)' can't be established.
ED25519 key fingerprint is SHA256:pCFpBdGRmRrnp31ztMvpIa58lRH1VmGc2/SlVggSz6Y.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:1: stapp02
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.16.238.11' (ED25519) to the list of known hosts.
steve@172.16.238.11's password: 
Permission denied, please try again.
steve@172.16.238.11's password: 
index.html                             100%  117   219.5KB/s   00:00    
thor@jumphost ~$ scp -r /home/thor/apps/* steve@172.16.238.11:/var/www/html/apps/
steve@172.16.238.11's password: 
index.html                             100%  117   246.2KB/s   00:00    
thor@jumphost ~$ 



# Terminal-2

Last login: Sat Aug 16 16:36:53 UTC 2025 on pts/0
thor@jumphost ~$ ssh steve@stapp02
The authenticity of host 'stapp02 (172.16.238.11)' can't be established.
ED25519 key fingerprint is SHA256:pCFpBdGRmRrnp31ztMvpIa58lRH1VmGc2/SlVggSz6Y.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp02' (ED25519) to the list of known hosts.
steve@stapp02's password: 
[steve@stapp02 ~]$ sudo -s

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for steve: 
[root@stapp02 steve]# yum install httpd -y
CentOS Stream 9 - BaseOS                  33 kB/s | 7.3 kB     00:00    
CentOS Stream 9 - BaseOS                 3.2 MB/s | 8.8 MB     00:02    
CentOS Stream 9 - AppStream               52 kB/s | 7.5 kB     00:00    
CentOS Stream 9 - AppStream              8.5 MB/s |  25 MB     00:02    
CentOS Stream 9 - Extras packages         50 kB/s | 8.0 kB     00:00    
CentOS Stream 9 - Extras packages         62 kB/s |  19 kB     00:00    
Extra Packages for Enterprise Linux 9 -  160 kB/s |  35 kB     00:00    
Extra Packages for Enterprise Linux 9 -   14 MB/s |  20 MB     00:01    
Extra Packages for Enterprise Linux 9 op 5.4 kB/s | 993  B     00:00    
Extra Packages for Enterprise Linux 9 -   90 kB/s |  25 kB     00:00    
Extra Packages for Enterprise Linux 9 -  336 kB/s | 279 kB     00:00    
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
(1/13): apr-1.7.0-12.el9.x86_64.rpm      1.0 MB/s | 123 kB     00:00    
(2/13): apr-util-1.6.1-23.el9.x86_64.rpm 3.9 MB/s |  95 kB     00:00    
(3/13): mailcap-2.1.49-5.el9.noarch.rpm  226 kB/s |  33 kB     00:00    
(4/13): apr-util-bdb-1.6.1-23.el9.x86_64 557 kB/s |  13 kB     00:00    
(5/13): apr-util-openssl-1.6.1-23.el9.x8 236 kB/s |  15 kB     00:00    
(6/13): centos-logos-httpd-90.8-3.el9.no  16 MB/s | 1.5 MB     00:00    
(7/13): httpd-2.4.62-5.el9.x86_64.rpm    974 kB/s |  46 kB     00:00    
(8/13): libbrotli-1.0.9-7.el9.x86_64.rpm 1.1 MB/s | 313 kB     00:00    
(9/13): httpd-filesystem-2.4.62-5.el9.no 521 kB/s |  12 kB     00:00    
(10/13): httpd-tools-2.4.62-5.el9.x86_64 1.7 MB/s |  80 kB     00:00    
(11/13): httpd-core-2.4.62-5.el9.x86_64.  16 MB/s | 1.5 MB     00:00    
(12/13): mod_lua-2.4.62-5.el9.x86_64.rpm 2.3 MB/s |  59 kB     00:00    
(13/13): mod_http2-2.0.26-4.el9.x86_64.r 1.5 MB/s | 163 kB     00:00    
-------------------------------------------------------------------------
Total                                    5.9 MB/s | 3.9 MB     00:00     
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
[root@stapp02 steve]# sudo vi /etc/httpd/conf/httpd.conf
[root@stapp02 steve]# sudo sed -i 's/Listen 80/Listen 6300/g' /etc/httpd/conf/httpd.conf
[root@stapp02 steve]# grep Listen /etc/httpd/conf/httpd.conf
# Listen: Allows you to bind Apache to specific IP addresses and/or
# Change this to Listen on a specific IP address, but note that if
#Listen 12.34.56.78:80
Listen 6300
[root@stapp02 steve]# cat /etc/httpd/conf/httpd.conf | grep Listen
# Listen: Allows you to bind Apache to specific IP addresses and/or
# Change this to Listen on a specific IP address, but note that if
#Listen 12.34.56.78:80
Listen 6300
[root@stapp02 steve]# ls /var/www/html/
[root@stapp02 steve]# cd /var/www/html/
[root@stapp02 html]# ls
[root@stapp02 html]# cd ..
[root@stapp02 www]# ls
cgi-bin  html
[root@stapp02 www]# cd ..
[root@stapp02 var]# ls
adm    db     ftp    kerberos  local  log   nis  preserve  spool  www
cache  empty  games  lib       lock   mail  opt  run       tmp    yp
[root@stapp02 var]# cd ~
[root@stapp02 ~]# mkdir -p /var/www/html/news 
[root@stapp02 ~]# mkdir -p /var/www/html/apps
[root@stapp02 ~]# ls /var/www/html/
apps  news
[root@stapp02 ~]# rm -rf /var/www/html/news/
[root@stapp02 ~]# rm -rf /var/www/html/apps/
[root@stapp02 ~]# ls /var/www/html/
[root@stapp02 ~]# sudo mkdir -p /var/www/html/news 
sudo mkdir -p /var/www/html/apps
[root@stapp02 ~]# ls /var/www/html/
apps  news
[root@stapp02 ~]# sudo chmod o+w /var/www/html/news/
sudo chmod o+w /var/www/html/apps/
[root@stapp02 ~]# sudo chown steve /var/www/html/news/
[root@stapp02 ~]# sudo chown steve /var/www/html/apps/
[root@stapp02 ~]# # Now fron Jump_host run scp command
[root@stapp02 ~]# sudo chown -R apache:apache /var/www/html/
[root@stapp02 ~]# # After coping from junphost check
[root@stapp02 ~]# ls /var/www/html/news/
index.html
[root@stapp02 ~]# ls /var/www/html/apps/
index.html
[root@stapp02 ~]# Alias /official /var/www/html/official
bash: Alias: command not found
[root@stapp02 ~]# /etc/httpd/conf.d/sites.conf
bash: /etc/httpd/conf.d/sites.conf: No such file or directory
[root@stapp02 ~]# /etc/con
bash: /etc/con: No such file or directory
[root@stapp02 ~]# 
[root@stapp02 ~]# 
[root@stapp02 ~]# 
[root@stapp02 ~]# cd /etc/
[root@stapp02 etc]# ls
GREP_COLORS        gshadow         networks           sasl2
NetworkManager     gshadow-        nsswitch.conf      security
X11                gss             nsswitch.conf.bak  selinux
adjtime            host.conf       nvme               services
adjtime.rpmnew     hostname        openldap           sestatus.conf
aliases            hosts           opt                shadow
alternatives       httpd           os-release         shadow-
anacrontab         init.d          pam.d              shells
bash_completion.d  inittab         passwd             skel
bashrc             inputrc         passwd-            ssh
centos-release     iproute2        pkcs11             ssl
chkconfig.d        issue           pki                statetab.d
cron.d             issue.d         pm                 subgid
cron.daily         issue.net       popt.d             subgid-
cron.deny          keys            printcap           subuid
cron.hourly        keyutils        profile            subuid-
cron.monthly       krb5.conf       profile.d          sudo-ldap.conf
cron.weekly        krb5.conf.d     protocols          sudo.conf
crontab            ld.so.cache     rc.d               sudoers
crypto-policies    ld.so.conf      rc.local           sudoers.d
crypttab           ld.so.conf.d    rc0.d              sysconfig
csh.cshrc          libaudit.conf   rc1.d              system-release
csh.login          libreport       rc2.d              system-release-cpe
dbus-1             libuser.conf    rc3.d              systemd
default            locale.conf     rc4.d              terminfo
dnf                localtime       rc5.d              tmpfiles.d
environment        login.defs      rc6.d              tpm2-tss
ethertypes         logrotate.conf  redhat-release     vconsole.conf
exports            logrotate.d     request-key.conf   virc
filesystems        machine-id      request-key.d      xattr.conf
fonts              mailcap         resolv.conf        xdg
gcrypt             mime.types      rhsm-host          yum
gnupg              motd            rpc                yum.conf
group              motd.d          rpm                yum.repos.d
group-             mtab            rwtab.d
[root@stapp02 etc]# cd /httpd
bash: cd: /httpd: No such file or directory
[root@stapp02 etc]# cd /httpd 
bash: cd: /httpd: No such file or directory
[root@stapp02 etc]# cd /httpd/
bash: cd: /httpd/: No such file or directory
[root@stapp02 etc]# ls /etc/httpd/conf.d/sites.conf
ls: cannot access '/etc/httpd/conf.d/sites.conf': No such file or directory
[root@stapp02 etc]# # The output confirms that /etc/httpd/conf.d/sites.conf doesn't exist.
[root@stapp02 etc]# sudo touch /etc/httpd/conf.d/sites.conf
[root@stapp02 etc]# ls /etc/httpd/conf.d/sites.conf
/etc/httpd/conf.d/sites.conf
[root@stapp02 etc]# sudo bash -c 'cat >> /etc/httpd/conf.d/sites.conf <<EOF
Alias /news "/var/www/html/news"
<Directory "/var/www/html/news">
    Require all granted
</Directory>

Alias /apps "/var/www/html/apps"
<Directory "/var/www/html/apps">
    Require all granted
</Directory>
EOF'
[root@stapp02 etc]# sudo systemctl restart httpd
[root@stapp02 etc]# sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
     Active: active (running) since Sat 2025-08-16 17:19:57 UTC; 18s ago
       Docs: man:httpd.service(8)
   Main PID: 2869 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
      Tasks: 177 (limit: 411434)
     Memory: 20.7M
     CGroup: /docker/f04ecf50628e9af24388c1cbdc9fe4240be546e7c9e53c622128e3e4358998e6/system.slice/httpd.service
             ├─2869 /usr/sbin/httpd -DFOREGROUND
             ├─2876 /usr/sbin/httpd -DFOREGROUND
             ├─2877 /usr/sbin/httpd -DFOREGROUND
             ├─2878 /usr/sbin/httpd -DFOREGROUND
             └─2879 /usr/sbin/httpd -DFOREGROUND

Aug 16 17:19:56 stapp02.stratos.xfusioncorp.com httpd[2869]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using stapp02.stratos.xfusioncorp.com. Set the 'ServerName' directive globally to suppress this message
Aug 16 17:19:57 stapp02.stratos.xfusioncorp.com systemd[1]: httpd.service: Got notification message from PID 2869 (RELOADING=1, STATUS=Reading configuration...)
Aug 16 17:19:57 stapp02.stratos.xfusioncorp.com httpd[2869]: Server configured, listening on: port 6300
Aug 16 17:19:57 stapp02.stratos.xfusioncorp.com systemd[1]: httpd.service: Got notification message from PID 2869 (READY=1, STATUS=Configuration loaded.)
Aug 16 17:19:57 stapp02.stratos.xfusioncorp.com systemd[1]: httpd.service: Changed start -> running
Aug 16 17:19:57 stapp02.stratos.xfusioncorp.com systemd[1]: httpd.service: Job 338 httpd.service/start finished, result=done
Aug 16 17:19:57 stapp02.stratos.xfusioncorp.com systemd[1]: Started The Apache HTTP Server.
Aug 16 17:19:57 stapp02.stratos.xfusioncorp.com systemd[1]: httpd.service: Failed to send unit change signal for httpd.service: Connection reset by peer
Aug 16 17:19:57 stapp02.stratos.xfusioncorp.com systemd[1]: httpd.service: Got notification message from PID 2869 (READY=1, STATUS=Started, listening on: port 6300, MAINPID=2869)
Aug 16 17:20:06 stapp02.stratos.xfusioncorp.com systemd[1]: httpd.service: Got notification message from PID 2869 (READY=1, STATUS=Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec)
[root@stapp02 etc]# curl http://localhost:6300/news/
<!DOCTYPE html>
<html>
<body>

<h1>KodeKloud</h1>

<p>This is a sample page for our news website</p>

</body>
</html>[root@stapp02 etc]# curl http://localhost:6300/apps/
<!DOCTYPE html>
<html>
<body>

<h1>KodeKloud</h1>

<p>This is a sample page for our apps website</p>

</body>
</html>[root@stapp02 etc]# cd ~
[root@stapp02 ~]# sudo bash -c 'cat >> /etc/httpd/conf.d/sites.conf <<EOF 
Alias /news "/var/www/html/news"
<Directory "/var/www/html/news">
    Require all granted
</Directory>

Alias /apps "/var/www/html/apps"
<Directory "/var/www/html/apps">
    Require all granted
</Directory>
EOF'
[root@stapp02 ~]# sudo bash -c 'cat >> /etc/httpd/conf.d/sites.conf <<EOF 
Alias /news "/var/www/html/news"
<Directory "/var/www/html/news">
    Require all granted
</Directory>

Alias /apps "/var/www/html/apps"
<Directory "/var/www/html/apps">
    Require all granted
</Directory>
EOF'
[root@stapp02 ~]# curl http://localhost:6300/news/
<!DOCTYPE html>
<html>
<body>

<h1>KodeKloud</h1>

<p>This is a sample page for our news website</p>

</body>
</html>[root@stappcurl http://localhost:6300/apps/
<!DOCTYPE html>
<html>
<body>

<h1>KodeKloud</h1>

<p>This is a sample page for our apps website</p>

</body>
</html>[root@stapp02 ~]# 
