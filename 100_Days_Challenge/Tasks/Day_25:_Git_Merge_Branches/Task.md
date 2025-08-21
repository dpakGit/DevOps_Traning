


```
thor@jumphost ~$ ssh natasha@ststor01

[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/games

[natasha@ststor01 games]$ ls -alh
total 20K
drwxr-xr-x 3 root root 4.0K Aug 21 15:35 .
drwxr-xr-x 3 root root 4.0K Aug 21 15:35 ..
drwxr-xr-x 8 root root 4.0K Aug 21 15:35 .git
-rw-r--r-- 1 root root   34 Aug 21 15:35 info.txt
-rw-r--r-- 1 root root   26 Aug 21 15:35 welcome.txt
[natasha@ststor01 games]$ sudo git branch

* master

[natasha@ststor01 games]$ sudo git checkout master

Already on 'master'

Your branch is up to date with 'origin/master'.

[natasha@ststor01 games]$ sudo -s

[root@ststor01 games]# git checkout master
Already on 'master'
Your branch is up to date with 'origin/master'.

[root@ststor01 games]# git branch datacenter 

[root@ststor01 games]# git branch

  datacenter

* master

[root@ststor01 games]# git checkout datacenter

Switched to branch 'datacenter'

[root@ststor01 games]# git branch

* datacenter

  master

[root@ststor01 games]# cp /tmp/index.html .

[root@ststor01 games]# ls

index.html  info.txt  welcome.txt

[root@ststor01 games]# git add index.html 

[root@ststor01 games]# git commit -m "Add index.html in datacenter branch"

[datacenter c1ffd5a] Add index.html in datacenter branch
 1 file changed, 1 insertion(+)
 create mode 100644 index.html

[root@ststor01 games]# ls

index.html  info.txt  welcome.txt

[root@ststor01 games]# git checkout master

Switched to branch 'master'
Your branch is up to date with 'origin/master'.

[root@ststor01 games]# git branch  

datacenter

* master

[root@ststor01 games]# git merge datacenter

Updating 3382ddf..c1ffd5a

Fast-forward

 index.html | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 index.html

[root@ststor01 games]# git push origin datacenter master

Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 16 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 345 bytes | 345.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To /opt/games.git
   3382ddf..c1ffd5a  master -> master
 * [new branch]      datacenter -> datacenter

[root@ststor01 games]# git status
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```
```
history | cut -c 8-
git checkout master
git branch datacenter 
git branch
git checkout datacenter
git branch
cp /tmp/index.html .
ls
git add index.html 
git commit -m "Add index.html in datacenter branch"
ls
git checkout master
git branch
git merge datacenter
git push origin datacenter master
git status
```

```
Breakdown of Commands
1. *git checkout master*: Switches to the master branch.
2. *git branch datacenter*: Creates a new branch named datacenter from the current (master) branch.
3. *git branch*: Lists all branches in the repo.
4. *git checkout datacenter*: Switches to the datacenter branch.
5. *git branch*: Lists all branches again (current branch is datacenter).
6. cp /tmp/index.html .: Copies index.html from /tmp to the current directory.
7. *ls*: Lists files in the current directory (likely to verify index.html is there).
8. git add index.html: Stages index.html for commit.
9. git commit -m "Add index.html in datacenter branch": Commits index.html to datacenter with a message.
10. *ls*: Lists files again (possibly to verify).
11. *git checkout master*: Switches back to master.
12. *git branch*: Lists branches (shows master is current).
13. *git merge datacenter*: Merges changes from datacenter into master.
14. *git push origin datacenter master*: Pushes both datacenter and master branches to the remote origin.
15. *git status*: Shows the current status of the repo on master.

Do you need help with:
- Understanding any of these Git commands?
- Working with branches or merging in Git?
- Something else related to this Git workflow?
```
