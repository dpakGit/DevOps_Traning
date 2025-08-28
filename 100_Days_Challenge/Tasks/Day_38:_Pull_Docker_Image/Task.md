### Task:

Nautilus project developers are planning to start testing on a new project. As per their meeting with the DevOps team, they want to test containerized environment application features. As per details shared with DevOps team, we need to accomplish the following task:

a. Pull busybox:musl image on App Server 2 in Stratos DC and re-tag (create new tag) this image as busybox:media.



### What I Did

thor@jumphost ~$ ssh tony@stapp02
The authenticity of host 'stapp02 (172.16.238.11)' can't be established.
ED25519 key fingerprint is SHA256:V/Ut996aRRS5pcpUEsZ8/ev6JEMwU3TtcdhcBKDGJBw.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp02' (ED25519) to the list of known hosts.
tony@stapp02's password: 

thor@jumphost ~$ ssh steve@stapp02
steve@stapp02's password: 
[steve@stapp02 ~]$ sudo -s

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for steve: 
[root@stapp02 steve]# docker pull busybox:musl
musl: Pulling from library/busybox
8e7bef4a92af: Pull complete 
Digest: sha256:254e6134b1bf813b34e920bc4235864a54079057d51ae6db9a4f2328f261c2ad
Status: Downloaded newer image for busybox:musl
docker.io/library/busybox:musl
[root@stapp02 steve]# docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
busybox      musl      44f1048931f5   11 months ago   1.46MB
[root@stapp02 steve]# docker tag busybox:musl busybox:media
[root@stapp02 steve]# docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
busybox      media     44f1048931f5   11 months ago   1.46MB
busybox      musl      44f1048931f5   11 months ago   1.46MB
[root@stapp02 steve]# docker images busybox:media
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
busybox      media     44f1048931f5   11 months ago   1.46MB
[root@stapp02 steve]# docker images busybox:media -a
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
busybox      media     44f1048931f5   11 months ago   1.46MB
[root@stapp02 steve]# docker images -q busybox:musl
44f1048931f5
[root@stapp02 steve]# docker images -q
44f1048931f5
44f1048931f5
[root@stapp02 steve]# history | cut -c 8-
docker pull busybox:musl
docker images
docker tag busybox:musl busybox:media
docker images
docker images busybox:media
docker images busybox:media -a
docker images -q busybox:musl
docker images -q
history | cut -c 8-
[root@stapp02 steve]# 
