root@ip-172-31-23-213:/home/ubuntu/myrevision# history | cut -c 8-
git --version
cls
clear
ls -alh
git init myrevision
git branch
ls
cd myrevision/
ls
ls -alh
git branch
git branch --show-current # To find out which branch you are currently on
git log --graph
vi myapp.py
git status
git add .
git status
git commit -m "First commit"
git status
git push
git remote add origin git@github.com:dpakGit/myrevision.git
git branch -M main
git push -u origin main
git push
git push -u origin main
cd ..
pwd
ssh-keygen
cat git push -u origin main
cat /root/.ssh/id_ed25519.pub
sudo -s
history
ls
cd myrevision/
history
git remote add origin git@github.com:dpakGit/myrevision.git
git branch -M main
git push -u origin main
git push
git log
git log --oneline
vi myapp.py 
git add myapp.py 
git status
git commit -m "SECOMD COMMIT"
git push
git log
git log --oneline
git diff
git difference
git diff d7223e3 f571220
git diff f571220 d7223e3
git checkout d7223e3
cat myapp.py 
git log one line
git log --oneline
git checkout f571220
cat myapp.py 
git checkout main
cat myapp.py 
git log f571220
# GIT IGNORE / .gitignore file
vi .gitignore
touch file1.pyc file2.txt
git status
# Use the git add and commit command to add the .gitignore file 
git add .gitignore 
git commit -m ".gitignore file added"
git status
git push
vi file2.pyc
ls
git status
ls
ls -alh
vi .gitignore 
git add .gitignore 
git commit -m ".gitignore file added"
git status
git checkout main
git branch --show-current
git checkout main
vi .gitignore 
git status
git add .gitignore 
git commit -m ".gitignore file committed"
git status
touch abc.py
git status
rm -rf abc.py 
ls
touch abc.pyc
git status
git branch 
git branch dev1
git branch 
git branch --show-current
cd myrevision/
ls
git branch --show
git branch --show-current
git branch dev1
git branch
git checkout dev1
git branch
ls
vi myapp.py 
git status
git add myapp.py 
git commit -m "first commit in dev1 branch"
# Following is the command to push a branch to git hub
git push -u origin dev1
git push
git status
git branch
cat myapp.py 
git checkout main
git branch
cat myapp.py 
git merge dev1
cat myapp.py 
git log
git add myapp.py 
git commit -m "merged dev1 branch with main"
git log
git revert
git log
git revert b89c865
git log
git add .
git commit -m "revert commit "
git log
git push
git pull
git log
git push
git pull
git push
git log
git brancg -r
git branch -r
git log
git reset --hard HEAD
git reset --m
git checkout dev1
git branch
vi myapp.py 
git status
git add .
git commit -m "merge test"
git checkout main
ls
cat myapp.py 
vi myapp.py 
git merge dev1 # Merge conflict
git status
git add myapp.py 
git commit -m "latest commit while merge practice"
git merge dev1 # Merge conflict
vi myapp.py 
git merge dev1 # Merge conflict
git add myapp.py 
git commit -m "merge complete successfully"
git merge dev1 # Merge conflict
git push
vi resetfile.py
git status
git add .
git branch
git status
git reset --mixed
git status
git add .
hit reset --hard
git reset --hard
ls
git branch
vi README.MD
git status
git add .
git commit -m "README FILR ADDED"
GIT PUSH
git push
history
vi README.MD 
git add .
git commit -m "README FILe edited"
git push
git pull
cat README.py 
cd myrevision/
ls
vi myapp.py 
ls
git status
ls
rm -rf *
ls
git status
git restore * # Restores all the files deleted by git rm -rf command
ls
rm -rf *
ls
vi app.py
git branch
git checkout dev1
ls
rm -rf myapp.py 
vi app.py 
git checkout main
git branch
rm -rf abc.pyc 
ls
rm -rf *
ls
git add . 
git commit -m "msg"
git push
ls
git status
git branch -D dev1
git branch
git add . 
git commit -m "msg"
git push
clear
git merge practice
# GIT MERGE PRACTICE
git branch
touch f1.py
ls
cat f1.py 
git add f1.py 
git commit -m "file-f1 added"
touch f2.py
git add f2.py 
git commit -m "file-f2 added"
cat f3.py 
touch f3.py
git add f3.py 
git commit -m "file-f3 added"
git log
git branch dev1
git branch
git checkout dev1
git branch
ls
touch d1.py
git add d1.py 
git commit -m "file-d1 commited in dev1 branch"
touch d2.py
git add d2.py 
git commit -m "file-d2 commited in dev1 branch"
git push -u origin dev1
git branch
git checkout main
git log
git push
# GIT REBASE PRACTICE
# WE ARE NOE ON BRANCH MAIN
git branch
touch rb1.py
git add rb1.py 
git commit -m "Rebase -1"
git log
git checkout dev1
git branch
ls
git log
git rebase
git log
git branch
git checkout main
git branch
git log
git checkout dev1
ls
git rebase
ls
git log
git rebase master
git rebase main
git log
git log --oneline
git log --oneline -n 7
git branch
git checkout main
git branch
touch rb2.py
git add rb2.py 
git commit -m "Rebase -2"
touch rb3.py
git add rb3.py 
git commit -m "Rebase -3"
git push
ls
git log -n 7
git checkout dev1
git branch
ls
git log --oneline -7
git rebase
git rebase main
git log --oneline -10
git checkout main
ls
git merge dev1
ls
git log
git log --oneline 
git checkout dev1
git rebase main
ls
git log --oneline -
git log --oneline -10
git checkout main
touch rb4.py
git add rb4.py 
git commit -m "Rebase -4"
git push
git log --oneline -12
git checkout dev1
git branch
ls
git rebase main
git log --oneline -12
history |-c 8-
history | grep -c 8-
history | cut -c 8-
git push
git pull
git pull -f
git branch
git push -u origin dev1
git status
git log
git checkout main
git branch
git log
git push
history | cut -c 8-
history
clear
history | cut -c 8-
clear
git branch
ls
rm -rf *
ls
git add .
ls
history | cut -c 8-
root@ip-172-31-23-213:/home/ubuntu/myrevision# 


GIT STASH

git branch
ls
git status
git checkout dev1
git status
ls
git rm -rf *
git add .
vi app.py
git add app.py 
git commit -m "git stash practice"
git checkout main
git checkout dev1
git branch
ls
vi app.py 
git checkout main
git stash
git checkout main
ls
vi myapp.py
git checkout dev1
git checkout main
ls
it status
git status
git branch
git checkout dev1
git branch
git stash pop
ls
git add .
git push
git log
ls
git branch
git status
history | cut -c 8-
root@ip-172-31-23-213:/home/ubuntu/myrevision# 
