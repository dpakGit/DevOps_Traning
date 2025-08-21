### Task :

Explain the following task clearly and very elaborately - The DevOps team established a new Git repository last week, which remains unused at present. However, the Nautilus application development team now requires a copy of this repository on the Storage Server in the Stratos DC. Follow the provided details to clone the repository:



The repository to be cloned is located at /opt/ecommerce.git


Clone this Git repository to the /usr/src/kodekloudrepos directory. Ensure no modifications are made to the repository during the cloning process.

-------------------------------------------------

 Read it : https://tundedamian.medium.com/day-22-of-100-days-of-devops-cloning-a-bare-git-repository-f0af74ad5002

---------------------------------


### What I Did

```
thor@jumphost ~$ ssh natasha@ststor01

[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos

[natasha@ststor01 kodekloudrepos]$ sudo git clone /opt/ecommerce.git

[natasha@ststor01 kodekloudrepos]$ ls 
ecommerce

[natasha@ststor01 kodekloudrepos]$ ls -la
total 12
drwxr-xr-x 3 root root 4096 Aug 21 13:09 .
drwxr-xr-x 1 root root 4096 Aug 21 13:07 ..
drwxr-xr-x 3 root root 4096 Aug 21 13:09 ecommerce

[natasha@ststor01 kodekloudrepos]$ ls -alh
total 12K
drwxr-xr-x 3 root root 4.0K Aug 21 13:09 .
drwxr-xr-x 1 root root 4.0K Aug 21 13:07 ..
drwxr-xr-x 3 root root 4.0K Aug 21 13:09 ecommerce

[natasha@ststor01 kodekloudrepos]$ cd ecommerce/

[natasha@ststor01 ecommerce]$ ls

[natasha@ststor01 ecommerce]$ ls -la
total 12
drwxr-xr-x 3 root root 4096 Aug 21 13:09 .
drwxr-xr-x 3 root root 4096 Aug 21 13:09 ..
drwxr-xr-x 7 root root 4096 Aug 21 13:09 .git

[natasha@ststor01 ecommerce]$ ls -alh
total 12K
drwxr-xr-x 3 root root 4.0K Aug 21 13:09 .
drwxr-xr-x 3 root root 4.0K Aug 21 13:09 ..
drwxr-xr-x 7 root root 4.0K Aug 21 13:09 .git

[natasha@ststor01 ecommerce]$ cd ~

[natasha@ststor01 ~]$ ls -la /opt/ecommerce.git
total 40
drwxr-xr-x 7 root root 4096 Aug 21 13:07 .
drwxr-xr-x 1 root root 4096 Aug 21 13:07 ..
-rw-r--r-- 1 root root   23 Aug 21 13:07 HEAD
drwxr-xr-x 2 root root 4096 Aug 21 13:07 branches
-rw-r--r-- 1 root root   66 Aug 21 13:07 config
-rw-r--r-- 1 root root   73 Aug 21 13:07 description
drwxr-xr-x 2 root root 4096 Aug 21 13:07 hooks
drwxr-xr-x 2 root root 4096 Aug 21 13:07 info
drwxr-xr-x 4 root root 4096 Aug 21 13:07 objects
drwxr-xr-x 4 root root 4096 Aug 21 13:07 refs

[natasha@ststor01 ~]$ ls -alh /opt/ecommerce.git
total 40K
drwxr-xr-x 7 root root 4.0K Aug 21 13:07 .
drwxr-xr-x 1 root root 4.0K Aug 21 13:07 ..
-rw-r--r-- 1 root root   23 Aug 21 13:07 HEAD
drwxr-xr-x 2 root root 4.0K Aug 21 13:07 branches
-rw-r--r-- 1 root root   66 Aug 21 13:07 config
-rw-r--r-- 1 root root   73 Aug 21 13:07 description
drwxr-xr-x 2 root root 4.0K Aug 21 13:07 hooks
drwxr-xr-x 2 root root 4.0K Aug 21 13:07 info
drwxr-xr-x 4 root root 4.0K Aug 21 13:07 objects
drwxr-xr-x 4 root root 4.0K Aug 21 13:07 refs

# The above output shows that the repo is correctly cloned

```
## Navigate to the Target/Destination directory and then run the clone command.

- Note : Dont directly run the clone command from the terminal, go to the destination and run the clone command there

Don't do the following "git clone /opt/media.git /usr/src/kodekloudrepos"

git clone: Command to clone a Git repository.
/opt/media.git: Source bare repository path.
/usr/src/kodekloudrepos: Target directory for the clone.
