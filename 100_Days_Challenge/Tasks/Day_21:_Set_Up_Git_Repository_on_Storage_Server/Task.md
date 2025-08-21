```
[natasha@ststor01 ~]$ git --version
git version 2.47.3
[natasha@ststor01 ~]$ sudo git init --bare /opt/cluster.git
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint:
hint:   git config --global init.defaultBranch <name>
hint:
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint:
hint:   git branch -m <name>
Initialized empty Git repository in /opt/cluster.git/
[natasha@ststor01 ~]$ ls /opt/cluster.git
HEAD  branches  config  description  hooks  info  objects  refs
[natasha@ststor01 ~]$ git branch -m master
fatal: not a git repository (or any of the parent directories): .git
[natasha@ststor01 ~]$ git branch -m master
fatal: not a git repository (or any of the parent directories): .git
[natasha@ststor01 ~]$ m master
fatal: not a git repository (or any of the parent directories): .git
[natasha@ststor01 ~]$ 
-bash: m: command not found
-bash: syntax error near unexpected token `('
-bash: [natasha@ststor01: command not found
[natasha@ststor01 ~]$ ls -1 /opt/cluster.git
HEAD
branches
config
description
hooks
info
objects
refs
[natasha@ststor01 ~]$ cat /opt/cluster.git/HEAD
ref: refs/heads/master
[natasha@ststor01 ~]$ history | cut -c 8-
sudo yum install git -y
git --version
sudo git init --bare /opt/cluster.git
ls /opt/cluster.git
git branch -m master
m master
fatal: not a git repository (or any of the parent directories): .git
[natasha@ststor01 ~]$ 
ls -1 /opt/cluster.git
cat /opt/cluster.git/HEAD
history | cut -c 8-
[natasha@ststor01 ~]$

```
