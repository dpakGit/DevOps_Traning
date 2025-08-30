  PORTS     NAMES
bb641735c4a6   ubuntu:18.04   "/bin/bash"   8 minutes ago   Up 8 minutes             kkloud
[root@stapp02 steve]# # Or
[root@stapp02 steve]# docker ps -a | grep kkloud
bb641735c4a6   ubuntu:18.04   "/bin/bash"   8 minutes ago   Up 8 minutes             kkloud
[root@stapp02 steve]# docker exec -it kkloud bash
root@bb641735c4a6:/# pwd
/
root@bb641735c4a6:/# apt update
Hit:1 http://archive.ubuntu.com/ubuntu bionic InRelease
Hit:2 http://archive.ubuntu.com/ubuntu bionic-updates InRelease         
Hit:3 http://archive.ubuntu.com/ubuntu bionic-backports InRelease       
Hit:4 http://security.ubuntu.com/ubuntu bionic-security InRelease       
Reading package lists... 5%                       
Reading package lists... Done
Building dependency tree       
Reading state information... Done
1 package can be upgraded. Run 'apt list --upgradable' to see it.
root@bb641735c4a6:/# 
root@bb641735c4a6:/# apt update
Hit:1 http://security.ubuntu.com/ubuntu bionic-security InRelease
Hit:2 http://archive.ubuntu.com/ubuntu bionic InRelease                 
Hit:3 http://archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:4 http://archive.ubuntu.com/ubuntu bionic-backports InRelease
Reading package lists... Done
Building dependency tree       
Reading state information... Done
1 package can be upgraded. Run 'apt list --upgradable' to see it.
root@bb641735c4a6:/# apt install -y apache2
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  apache2-bin apache2-data apache2-utils file libapr1 libaprutil1
  libaprutil1-dbd-sqlite3 libaprutil1-ldap libexpat1 libgdbm-compat4
  libgdbm5 libicu60 liblua5.2-0 libmagic-mgc libmagic1 libperl5.26
  libxml2 mime-support netbase perl perl-modules-5.26 ssl-cert xz-utils
Suggested packages:
  www-browser apache2-doc apache2-suexec-pristine
  | apache2-suexec-custom ufw gdbm-l10n perl-doc
  libterm-readline-gnu-perl | libterm-readline-perl-perl make
  openssl-blacklist
The following NEW packages will be installed:
  apache2 apache2-bin apache2-data apache2-utils file libapr1
  libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libexpat1
  libgdbm-compat4 libgdbm5 libicu60 liblua5.2-0 libmagic-mgc libmagic1
  libperl5.26 libxml2 mime-support netbase perl perl-modules-5.26
  ssl-cert xz-utils
