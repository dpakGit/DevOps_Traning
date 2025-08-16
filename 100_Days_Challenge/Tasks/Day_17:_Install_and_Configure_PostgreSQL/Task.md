### Task

https://tundedamian.medium.com/day-17-of-100-days-of-devops-postgresql-database-user-permissions-setup-cf76e4ff874a

###  What i did

thor@jumphost ~$ peter@172.16.239.10
bash: peter@172.16.239.10: command not found
thor@jumphost ~$ ssh peter@172.16.239.10
The authenticity of host '172.16.239.10 (172.16.239.10)' can't be established.
ED25519 key fingerprint is SHA256:7EnIRgsnV2VpFJqy0D6fHPbYuG0CWiKyKduQFMa4uEc.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.16.239.10' (ED25519) to the list of known hosts.
peter@172.16.239.10's password: 
[peter@stdb01 ~]$ sudo su - postgres

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for peter: 
[postgres@stdb01 ~]$ psql
psql (13.14)
Type "help" for help.

postgres=# CREATE USER kodekloud_top WITH PASSWORD 'Rc5C9EyvbU';
CREATE ROLE
postgres=# CREATE DATABASE kodekloud_db7;
CREATE DATABASE
postgres=# GRANT ALL PRIVILEGES ON DATABASE kodekloud_db7 TO kodekloud_top;
GRANT
postgres=# exit
[postgres@stdb01 ~]$ 
