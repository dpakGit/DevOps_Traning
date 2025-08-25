### Task.md





thor@jumphost ~$ ssh natasha@172.16.238.15
The authenticity of host '172.16.238.15 (172.16.238.15)' can't be established.
ED25519 key fingerprint is SHA256:io49OCsXaIPndX3YcGNjxneufRrdZOkFhx5K0yjFqAU.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.16.238.15' (ED25519) to the list of known hosts.
natasha@172.16.238.15's password: 
[natasha@ststor01 ~]$ sudo -s

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for natasha: 
[root@ststor01 natasha]# cd /usr/src/kodekloudrepos
[root@ststor01 kodekloudrepos]# ls -alh
total 12K
drwxr-xr-x 3 root root 4.0K Aug 25 06:42 .
drwxr-xr-x 1 root root 4.0K Aug 25 06:42 ..
drwxr-xr-x 3 root root 4.0K Aug 25 06:42 blog
[root@ststor01 kodekloudrepos]# cd ~
[root@ststor01 ~]# cd /usr/src/kodekloudrepos/blog/
[root@ststor01 blog]# ls -alh
total 20K
drwxr-xr-x 3 root root 4.0K Aug 25 06:42 .
drwxr-xr-x 3 root root 4.0K Aug 25 06:42 ..
drwxr-xr-x 8 root root 4.0K Aug 25 06:42 .git
-rw-r--r-- 1 root root   22 Aug 25 06:42 feature.txt
-rw-r--r-- 1 root root   34 Aug 25 06:42 info.txt
[root@ststor01 blog]# cd .git/
[root@ststor01 .git]# ls -alh
total 52K
drwxr-xr-x  8 root root 4.0K Aug 25 06:42 .
drwxr-xr-x  3 root root 4.0K Aug 25 06:42 ..
-rw-r--r--  1 root root   12 Aug 25 06:42 COMMIT_EDITMSG
-rw-r--r--  1 root root   24 Aug 25 06:42 HEAD
drwxr-xr-x  2 root root 4.0K Aug 25 06:42 branches
-rw-r--r--  1 root root  238 Aug 25 06:42 config
-rw-r--r--  1 root root   73 Aug 25 06:42 description
drwxr-xr-x  2 root root 4.0K Aug 25 06:42 hooks
-rw-r--r--  1 root root  217 Aug 25 06:42 index
drwxr-xr-x  2 root root 4.0K Aug 25 06:42 info
drwxr-xr-x  3 root root 4.0K Aug 25 06:42 logs
drwxr-xr-x 10 root root 4.0K Aug 25 06:42 objects
drwxr-xr-x  5 root root 4.0K Aug 25 06:42 refs
[root@ststor01 .git]# cd ~
[root@ststor01 ~]# pwd
/root
[root@ststor01 ~]# cd /opt/blog.git/
[root@ststor01 blog.git]# ls -alh
total 40K
drwxr-xr-x  7 root root 4.0K Aug 25 06:42 .
drwxr-xr-x  1 root root 4.0K Aug 25 06:42 ..
-rw-r--r--  1 root root   23 Aug 25 06:42 HEAD
drwxr-xr-x  2 root root 4.0K Aug 25 06:42 branches
-rw-r--r--  1 root root   66 Aug 25 06:42 config
-rw-r--r--  1 root root   73 Aug 25 06:42 description
drwxr-xr-x  2 root root 4.0K Aug 25 06:42 hooks
drwxr-xr-x  2 root root 4.0K Aug 25 06:42 info
drwxr-xr-x 10 root root 4.0K Aug 25 06:42 objects
drwxr-xr-x  4 root root 4.0K Aug 25 06:42 refs
[root@ststor01 blog.git]# cd ~
[root@ststor01 ~]# cd /opt/blog.git/hooks/
[root@ststor01 hooks]# ls -alh
total 72K
drwxr-xr-x 2 root root 4.0K Aug 25 06:42 .
drwxr-xr-x 7 root root 4.0K Aug 25 06:42 ..
-rwxr-xr-x 1 root root  482 Aug 25 06:42 applypatch-msg.sample
-rwxr-xr-x 1 root root  900 Aug 25 06:42 commit-msg.sample
-rwxr-xr-x 1 root root 4.7K Aug 25 06:42 fsmonitor-watchman.sample
-rwxr-xr-x 1 root root  193 Aug 25 06:42 post-update.sample
-rwxr-xr-x 1 root root  428 Aug 25 06:42 pre-applypatch.sample
-rwxr-xr-x 1 root root 1.7K Aug 25 06:42 pre-commit.sample
-rwxr-xr-x 1 root root  420 Aug 25 06:42 pre-merge-commit.sample
-rwxr-xr-x 1 root root 1.4K Aug 25 06:42 pre-push.sample
-rwxr-xr-x 1 root root 4.8K Aug 25 06:42 pre-rebase.sample
-rwxr-xr-x 1 root root  548 Aug 25 06:42 pre-receive.sample
-rwxr-xr-x 1 root root 1.5K Aug 25 06:42 prepare-commit-msg.sample
-rwxr-xr-x 1 root root 2.8K Aug 25 06:42 push-to-checkout.sample
-rwxr-xr-x 1 root root 2.3K Aug 25 06:42 sendemail-validate.sample
-rwxr-xr-x 1 root root 3.6K Aug 25 06:42 update.sample
[root@ststor01 hooks]# vi post-update
[root@ststor01 hooks]# chmod +x post-update
[root@ststor01 hooks]# git branch
  feature
