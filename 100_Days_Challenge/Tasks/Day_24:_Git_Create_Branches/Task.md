### Task : 
Nautilus developers are actively working on one of the project repositories, /usr/src/kodekloudrepos/ecommerce. Recently, they decided to implement some new features in the application, and they want to maintain those new changes in a separate branch. Below are the requirements that have been shared with the DevOps team:

On Storage server in Stratos DC create a new branch xfusioncorp_ecommerce from master branch in /usr/src/kodekloudrepos/ecommerce git repo.

Please do not try to make any changes in the code.


-----------------------
https://tundedamian.medium.com/day-24-of-100-days-of-devops-creating-a-secure-feature-branch-from-master-in-a-system-owned-git-2f18536666bc

------------------------

### What I did
```
thor@jumphost ~$ ssh natasha@ststor01

cd /usr/src/kodekloudrepos/ecommerce

ls

ls -alh

git branch

git config --global --add safe.directory /usr/src/kodekloudrepos/ecommerce

git branch

sudo git checkout master

sudo git branch

sudo git branch xfusioncorp_ecommerce

sudo git branch

sudo git checkout xfusioncorp_ecommerce

sudo git branch
```


Troubleshoot the following message:

[natasha@ststor01 ecommerce]$ git branch
fatal: detected dubious ownership in repository at '/usr/src/kodekloudrepos/ecommerce'
To add an exception for this directory, call:

        git config --global --add safe.directory /usr/src/kodekloudrepos/ecommerce

[natasha@ststor01 ecommerce]$ git config --global --add safe.directory /usr/src/kodekloudrepos/ecommerce

[natasha@ststor01 ecommerce]$ git branch
* kodekloud_ecommerce
  master


- Solution:
  run with sudo


  ---------------------------------

  Meta AI :

  Task Explanation: Creating a New Branch
- Task: In the Git repository /usr/src/kodekloudrepos/ecommerce on the Storage server in Stratos DC:
- Create a new branch named xfusioncorp_ecommerce.
- Branch off from the master branch.
- Requirement:
- No changes to the code.
- Simply create the new branch.

Steps to Create the Branch
- Command to create new branch:

bash
cd /usr/src/kodekloudrepos/ecommerce
git checkout master
git branch xfusioncorp_ecommerce

- Explanation:
- cd into the repo.
- git checkout master ensures you're on master.
- git branch xfusioncorp_ecommerce creates the new branch.

Outcome
- New branch xfusioncorp_ecommerce is created from master.
- No code changes made.

Do you need help with:
- *Switching to the new xfusioncorp_ecommerce branch*?
- Working with branches in Git?
- Something else related to this Git branching task?