0 upgraded, 24 newly installed, 0 to remove and 1 not upgraded.
Need to get 17.5 MB of archives.
After this operation, 88.7 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 perl-modules-5.26 all 5.26.1-6ubuntu0.7 [2764 kB]
Get:2 http://archive.ubuntu.com/ubuntu bionic/main amd64 libgdbm5 amd64 1.14.1-6 [26.0 kB]
Get:3 http://archive.ubuntu.com/ubuntu bionic/main amd64 libgdbm-compat4 amd64 1.14.1-6 [6084 B]
Get:4 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libperl5.26 amd64 5.26.1-6ubuntu0.7 [3532 kB]
Get:5 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 perl amd64 5.26.1-6ubuntu0.7 [201 kB]
Get:6 http://archive.ubuntu.com/ubuntu bionic/main amd64 mime-support all 3.60ubuntu1 [30.1 kB]
Get:7 http://archive.ubuntu.com/ubuntu bionic/main amd64 libapr1 amd64 1.6.3-2 [90.9 kB]
Get:8 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libexpat1 amd64 2.2.5-3ubuntu0.9 [82.8 kB]
Get:9 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libaprutil1 amd64 1.6.1-2ubuntu0.1 [84.6 kB]
Get:10 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libaprutil1-dbd-sqlite3 amd64 1.6.1-2ubuntu0.1 [10.6 kB]
Get:11 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libaprutil1-ldap amd64 1.6.1-2ubuntu0.1 [8752 B]
Get:12 http://archive.ubuntu.com/ubuntu bionic/main amd64 liblua5.2-0 amd64 5.2.4-1.1build1 [108 kB]
Get:13 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libicu60 amd64 60.2-3ubuntu3.2 [8050 kB]
Get:14 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libxml2 amd64 2.9.4+dfsg1-6.1ubuntu1.9 [663 kB]
Get:15 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 apache2-bin amd64 2.4.29-1ubuntu4.27 [1071 kB]
Get:16 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 apache2-utils amd64 2.4.29-1ubuntu4.27 [83.3 kB]
Get:17 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 apache2-data all 2.4.29-1ubuntu4.27 [160 kB]
Get:18 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 apache2 amd64 2.4.29-1ubuntu4.27 [95.1 kB]
Get:19 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libmagic-mgc amd64 1:5.32-2ubuntu0.4 [184 kB]
Get:20 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libmagic1 amd64 1:5.32-2ubuntu0.4 [68.6 kB]
Get:21 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 file amd64 1:5.32-2ubuntu0.4 [22.1 kB]
Get:22 http://archive.ubuntu.com/ubuntu bionic/main amd64 netbase all 5.4 [12.7 kB]
Get:23 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 xz-utils amd64 5.2.2-1.3ubuntu0.1 [83.8 kB]
Get:24 http://archive.ubuntu.com/ubuntu bionic/main amd64 ssl-cert all 1.0.39 [17.0 kB]
Fetched 17.5 MB in 1s (26.0 MB/s)     
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package perl-modules-5.26.
(Reading database ... 4578 files and directories currently installed.)
Preparing to unpack .../00-perl-modules-5.26_5.26.1-6ubuntu0.7_all.deb ...
Unpacking perl-modules-5.26 (5.26.1-6ubuntu0.7) ...
Selecting previously unselected package libgdbm5:amd64.
Preparing to unpack .../01-libgdbm5_1.14.1-6_amd64.deb ...
Unpacking libgdbm5:amd64 (1.14.1-6) ...
Selecting previously unselected package libgdbm-compat4:amd64.
Preparing to unpack .../02-libgdbm-compat4_1.14.1-6_amd64.deb ...
Unpacking libgdbm-compat4:amd64 (1.14.1-6) ...
Selecting previously unselected package libperl5.26:amd64.
Preparing to unpack .../03-libperl5.26_5.26.1-6ubuntu0.7_amd64.deb ...
Unpacking libperl5.26:amd64 (5.26.1-6ubuntu0.7) ...
Selecting previously unselected package perl.
Preparing to unpack .../04-perl_5.26.1-6ubuntu0.7_amd64.deb ...
Unpacking perl (5.26.1-6ubuntu0.7) ...
Selecting previously unselected package mime-support.
Preparing to unpack .../05-mime-support_3.60ubuntu1_all.deb ...
Unpacking mime-support (3.60ubuntu1) ...
Selecting previously unselected package libapr1:amd64.
Preparing to unpack .../06-libapr1_1.6.3-2_amd64.deb ...
Unpacking libapr1:amd64 (1.6.3-2) ...
Selecting previously unselected package libexpat1:amd64.
Preparing to unpack .../07-libexpat1_2.2.5-3ubuntu0.9_amd64.deb ...
Unpacking libexpat1:amd64 (2.2.5-3ubuntu0.9) ...
Selecting previously unselected package libaprutil1:amd64.
Preparing to unpack .../08-libaprutil1_1.6.1-2ubuntu0.1_amd64.deb ...
Unpacking libaprutil1:amd64 (1.6.1-2ubuntu0.1) ...
Selecting previously unselected package libaprutil1-dbd-sqlite3:amd64.
Preparing to unpack .../09-libaprutil1-dbd-sqlite3_1.6.1-2ubuntu0.1_amd64.deb ...
Unpacking libaprutil1-dbd-sqlite3:amd64 (1.6.1-2ubuntu0.1) ...
Selecting previously unselected package libaprutil1-ldap:amd64.
Preparing to unpack .../10-libaprutil1-ldap_1.6.1-2ubuntu0.1_amd64.deb ...
Unpacking libaprutil1-ldap:amd64 (1.6.1-2ubuntu0.1) ...
Selecting previously unselected package liblua5.2-0:amd64.
Preparing to unpack .../11-liblua5.2-0_5.2.4-1.1build1_amd64.deb ...
Unpacking liblua5.2-0:amd64 (5.2.4-1.1build1) ...
Selecting previously unselected package libicu60:amd64.
Preparing to unpack .../12-libicu60_60.2-3ubuntu3.2_amd64.deb ...
Unpacking libicu60:amd64 (60.2-3ubuntu3.2) ...
Selecting previously unselected package libxml2:amd64.
Preparing to unpack .../13-libxml2_2.9.4+dfsg1-6.1ubuntu1.9_amd64.deb ...
Unpacking libxml2:amd64 (2.9.4+dfsg1-6.1ubuntu1.9) ...
Selecting previously unselected package apache2-bin.
Preparing to unpack .../14-apache2-bin_2.4.29-1ubuntu4.27_amd64.deb ...
Unpacking apache2-bin (2.4.29-1ubuntu4.27) ...
Selecting previously unselected package apache2-utils.
Preparing to unpack .../15-apache2-utils_2.4.29-1ubuntu4.27_amd64.deb ...
Unpacking apache2-utils (2.4.29-1ubuntu4.27) ...
Selecting previously unselected package apache2-data.
Preparing to unpack .../16-apache2-data_2.4.29-1ubuntu4.27_all.deb ...
Unpacking apache2-data (2.4.29-1ubuntu4.27) ...
Selecting previously unselected package apache2.
Preparing to unpack .../17-apache2_2.4.29-1ubuntu4.27_amd64.deb ...
Unpacking apache2 (2.4.29-1ubuntu4.27) ...
Selecting previously unselected package libmagic-mgc.
Preparing to unpack .../18-libmagic-mgc_1%3a5.32-2ubuntu0.4_amd64.deb ...
Unpacking libmagic-mgc (1:5.32-2ubuntu0.4) ...
Selecting previously unselected package libmagic1:amd64.
Preparing to unpack .../19-libmagic1_1%3a5.32-2ubuntu0.4_amd64.deb ...
Unpacking libmagic1:amd64 (1:5.32-2ubuntu0.4) ...
Selecting previously unselected package file.
Preparing to unpack .../20-file_1%3a5.32-2ubuntu0.4_amd64.deb ...
Unpacking file (1:5.32-2ubuntu0.4) ...
Selecting previously unselected package netbase.
Preparing to unpack .../21-netbase_5.4_all.deb ...
Unpacking netbase (5.4) ...
Selecting previously unselected package xz-utils.
Preparing to unpack .../22-xz-utils_5.2.2-1.3ubuntu0.1_amd64.deb ...
Unpacking xz-utils (5.2.2-1.3ubuntu0.1) ...
Selecting previously unselected package ssl-cert.
Preparing to unpack .../23-ssl-cert_1.0.39_all.deb ...
Unpacking ssl-cert (1.0.39) ...
Setting up libapr1:amd64 (1.6.3-2) ...
Setting up libexpat1:amd64 (2.2.5-3ubuntu0.9) ...
Setting up libicu60:amd64 (60.2-3ubuntu3.2) ...
Setting up mime-support (3.60ubuntu1) ...
Setting up apache2-data (2.4.29-1ubuntu4.27) ...
Setting up ssl-cert (1.0.39) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 76.)
debconf: falling back to frontend: Readline
Setting up perl-modules-5.26 (5.26.1-6ubuntu0.7) ...
Setting up libgdbm5:amd64 (1.14.1-6) ...
Setting up libxml2:amd64 (2.9.4+dfsg1-6.1ubuntu1.9) ...
Setting up libmagic-mgc (1:5.32-2ubuntu0.4) ...
Setting up libmagic1:amd64 (1:5.32-2ubuntu0.4) ...
Setting up xz-utils (5.2.2-1.3ubuntu0.1) ...
update-alternatives: using /usr/bin/xz to provide /usr/bin/lzma (lzma) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/man1/lzma.1.gz because associated file /usr/share/man/man1/xz.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/unlzma.1.gz because associated file /usr/share/man/man1/unxz.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzcat.1.gz because associated file /usr/share/man/man1/xzcat.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzmore.1.gz because associated file /usr/share/man/man1/xzmore.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzless.1.gz because associated file /usr/share/man/man1/xzless.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzdiff.1.gz because associated file /usr/share/man/man1/xzdiff.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzcmp.1.gz because associated file /usr/share/man/man1/xzcmp.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzgrep.1.gz because associated file /usr/share/man/man1/xzgrep.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzegrep.1.gz because associated file /usr/share/man/man1/xzegrep.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzfgrep.1.gz because associated file /usr/share/man/man1/xzfgrep.1.gz (of link group lzma) doesn't exist
Setting up libaprutil1:amd64 (1.6.1-2ubuntu0.1) ...
Setting up liblua5.2-0:amd64 (5.2.4-1.1build1) ...
Setting up libgdbm-compat4:amd64 (1.14.1-6) ...
Setting up libaprutil1-ldap:amd64 (1.6.1-2ubuntu0.1) ...
Setting up netbase (5.4) ...
Setting up libaprutil1-dbd-sqlite3:amd64 (1.6.1-2ubuntu0.1) ...
Setting up apache2-utils (2.4.29-1ubuntu4.27) ...
Setting up file (1:5.32-2ubuntu0.4) ...
Setting up libperl5.26:amd64 (5.26.1-6ubuntu0.7) ...
Setting up perl (5.26.1-6ubuntu0.7) ...
Setting up apache2-bin (2.4.29-1ubuntu4.27) ...
Setting up apache2 (2.4.29-1ubuntu4.27) ...
Enabling module mpm_event.
Enabling module authz_core.
Enabling module authz_host.
Enabling module authn_core.
Enabling module auth_basic.
Enabling module access_compat.
Enabling module authn_file.
Enabling module authz_user.
Enabling module alias.
Enabling module dir.
Enabling module autoindex.
Enabling module env.
Enabling module mime.
Enabling module negotiation.
Enabling module setenvif.
Enabling module filter.
Enabling module deflate.
Enabling module status.
Enabling module reqtimeout.
Enabling conf charset.
Enabling conf localized-error-pages.
Enabling conf other-vhosts-access-log.
Enabling conf security.
Enabling conf serve-cgi-bin.
Enabling site 000-default.
invoke-rc.d: could not determine current runlevel
invoke-rc.d: policy-rc.d denied execution of start.
Processing triggers for libc-bin (2.27-3ubuntu1.6) ...
root@bb641735c4a6:/# ls -alh
total 76K
drwxr-xr-x   22 root   root    4.0K Aug 30 16:12 .
drwxr-xr-x   22 root   root    4.0K Aug 30 16:12 ..
-rwxr-xr-x    1 root   root       0 Aug 30 16:12 .dockerenv
drwx------    2 root   root    4.0K Aug 30 16:12 .sysbox-procfs-3971741627
drwxr-xr-x    2 root   root    4.0K May 30  2023 bin
drwxr-xr-x    2 root   root    4.0K Apr 24  2018 boot
drwxr-xr-x    5 root   root     360 Aug 30 16:12 dev
drwxr-xr-x   39 root   root    4.0K Aug 30 16:25 etc
drwxr-xr-x    2 root   root    4.0K Apr 24  2018 home
drwxr-xr-x    8 root   root    4.0K May 23  2017 lib
drwxr-xr-x    2 root   root    4.0K May 30  2023 lib64
drwxr-xr-x    2 root   root    4.0K May 30  2023 media
drwxr-xr-x    2 root   root    4.0K May 30  2023 mnt
drwxr-xr-x    2 root   root    4.0K May 30  2023 opt
dr-xr-xr-x 1075 root   root       0 Aug 30 16:12 proc
drwx------    2 root   root    4.0K May 30  2023 root
drwxr-xr-x    5 root   root    4.0K May 30  2023 run
drwxr-xr-x    2 root   root    4.0K May 30  2023 sbin
drwxr-xr-x    2 root   root    4.0K May 30  2023 srv
dr-xr-xr-x   13 nobody nogroup    0 Aug  5 03:23 sys
drwxrwxrwt    2 root   root    4.0K Aug 30 16:25 tmp
drwxr-xr-x   10 root   root    4.0K May 30  2023 usr
drwxr-xr-x   12 root   root    4.0K Aug 30 16:25 var
root@bb641735c4a6:/# vi /etc/apache2/ports.conf
bash: vi: command not found
root@bb641735c4a6:/# nano /etc/apache2/ports.conf
bash: nano: command not found
root@bb641735c4a6:/# cd /etc/
root@bb641735c4a6:/etc# ls 
adduser.conf            gss            mailcap.order  rc6.d
alternatives            host.conf      mime.types     rcS.d
apache2                 hostname       mke2fs.conf    resolv.conf
apt                     hosts          mtab           rmt
bash.bashrc             init.d         network        rpc
bindresvport.blacklist  issue          networks       securetty
ca-certificates         issue.net      nsswitch.conf  security
ca-certificates.conf    kernel         opt            selinux
cloud                   ld.so.cache    os-release     services
cron.daily              ld.so.conf     pam.conf       shadow
debconf.conf            ld.so.conf.d   pam.d          shells
debian_version          ldap           passwd         skel
default                 legal          perl           ssl
deluser.conf            libaudit.conf  profile        subgid
dpkg                    logcheck       profile.d      subuid
environment             login.defs     protocols      sysctl.conf
fstab                   logrotate.d    rc0.d          sysctl.d
gai.conf                lsb-release    rc1.d          systemd
group                   machine-id     rc2.d          terminfo
group-                  magic          rc3.d          ufw
gshadow                 magic.mime     rc4.d          update-motd.d
gshadow-                mailcap        rc5.d
root@bb641735c4a6:/etc# cd apache2/
root@bb641735c4a6:/etc/apache2# ls
apache2.conf    envvars         mods-enabled     sites-enabled
conf-available  magic           ports.conf
conf-enabled    mods-available  sites-available
root@bb641735c4a6:/etc/apache2# cd ports.conf 
bash: cd: ports.conf: Not a directory
root@bb641735c4a6:/etc/apache2# vi ports.conf 
bash: vi: command not found
root@bb641735c4a6:/etc/apache2# nano ports.conf 
bash: nano: command not found
root@bb641735c4a6:/etc/apache2# apt update
Hit:1 http://security.ubuntu.com/ubuntu bionic-security InRelease
Hit:2 http://archive.ubuntu.com/ubuntu bionic InRelease
Hit:3 http://archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:4 http://archive.ubuntu.com/ubuntu bionic-backports InRelease
Reading package lists... Done                     
Building dependency tree       
Reading state information... Done
1 package can be upgraded. Run 'apt list --upgradable' to see it.
root@bb641735c4a6:/etc/apache2# apt install vim
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libgpm2 libmpdec2 libpython3.6 libpython3.6-minimal
  libpython3.6-stdlib libreadline7 readline-common vim-common
  vim-runtime xxd
