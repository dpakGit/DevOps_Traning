


Last login: Mon Sep  1 04:17:51 UTC 2025 on pts/0
thor@jumphost ~$ ssh steve@stapp02
The authenticity of host 'stapp02 (172.16.238.11)' can't be established.
ED25519 key fingerprint is SHA256:lnSjYS7KnxyN42fCRucc5fmM2EftcDcQTkLLQDcYRcc.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp02' (ED25519) to the list of known hosts.
steve@stapp02's password: 
[steve@stapp02 ~]$ sudo -s

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for steve: 
[root@stapp02 steve]# ls /opt/docker/Dockerfile
ls: cannot access '/opt/docker/Dockerfile': No such file or directory
[root@stapp02 steve]# ls /opt/docker
[root@stapp02 steve]# ls
[root@stapp02 steve]# ls /opt/docker/
[root@stapp02 steve]# ls
[root@stapp02 steve]# cd /opt/docker/
[root@stapp02 docker]# ls
[root@stapp02 docker]# vi Dockerfile
[root@stapp02 docker]# docker build -t custom-apache-image .
[+] Building 38.0s (7/7) FINISHED                         docker:default
 => [internal] load build definition from Dockerfile                0.1s
 => => transferring dockerfile: 375B                                0.0s
 => [internal] load metadata for docker.io/library/ubuntu:24.04     0.0s
 => [internal] load .dockerignore                                   0.0s
 => => transferring context: 2B                                     0.0s
 => [1/3] FROM docker.io/library/ubuntu:24.04                       0.0s
 => [2/3] RUN apt update && apt install -y apache2                 26.6s
 => [3/3] RUN sed -i 's/Listen 80/Listen 3004/g' /etc/apache2/port  5.5s 
 => exporting to image                                              5.6s 
 => => exporting layers                                             5.4s 
 => => writing image sha256:1f6e1fadaebae2257e4f86f7d427a2b38c9bfa  0.2s 
 => => naming to docker.io/library/custom-apache-image              0.0s 
[root@stapp02 docker]# docker images                                     
REPOSITORY            TAG       IMAGE ID       CREATED          SIZE
custom-apache-image   latest    1f6e1fadaeba   59 seconds ago   246MB
ubuntu                24.04     602eb6fb314b   4 months ago     78.1MB
[root@stapp02 docker]# docker run -d -p 3004:3004 custom-apache-image

6a7a403364c32a69dda59a59778c3ca2bade585a33cfc46a264bd6c244ee13d3
[root@stapp02 docker]# docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS         PORTS                    NAMES
6a7a403364c3   custom-apache-image   "apache2ctl -D FOREG…"   18 seconds ago   Up 5 seconds   0.0.0.0:3004->3004/tcp   elated_goldwasser
[root@stapp02 docker]# history | cut -c 8-
ls /opt/docker/Dockerfile
ls /opt/docker
ls
ls /opt/docker/
ls
cd /opt/docker/
ls
vi Dockerfile
docker build -t custom-apache-image .
docker images
docker run -d -p 3004:3004 custom-apache-image
docker ps -a
history | cut -c 8-
[root@stapp02 docker]# 
