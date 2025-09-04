### What I Did
```
thor@jumphost ~$ ssh banner@stapp03
The authenticity of host 'stapp03 (172.16.238.12)' can't be established.
ED25519 key fingerprint is SHA256:HnHXCTZGB31L2OcEyIIZFUD36b5dSsSz3MoBQXc3wwE.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp03' (ED25519) to the list of known hosts.
banner@stapp03's password: 
[banner@stapp03 ~]$ sudo -s

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for banner: 
[root@stapp03 banner]# cd /opt/docker/
[root@stapp03 docker]# ls
Dockerfile  certs  html
[root@stapp03 docker]# vi Dockerfile 
[root@stapp03 docker]# docker build -t myimage .
[+] Building 0.2s (1/1) FINISHED                          docker:default
 => [internal] load build definition from Dockerfile                0.0s
 => => transferring dockerfile: 557B                                0.0s
Dockerfile:1
--------------------
   1 | >>> IMAGE httpd:2.4.43
   2 |     
   3 |     ADD sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf
--------------------
ERROR: failed to build: failed to solve: dockerfile parse error on line 1: unknown instruction: IMAGE
[root@stapp03 docker]# vi Dockerfile 
[root@stapp03 docker]# cat Dockerfile 
 httpd:2.4.43

ADD sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf

ADD sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf

ADD sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' conf/httpd.conf

ADD sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' conf/httpd.conf

COPY certs/server.crt /usr/local/apache2/conf/server.crt

COPY certs/server.key /usr/local/apache2/conf/server.key

COPY html/index.html /usr/local/apache2/htdocs/
[root@stapp03 docker]# vi Dockerfile 
[root@stapp03 docker]# docker build -t myimage .
[+] Building 121.1s (2/2) FINISHED                        docker:default
 => [internal] load build definition from Dockerfile                0.0s
 => => transferring dockerfile: 557B                                0.0s
 => [internal] load metadata for docker.io/library/httpd:2.4.43   121.0s
Dockerfile:3
--------------------
   1 |     FROM httpd:2.4.43
   2 |     
   3 | >>> ADD sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf
   4 |     
   5 |     ADD sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf
--------------------
ERROR: failed to build: failed to solve: failed to process "\"s/Listen": unexpected end of statement while looking for matching double-quote
[root@stapp03 docker]# cat Dockerfile 
FROM httpd:2.4.43

ADD sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf

ADD sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf

ADD sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' conf/httpd.conf

ADD sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' conf/httpd.conf

COPY certs/server.crt /usr/local/apache2/conf/server.crt

COPY certs/server.key /usr/local/apache2/conf/server.key

COPY html/index.html /usr/local/apache2/htdocs/
[root@stapp03 docker]# vi Dockerfile 
[root@stapp03 docker]# vi Dockerfile 
[root@stapp03 docker]# docker build -t myimage .
[+] Building 107.0s (13/13) FINISHED                      docker:default
 => [internal] load build definition from Dockerfile                0.0s
 => => transferring dockerfile: 616B                                0.0s
 => [internal] load metadata for docker.io/library/httpd:2.4.43    31.0s
 => [internal] load .dockerignore                                   0.0s
 => => transferring context: 2B                                     0.0s
 => [1/8] FROM docker.io/library/httpd:2.4.43@sha256:cd88fee4eab3  64.0s
 => => resolve docker.io/library/httpd:2.4.43@sha256:cd88fee4eab37  0.0s
 => => sha256:53729354a74c9c146aa8726a8906e8337550 1.37kB / 1.37kB  0.0s
 => => sha256:f1455599cc2e008a4555f14451e590f07137 7.35kB / 7.35kB  0.0s
 => => sha256:bf59529304463f62efa7179fa1a32718a 27.09MB / 27.09MB  30.8s
 => => sha256:3d3fecf6569b94e406086a2b68a7c8930254490 146B / 146B  30.9s
 => => sha256:b5fc3125d9129e4cdd43f496195cc8f39 10.37MB / 10.37MB  30.4s
 => => sha256:cd88fee4eab37f0d8cd04b06ef97285ca981 1.86kB / 1.86kB  0.0s
 => => sha256:3c61041685c0f65e0b375bae6ae6bdeab 24.47MB / 24.47MB  61.0s
 => => extracting sha256:bf59529304463f62efa7179fa1a32718a611528cc  2.4s
 => => sha256:34b7e9053f76ca3c9dc574c5034679769256a59 298B / 298B  61.0s
 => => extracting sha256:3d3fecf6569b94e406086a2b68a7c8930254490b4  0.4s
 => => extracting sha256:b5fc3125d9129e4cdd43f496195cc8f39d43e9bad  1.1s
 => => extracting sha256:3c61041685c0f65e0b375bae6ae6bdeab9b6c2096  1.5s
 => => extracting sha256:34b7e9053f76ca3c9dc574c5034679769256a5960  0.8s
 => [internal] load build context                                   0.0s
 => => transferring context: 3.19kB                                 0.0s
 => [2/8] RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache  1.6s
 => [3/8] RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/  1.6s
 => [4/8] RUN sed -i '/LoadModule\ socache_shmcb_module modules\/m  1.6s
 => [5/8] RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//  1.5s
 => [6/8] COPY certs/server.crt /usr/local/apache2/conf/server.crt  1.0s
 => [7/8] COPY certs/server.key /usr/local/apache2/conf/server.key  1.1s
 => [8/8] COPY html/index.html /usr/local/apache2/htdocs/           1.2s
 => exporting to image                                              2.4s
 => => exporting layers                                             2.4s
 => => writing image sha256:79fbfb1bf74b7943e384257b85966e6d7d8826  0.0s
 => => naming to docker.io/library/myimage                          0.0s
[root@stapp03 docker]# docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
myimage      latest    79fbfb1bf74b   17 seconds ago   166MB
[root@stapp03 docker]# docker run -d --name mycontainer -p 8080:8080 myimage:latest
6a51270d68a96e0db3bd1261fa36ae87b55455513bbc51788f298e955a59f077
[root@stapp03 docker]# docker ps -a
CONTAINER ID   IMAGE            COMMAND              CREATED         STATUS         PORTS                            NAMES
6a51270d68a9   myimage:latest   "httpd-foreground"   7 seconds ago   Up 4 seconds   80/tcp, 0.0.0.0:8080->8080/tcp   mycontainer
[root@stapp03 docker]# curl localhost:8080
This Dockerfile works![root@stapp03 docker]# 
```