* master
[root@ststor01 hooks]# git checkout master
fatal: this operation must be run in a work tree
[root@ststor01 hooks]# cd ~
[root@ststor01 ~]# pwd
/root
[root@ststor01 ~]# cd /usr/src/kodekloudrepos
[root@ststor01 kodekloudrepos]# ls -alh
total 12K
drwxr-xr-x 3 root root 4.0K Aug 25 06:42 .
drwxr-xr-x 1 root root 4.0K Aug 25 06:42 ..
drwxr-xr-x 3 root root 4.0K Aug 25 06:42 blog
[root@ststor01 kodekloudrepos]# cd ~
[root@ststor01 ~]# cd /usr/src/kodekloudrepos/blog/
[root@ststor01 blog]# ls -alh
total 20K
drwxr-xr-x 3 root root 4.0K Aug 25 06:42 .
drwxr-xr-x 3 root root 4.0K Aug 25 06:42 ..
drwxr-xr-x 8 root root 4.0K Aug 25 06:42 .git
-rw-r--r-- 1 root root   22 Aug 25 06:42 feature.txt
-rw-r--r-- 1 root root   34 Aug 25 06:42 info.txt
[root@ststor01 blog]# git branch
* feature
  master
[root@ststor01 blog]# git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
[root@ststor01 blog]# git branch
  feature
* master
[root@ststor01 blog]# git mearge feature
git: 'mearge' is not a git command. See 'git --help'.

The most similar command is
        merge
[root@ststor01 blog]# git merge feature
Updating 9786952..c91608f
Fast-forward
 feature.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 feature.txt
[root@ststor01 blog]# git log
commit c91608f6134d0eed8978328d880986c396d7c9bc (HEAD -> master, origin/feature, feature)
Author: Admin <admin@kodekloud.com>
Date:   Mon Aug 25 06:42:26 2025 +0000

    Add feature

commit 9786952055dd150f92e4adcbd724157bd70330d4 (origin/master)
Author: Admin <admin@kodekloud.com>
Date:   Mon Aug 25 06:42:26 2025 +0000

    initial commit
[root@ststor01 blog]# git push origin master # Triggers hook in bare repo 
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0
To /opt/blog.git
   9786952..c91608f  master -> master
[root@ststor01 blog]# git tag
[root@ststor01 blog]# git tag | grep "release-$(date +%Y-%m-%d)"
[root@ststor01 blog]# cd ~
[root@ststor01 ~]# cd /opt/blog.git
git tag | grep "release-$(date +%Y-%m-%d)"
release-2025-08-25
[root@ststor01 blog.git]# git tag
release-2025-08-25
[root@ststor01 blog.git]# git tag | grep "release-$(date +%Y-%m-%d)"
release-2025-08-25
[root@ststor01 blog.git]# git log
commit c91608f6134d0eed8978328d880986c396d7c9bc (HEAD -> master, tag: release-2025-08-25, feature)
Author: Admin <admin@kodekloud.com>
Date:   Mon Aug 25 06:42:26 2025 +0000

    Add feature

commit 9786952055dd150f92e4adcbd724157bd70330d4
Author: Admin <admin@kodekloud.com>
Date:   Mon Aug 25 06:42:26 2025 +0000

    initial commit
[root@ststor01 blog.git]# #  *Tag release-2025-08-25 exists* in the bare repo /opt/blog.git.
[root@ststor01 blog.git]# git tag | grep "release-$(date +%Y-%m-%d)"release-2025-08-25
[root@ststor01 blog.git]# git tagrelease-2025-08-25
[root@ststor01 blog.git]# ls -alh
total 40K
drwxr-xr-x  7 root root 4.0K Aug 25 06:57 .
drwxr-xr-x  1 root root 4.0K Aug 25 06:42 ..
-rw-r--r--  1 root root   23 Aug 25 06:42 HEAD
drwxr-xr-x  2 root root 4.0K Aug 25 06:42 branches
-rw-r--r--  1 root root   66 Aug 25 06:42 config
-rw-r--r--  1 root root   73 Aug 25 06:42 description
drwxr-xr-x  2 root root 4.0K Aug 25 06:52 hooks
drwxr-xr-x  2 root root 4.0K Aug 25 06:42 info
drwxr-xr-x 10 root root 4.0K Aug 25 06:57 objects
drwxr-xr-x  4 root root 4.0K Aug 25 06:42 refs
[root@ststor01 blog.git]# cat hooks/post-update
#!/bin/bash
for ref in "$@"; do
if [ "$ref" = "refs/heads/master" ]; then
DATE=$(date +%Y-%m-%d)
git tag "release-$DATE"
fi
done

[root@ststor01 blog.git]# history |cut -c 8-
cd /usr/src/kodekloudrepos
ls -alh
cd ~
cd /usr/src/kodekloudrepos/blog/
ls -alh
cd .git/
ls -alh
cd ~
pwd
cd /opt/blog.git/
ls -alh
cd ~
cd /opt/blog.git/hooks/
ls -alh
vi post-update
chmod +x post-update
git branch
git checkout master
cd ~
pwd
cd /usr/src/kodekloudrepos
ls -alh
cd ~
cd /usr/src/kodekloudrepos/blog/
ls -alh
git branch
git checkout master
git branch
git mearge feature
git merge feature
git log
git push origin master # Triggers hook in bare repo
git tag
git tag | grep "release-$(date +%Y-%m-%d)"
cd ~
cd /opt/blog.git
git tag | grep "release-$(date +%Y-%m-%d)"
git tag
git tag | grep "release-$(date +%Y-%m-%d)"
git log
#  *Tag release-2025-08-25 exists* in the bare repo /opt/blog.git.
git tag | grep "release-$(date +%Y-%m-%d)"
git tag
ls -alh
cat hooks/post-update
history |cut -c 8-
[root@ststor01 blog.git]# 