Suggested packages:
  gpm readline-doc ctags vim-doc vim-scripts
The following NEW packages will be installed:
  libgpm2 libmpdec2 libpython3.6 libpython3.6-minimal
  libpython3.6-stdlib libreadline7 readline-common vim vim-common
  vim-runtime xxd
0 upgraded, 11 newly installed, 0 to remove and 1 not upgraded.
Need to get 10.7 MB of archives.
After this operation, 50.0 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu bionic/main amd64 libmpdec2 amd64 2.4.2-1ubuntu1 [84.1 kB]
Get:2 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libpython3.6-minimal amd64 3.6.9-1~18.04ubuntu1.12 [533 kB]
Get:3 http://archive.ubuntu.com/ubuntu bionic/main amd64 readline-common all 7.0-3 [52.9 kB]
Get:4 http://archive.ubuntu.com/ubuntu bionic/main amd64 libreadline7 amd64 7.0-3 [124 kB]
Get:5 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libpython3.6-stdlib amd64 3.6.9-1~18.04ubuntu1.12 [1713 kB]
Get:6 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 xxd amd64 2:8.0.1453-1ubuntu1.13 [51.9 kB]
Get:7 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 vim-common all 2:8.0.1453-1ubuntu1.13 [73.1 kB]
Get:8 http://archive.ubuntu.com/ubuntu bionic/main amd64 libgpm2 amd64 1.20.7-5 [15.1 kB]
Get:9 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libpython3.6 amd64 3.6.9-1~18.04ubuntu1.12 [1414 kB]
Get:10 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 vim-runtime all 2:8.0.1453-1ubuntu1.13 [5439 kB]
Get:11 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 vim amd64 2:8.0.1453-1ubuntu1.13 [1156 kB]
Fetched 10.7 MB in 2s (7035 kB/s)
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package libmpdec2:amd64.
(Reading database ... 7341 files and directories currently installed.)
Preparing to unpack .../00-libmpdec2_2.4.2-1ubuntu1_amd64.deb ...
Unpacking libmpdec2:amd64 (2.4.2-1ubuntu1) ...
Selecting previously unselected package libpython3.6-minimal:amd64.
Preparing to unpack .../01-libpython3.6-minimal_3.6.9-1~18.04ubuntu1.12_amd64.deb ...
Unpacking libpython3.6-minimal:amd64 (3.6.9-1~18.04ubuntu1.12) ...
Selecting previously unselected package readline-common.
Preparing to unpack .../02-readline-common_7.0-3_all.deb ...
Unpacking readline-common (7.0-3) ...
Selecting previously unselected package libreadline7:amd64.
Preparing to unpack .../03-libreadline7_7.0-3_amd64.deb ...
Unpacking libreadline7:amd64 (7.0-3) ...
Selecting previously unselected package libpython3.6-stdlib:amd64.
Preparing to unpack .../04-libpython3.6-stdlib_3.6.9-1~18.04ubuntu1.12_amd64.deb ...
Unpacking libpython3.6-stdlib:amd64 (3.6.9-1~18.04ubuntu1.12) ...
Selecting previously unselected package xxd.
Preparing to unpack .../05-xxd_2%3a8.0.1453-1ubuntu1.13_amd64.deb ...
Unpacking xxd (2:8.0.1453-1ubuntu1.13) ...
Selecting previously unselected package vim-common.
Preparing to unpack .../06-vim-common_2%3a8.0.1453-1ubuntu1.13_all.deb ...
Unpacking vim-common (2:8.0.1453-1ubuntu1.13) ...
Selecting previously unselected package libgpm2:amd64.
Preparing to unpack .../07-libgpm2_1.20.7-5_amd64.deb ...
Unpacking libgpm2:amd64 (1.20.7-5) ...
Selecting previously unselected package libpython3.6:amd64.
Preparing to unpack .../08-libpython3.6_3.6.9-1~18.04ubuntu1.12_amd64.deb ...
Unpacking libpython3.6:amd64 (3.6.9-1~18.04ubuntu1.12) ...
Selecting previously unselected package vim-runtime.
Preparing to unpack .../09-vim-runtime_2%3a8.0.1453-1ubuntu1.13_all.deb ...
Adding 'diversion of /usr/share/vim/vim80/doc/help.txt to /usr/share/vim/vim80/doc/help.txt.vim-tiny by vim-runtime'
Adding 'diversion of /usr/share/vim/vim80/doc/tags to /usr/share/vim/vim80/doc/tags.vim-tiny by vim-runtime'
Unpacking vim-runtime (2:8.0.1453-1ubuntu1.13) ...
Selecting previously unselected package vim.
Preparing to unpack .../10-vim_2%3a8.0.1453-1ubuntu1.13_amd64.deb ...
Unpacking vim (2:8.0.1453-1ubuntu1.13) ...
Setting up readline-common (7.0-3) ...
Setting up xxd (2:8.0.1453-1ubuntu1.13) ...
Setting up libgpm2:amd64 (1.20.7-5) ...
Setting up libreadline7:amd64 (7.0-3) ...
Setting up libpython3.6-minimal:amd64 (3.6.9-1~18.04ubuntu1.12) ...
Setting up vim-common (2:8.0.1453-1ubuntu1.13) ...
Setting up vim-runtime (2:8.0.1453-1ubuntu1.13) ...
Setting up libmpdec2:amd64 (2.4.2-1ubuntu1) ...
Setting up libpython3.6-stdlib:amd64 (3.6.9-1~18.04ubuntu1.12) ...
Setting up libpython3.6:amd64 (3.6.9-1~18.04ubuntu1.12) ...
Setting up vim (2:8.0.1453-1ubuntu1.13) ...
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/vim (vim) in auto mode
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/vimdiff (vimdiff) in auto mode
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/rvim (rvim) in auto mode
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/rview (rview) in auto mode
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/vi (vi) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/fr/man1/vi.1.gz because associated file /usr/share/man/fr/man1/vim.1.gz (of link group vi) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/it/man1/vi.1.gz because associated file /usr/share/man/it/man1/vim.1.gz (of link group vi) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/pl/man1/vi.1.gz because associated file /usr/share/man/pl/man1/vim.1.gz (of link group vi) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/ru/man1/vi.1.gz because associated file /usr/share/man/ru/man1/vim.1.gz (of link group vi) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/ja/man1/vi.1.gz because associated file /usr/share/man/ja/man1/vim.1.gz (of link group vi) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/vi.1.gz because associated file /usr/share/man/man1/vim.1.gz (of link group vi) doesn't exist
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/view (view) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/fr/man1/view.1.gz because associated file /usr/share/man/fr/man1/vim.1.gz (of link group view) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/it/man1/view.1.gz because associated file /usr/share/man/it/man1/vim.1.gz (of link group view) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/pl/man1/view.1.gz because associated file /usr/share/man/pl/man1/vim.1.gz (of link group view) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/ru/man1/view.1.gz because associated file /usr/share/man/ru/man1/vim.1.gz (of link group view) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/ja/man1/view.1.gz because associated file /usr/share/man/ja/man1/vim.1.gz (of link group view) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/view.1.gz because associated file /usr/share/man/man1/vim.1.gz (of link group view) doesn't exist
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/ex (ex) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/fr/man1/ex.1.gz because associated file /usr/share/man/fr/man1/vim.1.gz (of link group ex) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/it/man1/ex.1.gz because associated file /usr/share/man/it/man1/vim.1.gz (of link group ex) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/pl/man1/ex.1.gz because associated file /usr/share/man/pl/man1/vim.1.gz (of link group ex) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/ru/man1/ex.1.gz because associated file /usr/share/man/ru/man1/vim.1.gz (of link group ex) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/ja/man1/ex.1.gz because associated file /usr/share/man/ja/man1/vim.1.gz (of link group ex) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/ex.1.gz because associated file /usr/share/man/man1/vim.1.gz (of link group ex) doesn't exist
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/editor (editor) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/fr/man1/editor.1.gz because associated file /usr/share/man/fr/man1/vim.1.gz (of link group editor) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/it/man1/editor.1.gz because associated file /usr/share/man/it/man1/vim.1.gz (of link group editor) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/pl/man1/editor.1.gz because associated file /usr/share/man/pl/man1/vim.1.gz (of link group editor) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/ru/man1/editor.1.gz because associated file /usr/share/man/ru/man1/vim.1.gz (of link group editor) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/ja/man1/editor.1.gz because associated file /usr/share/man/ja/man1/vim.1.gz (of link group editor) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/editor.1.gz because associated file /usr/share/man/man1/vim.1.gz (of link group editor) doesn't exist
Processing triggers for mime-support (3.60ubuntu1) ...
Processing triggers for libc-bin (2.27-3ubuntu1.6) ...
root@bb641735c4a6:/etc/apache2#                
root@bb641735c4a6:/etc/apache2# 
root@bb641735c4a6:/etc/apache2# 
root@bb641735c4a6:/etc/apache2# vi ports.conf 
root@bb641735c4a6:/etc/apache2# cat ports.conf | grep Listen
Listen 6100
        Listen 443
        Listen 443