## Note Read the Dockerfile very carefully

### Faulty Dockerfile

```
FROM httpd:2.4.43

RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf

RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf

RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' conf/httpd.conf

RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' conf/httpd.conf

RUN cp certs/server.crt /usr/local/apache2/conf/server.crt

RUN cp certs/server.key /usr/local/apache2/conf/server.key

RUN cp html/index.html /usr/local/apache2/htdocs/
```

###  Modified Dockerfile
```
FROM httpd:2.4.43

RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf

RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' /usr/local/apache2/conf/httpd.conf


RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' /usr/local/apache2/conf/httpd.conf


RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' /usr/local/apache2/conf/httpd.conf

COPY certs/server.crt /usr/local/apache2/conf/server.crt

COPY certs/server.key /usr/local/apache2/conf/server.key

COPY html/index.html /usr/local/apache2/htdocs/
```


### Second Attempt
### Faulty Dockerfile
```
 IMAGE httpd:2.4.43

ADD sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf

ADD sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf

ADD sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' conf/httpd.conf

ADD sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' conf/httpd.conf

COPY certs/server.crt /usr/local/apache2/conf/server.crt

COPY certs/server.key /usr/local/apache2/conf/server.key

COPY html/index.html /usr/local/apache2/htdocs/
```

docker build -t myimage .
[+] Building 121.1s (2/2) FINISHED                        docker:default
 => [internal] load build definition from Dockerfile                0.0s
 => => transferring dockerfile: 557B                                0.0s
 => [internal] load metadata for docker.io/library/httpd:2.4.43   121.0s
Dockerfile:3
--------------------
   1 |     FROM httpd:2.4.43
   2 |     
   3 | >>> ADD sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf
   4 |     
   5 |     ADD sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf
--------------------
ERROR: failed to build: failed to solve: failed to process "\"s/Listen": unexpected end of statement while looking for matching double-quote


- The issue here is that you're using the ADD instruction incorrectly. ADD is used to copy files from the local directory into the Docker image, whereas you're trying to use it to run sed commands.

- To run commands during the Docker build process, you should use the RUN instruction.

- Also updated the path in the sed commands to /usr/local/apache2/conf/httpd.conf.

```

```
