### Task:

The xFusionCorp development team added updates to the project that is maintained under /opt/ecommerce.git repo and cloned under /usr/src/kodekloudrepos/ecommerce. Recently some changes were made on Git server that is hosted on Storage server in Stratos DC. The DevOps team added some new Git remotes, so we need to update remote on /usr/src/kodekloudrepos/ecommerce repository as per details mentioned below:

a. In /usr/src/kodekloudrepos/ecommerce repo add a new remote dev_ecommerce and point it to /opt/xfusioncorp_ecommerce.git repository.

b. There is a file /tmp/index.html on same server; copy this file to the repo and add/commit to master branch.

c. Finally push master branch to this new remote origin.

-------------------------------------------------



thor@jumphost ~$ ssh natasha@ststor01
The authenticity of host 'ststor01 (172.16.238.15)' can't be established.
ED25519 key fingerprint is SHA256:WNkG8KASJgUa+MwKwajmMURGZYePdJdfsrlAEkV+uSE.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ststor01' (ED25519) to the list of known hosts.
natasha@ststor01's password: 
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/ecommerce
[natasha@ststor01 ecommerce]$ ls -alh
total 16K
drwxr-xr-x 3 root root 4.0K Aug 22 04:25 .
drwxr-xr-x 3 root root 4.0K Aug 22 04:25 ..
drwxr-xr-x 8 root root 4.0K Aug 22 04:25 .git
-rw-r--r-- 1 root root   34 Aug 22 04:25 info.txt
[natasha@ststor01 ecommerce]$ sudo -s

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for natasha: 
[root@ststor01 ecommerce]# git remote add dev_ecommerce  /opt/xfusioncorp_ecommerce.git
[root@ststor01 ecommerce]# ls /tmp/
index.html
systemd-private-6d8591584e014ce4b52fe9f2dba0f99a-dbus-broker.service-hYV0dU
systemd-private-6d8591584e014ce4b52fe9f2dba0f99a-systemd-logind.service-Xcd61n
[root@ststor01 ecommerce]# cp /tmp/index.html .
[root@ststor01 ecommerce]# git add index.html 
[root@ststor01 ecommerce]# git commit -m "Add index.html to master"
[master 143f80d] Add index.html to master
 1 file changed, 10 insertions(+)
 create mode 100644 index.html
[root@ststor01 ecommerce]# git log
commit 143f80deb4da2a839363ef3fba47de229ecc4d2d (HEAD -> master)
Author: Admin <admin@kodekloud.com>
Date:   Fri Aug 22 04:32:37 2025 +0000

    Add index.html to master

commit cc7c327c3ecf6fd9cd20306b0cd2278159db32de (origin/master)
Author: Admin <admin@kodekloud.com>
Date:   Fri Aug 22 04:25:31 2025 +0000

    initial commit
[root@ststor01 ecommerce]# git push 
.git/       index.html  info.txt    
[root@ststor01 ecommerce]# git push dev_ecommerce master
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Delta compression using up to 16 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (6/6), 589 bytes | 589.00 KiB/s, done.
Total 6 (delta 0), reused 0 (delta 0), pack-reused 0
To /opt/xfusioncorp_ecommerce.git
 * [new branch]      master -> master
[root@ststor01 ecommerce]# git log
commit 143f80deb4da2a839363ef3fba47de229ecc4d2d (HEAD -> master, dev_ecommerce/master)
Author: Admin <admin@kodekloud.com>
Date:   Fri Aug 22 04:32:37 2025 +0000

    Add index.html to master

commit cc7c327c3ecf6fd9cd20306b0cd2278159db32de (origin/master)
Author: Admin <admin@kodekloud.com>
Date:   Fri Aug 22 04:25:31 2025 +0000

    initial commit
[root@ststor01 ecommerce]# history | cut -c 8-
git remote add dev_ecommerce  /opt/xfusioncorp_ecommerce.git
ls /tmp/
cp /tmp/index.html .
git add index.html 
git commit -m "Add index.html to master"
git log
git push dev_ecommerce master
git log
history | cut -c 8-
[root@ststor01 ecommerce]# 
