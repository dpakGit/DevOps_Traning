### Task

https://tundedamian.medium.com/day-17-of-100-days-of-devops-postgresql-database-user-permissions-setup-cf76e4ff874a

###  What i did

thor@jumphost ~$ peter@172.16.239.10

thor@jumphost ~$ ssh peter@172.16.239.10

[peter@stdb01 ~]$ sudo su - postgres

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