root@bb641735c4a6:/etc/apache2# service apache2 restart
 * Restarting Apache httpd web server apache2                            AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.12.0.2. Set the 'ServerName' directive globally to suppress this message
                                                                  [ OK ]
root@bb641735c4a6:/etc/apache2# service apache2 status
 * apache2 is running
root@bb641735c4a6:/etc/apache2# exit
exit
[root@stapp02 steve]# pwd
/home/steve
[root@stapp02 steve]# docker exec -it kkloud netstat -tlnp | grep 6100
[root@stapp02 steve]# docker exec -it kkloud ss -tlnp | grep 6100
[root@stapp02 steve]# docker exec -it kkloud service apache2 status
 * apache2 is running
[root@stapp02 steve]# docker exec -it kkloud cat /etc/apache2/ports.conf
# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 6100

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
[root@stapp02 steve]# docker exec -it kkloud lsof -i :6100
OCI runtime exec failed: exec failed: unable to start container process: exec: "lsof": executable file not found in $PATH: unknown
[root@stapp02 steve]# # Replace <container-ip> with the IP address of the kkloud container. You can find the container IP address using:

[root@stapp02 steve]# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kkloud
172.12.0.2
[root@stapp02 steve]# curl http://172.12.0.2:6100

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <!--
    Modified from the Debian original for Ubuntu
    Last updated: 2016-11-16
    See: https://launchpad.net/bugs/1288690
  -->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Apache2 Ubuntu Default Page: It works</title>
    <style type="text/css" media="screen">
  * {
    margin: 0px 0px 0px 0px;
    padding: 0px 0px 0px 0px;
  }

  body, html {
    padding: 3px 3px 3px 3px;

    background-color: #D8DBE2;

    font-family: Verdana, sans-serif;
    font-size: 11pt;
    text-align: center;
  }

  div.main_page {
    position: relative;
    display: table;

    width: 800px;

    margin-bottom: 3px;
    margin-left: auto;
    margin-right: auto;
    padding: 0px 0px 0px 0px;

    border-width: 2px;
    border-color: #212738;
    border-style: solid;

    background-color: #FFFFFF;

    text-align: center;
  }

  div.page_header {
    height: 99px;
    width: 100%;

    background-color: #F5F6F7;
  }

  div.page_header span {
    margin: 15px 0px 0px 50px;

    font-size: 180%;
    font-weight: bold;
  }

  div.page_header img {
    margin: 3px 0px 0px 40px;

    border: 0px 0px 0px;
  }

  div.table_of_contents {
    clear: left;

    min-width: 200px;

    margin: 3px 3px 3px 3px;

    background-color: #FFFFFF;

    text-align: left;
  }

  div.table_of_contents_item {
    clear: left;

    width: 100%;

    margin: 4px 0px 0px 0px;

    background-color: #FFFFFF;

    color: #000000;
    text-align: left;
  }

  div.table_of_contents_item a {
    margin: 6px 0px 0px 6px;
  }

  div.content_section {
    margin: 3px 3px 3px 3px;

    background-color: #FFFFFF;

    text-align: left;
  }

  div.content_section_text {
    padding: 4px 8px 4px 8px;

    color: #000000;
    font-size: 100%;
  }

  div.content_section_text pre {
    margin: 8px 0px 8px 0px;
    padding: 8px 8px 8px 8px;

    border-width: 1px;
    border-style: dotted;
    border-color: #000000;

    background-color: #F5F6F7;

    font-style: italic;
  }

  div.content_section_text p {
    margin-bottom: 6px;
  }

  div.content_section_text ul, div.content_section_text li {
    padding: 4px 8px 4px 16px;
  }

  div.section_header {
    padding: 3px 6px 3px 6px;

    background-color: #8E9CB2;

    color: #FFFFFF;
    font-weight: bold;
    font-size: 112%;
    text-align: center;
  }

  div.section_header_red {
    background-color: #CD214F;
  }

  div.section_header_grey {
    background-color: #9F9386;
  }

  .floating_element {
    position: relative;
    float: left;
  }

  div.table_of_contents_item a,
  div.content_section_text a {
    text-decoration: none;
    font-weight: bold;
  }

  div.table_of_contents_item a:link,
  div.table_of_contents_item a:visited,
  div.table_of_contents_item a:active {
    color: #000000;
  }

  div.table_of_contents_item a:hover {
    background-color: #000000;

    color: #FFFFFF;
  }

  div.content_section_text a:link,
  div.content_section_text a:visited,
   div.content_section_text a:active {
    background-color: #DCDFE6;

    color: #000000;
  }

  div.content_section_text a:hover {
    background-color: #000000;

    color: #DCDFE6;
  }

  div.validator {
  }
    </style>
  </head>
  <body>
    <div class="main_page">
      <div class="page_header floating_element">
        <img src="/icons/ubuntu-logo.png" alt="Ubuntu Logo" class="floating_element"/>
        <span class="floating_element">
          Apache2 Ubuntu Default Page
        </span>
      </div>
