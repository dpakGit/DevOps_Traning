### Task:

One of the Nautilus developer was working to test new changes on a container. He wants to keep a backup of his changes to the container. A new request has been raised for the DevOps team to create a new image from this container. Below are more details about it:

a. Create an image news:devops on Application Server 1 from a container ubuntu_latest that is running on same server.

-----------------------------------------
How to Create a Docker Image From a Container: https://www.dataset.com/blog/create-docker-image/

---------------------------------------------


### What I Did

thor@jumphost ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (172.16.238.10)' can't be established.
ED25519 key fingerprint is SHA256:Chp9Hb99P99wqpvwS5zrwN62F6aG7ArhQwpWLOf37P8.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ sudo -s

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for tony: 
[root@stapp01 tony]# docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    e0f16e6366fe   4 weeks ago   78.1MB
[root@stapp01 tony]# docker ps -a
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS    PORTS     NAMES
d96abd1153d9   ubuntu    "/bin/bash"   59 seconds ago   Created             ubuntu_latest
[root@stapp01 tony]# docker commit d96abd1153d9 news:nautilus
sha256:3823e5a7d100579bcc3e9e3c6dacb33aea121e2556410b222609388a8b8954e4
[root@stapp01 tony]# docker images
REPOSITORY   TAG        IMAGE ID       CREATED          SIZE
news         nautilus   3823e5a7d100   13 seconds ago   78.1MB
ubuntu       latest     e0f16e6366fe   4 weeks ago      78.1MB
[root@stapp01 tony]# docker ps -a
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS    PORTS     NAMES
d96abd1153d9   ubuntu    "/bin/bash"   3 minutes ago   Created             ubuntu_latest
[root@stapp01 tony]# history | cut -c 8-
docker images
docker ps -a
docker commit d96abd1153d9 news:nautilus
docker images
docker ps -a
history | cut -c 8-
[root@stapp01 tony]# 
