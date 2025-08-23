### Task:

The Nautilus application development team has been working on a project repository /opt/cluster.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with the DevOps team:

There are two branches in this repository, master and feature. One of the developers is working on the feature branch and their work is still in progress, however they want to merge one of the commits from the feature branch to the master branch, the message for the commit that needs to be merged into master is Update info.txt. Accomplish this task for them, also remember to push your changes eventually.

------------------------------------------------

### What I Did

thor@jumphost ~$ ssh natasha@ststor01   

[natasha@ststor01 ~]$ sudo -s

[root@ststor01 natasha]# cd /usr/src/kodekloudrepos/

[root@ststor01 kodekloudrepos]# ls -alh
total 12K
drwxr-xr-x 3 root root 4.0K Aug 23 12:45 .
drwxr-xr-x 1 root root 4.0K Aug 23 12:45 ..
drwxr-xr-x 3 root root 4.0K Aug 23 12:45 cluster

[root@ststor01 kodekloudrepos]# cd cluster/

[root@ststor01 cluster]# ls -alh

total 20K
drwxr-xr-x 3 root root 4.0K Aug 23 12:45 .
drwxr-xr-x 3 root root 4.0K Aug 23 12:45 ..
drwxr-xr-x 8 root root 4.0K Aug 23 12:45 .git
-rw-r--r-- 1 root root   35 Aug 23 12:45 info.txt
-rw-r--r-- 1 root root   17 Aug 23 12:45 welcome.txt

Note: *Operations Should Be in cluster Directory*
- Context: cluster is the Git repository.
- Reason: To perform Git operations (like cherry-pick, push), you must be inside the repo (cluster).
- Path: /usr/src/kodekloudrepos/cluster.

[root@ststor01 cluster]# git status
On branch feature
nothing to commit, working tree clean

[root@ststor01 cluster]# git branch

* feature

  master

[root@ststor01 cluster]# git log

Note: Exiting Git Log Page
- Method: Press q (for quit).
- Context: git log uses a pager (like less) to show output.
- Result: Pressing q exits the log view and returns to terminal.


[root@ststor01 cluster]# git log --oneline

334ac19 (HEAD -> feature, origin/feature) Update welcome.txt

730d227 Update info.txt

f2d0fec (origin/master, master) Add welcome.txt

316efdd initial commit

[root@ststor01 cluster]# git log feature --oneline

334ac19 (HEAD -> feature, origin/feature) Update welcome.txt
730d227 Update info.txt
f2d0fec (origin/master, master) Add welcome.txt
316efdd initial commit


Note: *Command: git log feature --oneline*

- Effect: Shows commit history of feature branch in one-line format.

- Output: Compact view with commit hashes and messages.

Example Output
abc123 Update info.txt
def456 Add new feature code
ghi789 Initial commit on feature


Note: *Running git log feature --oneline*

- Branch requirement: Doesn't matter which branch you're on.

- Effect: Shows commit history of feature branch in one-line format regardless of current branch.

Reason
- git log <branch> views history of specified branch.
- Current checked-out branch doesn't affect this.

[root@ststor01 cluster]# git branch
* feature
  master

[root@ststor01 cluster]#  git checkout master

Switched to branch 'master'
Your branch is up to date with 'origin/master'.

[root@ststor01 cluster]# git branch
  feature
* master

Note: This is crucial — cherry-picking applies the commit to the currently checked-out branch.

[root@ststor01 cluster]# git cherry-pick 730d227

[master c8d4adb] Update info.txt
 Date: Sat Aug 23 12:45:13 2025 +0000
 1 file changed, 1 insertion(+), 1 deletion(-)

[root@ststor01 cluster]# git log --oneline  # To Verify if cherry command worked

c8d4adb (HEAD -> master) Update info.txt
f2d0fec (origin/master) Add welcome.txt
316efdd initial commit

[root@ststor01 cluster]# git show HEAD  # This command is also to verify if cherry command worked

commit c8d4adb3b79e61b55a00588d63221494fb2fee35 (HEAD -> master)
Author: Admin <admin@kodekloud.com>
Date:   Sat Aug 23 12:45:13 2025 +0000

    Update info.txt

diff --git a/info.txt b/info.txt
index 255b540..7b9e8cc 100644
--- a/info.txt
+++ b/info.txt
@@ -1 +1 @@
-Welcome to xFusionCorp Industries
+Welcome to xFusionCorp Industries!

[root@ststor01 cluster]# git push origin master

Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 16 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 316 bytes | 316.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To /opt/cluster.git
   f2d0fec..c8d4adb  master -> master

[root@ststor01 cluster]# git log
commit c8d4adb3b79e61b55a00588d63221494fb2fee35 (HEAD -> master, origin/master)
Author: Admin <admin@kodekloud.com>
Date:   Sat Aug 23 12:45:13 2025 +0000

    Update info.txt

commit f2d0fec93ecc9322e021074a8bfc668bda500943
Author: Admin <admin@kodekloud.com>
Date:   Sat Aug 23 12:45:12 2025 +0000

    Add welcome.txt

commit 316efdd918cdfc63c8858cbd6e680c87392b0b65
Author: Admin <admin@kodekloud.com>
Date:   Sat Aug 23 12:45:12 2025 +0000

    initial commit
```
 
history | cut -c 8-
cd /usr/src/kodekloudrepos
ls -alh
cd cluster/
ls -alh
git status
git branch
git log
git log --oneline
git log feature - oneline
git log feature --oneline
git branch
commit_hash=$(git log --oneline | grep "Update info.txt" | awk '{print $1}')
git log feature --oneline
 git checkout master
git branch
# This is crucial — cherry-picking applies the commit to the currently checked-out branch.
git cherry-pick 730d227
git log --oneline
git show HEAD
git push origin master
git log
History | cut -c 8-
history | cut -c 8-
[root@ststor01 cluster]# 