<!--      <div class="table_of_contents floating_element">
        <div class="section_header section_header_grey">
          TABLE OF CONTENTS
        </div>
        <div class="table_of_contents_item floating_element">
          <a href="#about">About</a>
        </div>
        <div class="table_of_contents_item floating_element">
          <a href="#changes">Changes</a>
        </div>
        <div class="table_of_contents_item floating_element">
          <a href="#scope">Scope</a>
        </div>
        <div class="table_of_contents_item floating_element">
          <a href="#files">Config files</a>
        </div>
      </div>
-->
      <div class="content_section floating_element">


        <div class="section_header section_header_red">
          <div id="about"></div>
          It works!
        </div>
        <div class="content_section_text">
          <p>
                This is the default welcome page used to test the correct 
                operation of the Apache2 server after installation on Ubuntu systems.
                It is based on the equivalent page on Debian, from which the Ubuntu Apache
                packaging is derived.
                If you can read this page, it means that the Apache HTTP server installed at
                this site is working properly. You should <b>replace this file</b> (located at
                <tt>/var/www/html/index.html</tt>) before continuing to operate your HTTP server.
          </p>


          <p>
                If you are a normal user of this web site and don't know what this page is
                about, this probably means that the site is currently unavailable due to
                maintenance.
                If the problem persists, please contact the site's administrator.
          </p>

        </div>
        <div class="section_header">
          <div id="changes"></div>
                Configuration Overview
        </div>
        <div class="content_section_text">
          <p>
                Ubuntu's Apache2 default configuration is different from the
                upstream default configuration, and split into several files optimized for
                interaction with Ubuntu tools. The configuration system is
                <b>fully documented in
                /usr/share/doc/apache2/README.Debian.gz</b>. Refer to this for the full
                documentation. Documentation for the web server itself can be
                found by accessing the <a href="/manual">manual</a> if the <tt>apache2-doc</tt>
                package was installed on this server.

          </p>
          <p>
                The configuration layout for an Apache2 web server installation on Ubuntu systems is as follows:
          </p>
          <pre>
/etc/apache2/
|-- apache2.conf
|       `--  ports.conf
|-- mods-enabled
|       |-- *.load
|       `-- *.conf
|-- conf-enabled
|       `-- *.conf
|-- sites-enabled
|       `-- *.conf
          </pre>
          <ul>
                        <li>
                           <tt>apache2.conf</tt> is the main configuration
                           file. It puts the pieces together by including all remaining configuration
                           files when starting up the web server.
                        </li>

                        <li>
                           <tt>ports.conf</tt> is always included from the
                           main configuration file. It is used to determine the listening ports for
                           incoming connections, and this file can be customized anytime.
                        </li>

                        <li>
                           Configuration files in the <tt>mods-enabled/</tt>,
                           <tt>conf-enabled/</tt> and <tt>sites-enabled/</tt> directories contain
                           particular configuration snippets which manage modules, global configuration
                           fragments, or virtual host configurations, respectively.
                        </li>

                        <li>
                           They are activated by symlinking available
                           configuration files from their respective
                           *-available/ counterparts. These should be managed
                           by using our helpers
                           <tt>
                                a2enmod,
                                a2dismod,
                           </tt>
                           <tt>
                                a2ensite,
                                a2dissite,
                            </tt>
                                and
                           <tt>
                                a2enconf,
                                a2disconf
                           </tt>. See their respective man pages for detailed information.
                        </li>

                        <li>
                           The binary is called apache2. Due to the use of
                           environment variables, in the default configuration, apache2 needs to be
                           started/stopped with <tt>/etc/init.d/apache2</tt> or <tt>apache2ctl</tt>.
                           <b>Calling <tt>/usr/bin/apache2</tt> directly will not work</b> with the
                           default configuration.
                        </li>
          </ul>
        </div>

        <div class="section_header">
            <div id="docroot"></div>
                Document Roots
        </div>

        <div class="content_section_text">
            <p>
                By default, Ubuntu does not allow access through the web browser to
                <em>any</em> file apart of those located in <tt>/var/www</tt>,
                <a href="http://httpd.apache.org/docs/2.4/mod/mod_userdir.html" rel="nofollow">public_html</a>
                directories (when enabled) and <tt>/usr/share</tt> (for web
                applications). If your site is using a web document root
                located elsewhere (such as in <tt>/srv</tt>) you may need to whitelist your
                document root directory in <tt>/etc/apache2/apache2.conf</tt>.
            </p>
            <p>
                The default Ubuntu document root is <tt>/var/www/html</tt>. You
                can make your own virtual hosts under /var/www. This is different
                to previous releases which provides better security out of the box.
            </p>
        </div>

        <div class="section_header">
          <div id="bugs"></div>
                Reporting Problems
        </div>
        <div class="content_section_text">
          <p>
                Please use the <tt>ubuntu-bug</tt> tool to report bugs in the
                Apache2 package with Ubuntu. However, check <a
                href="https://bugs.launchpad.net/ubuntu/+source/apache2"
                rel="nofollow">existing bug reports</a> before reporting a new bug.
          </p>
          <p>
                Please report bugs specific to modules (such as PHP and others)
                to respective packages, not to the web server itself.
          </p>
        </div>




      </div>
    </div>
    <div class="validator">
    </div>
  </body>
</html>

[root@stapp02 steve]# Listen 127.0.0.1:6100
bash: Listen: command not found
[root@stapp02 steve]# http://127.0.0.1
bash: http://127.0.0.1: No such file or directory
[root@stapp02 steve]# history | cut -c 8-
docker ps -a
# Or
docker ps -a | grep kkloud
docker exec -it kkloud bash
pwd
docker exec -it kkloud netstat -tlnp | grep 6100
docker exec -it kkloud ss -tlnp | grep 6100
docker exec -it kkloud service apache2 status
docker exec -it kkloud cat /etc/apache2/ports.conf
docker exec -it kkloud lsof -i :6100
# Replace <container-ip> with the IP address of the kkloud container. You can find the container IP address using:
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kkloud
curl http://172.12.0.2:6100
Listen 127.0.0.1:6100
http://127.0.0.1
history | cut -c 8-
[root@stapp02 steve]# 
