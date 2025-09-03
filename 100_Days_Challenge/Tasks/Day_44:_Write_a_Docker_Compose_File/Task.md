### Task:


### What I Did

```
thor@jumphost ~$ ssh steve@stapp02

[steve@stapp02 ~]$ sudo -s

[root@stapp02 steve]# docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE

[root@stapp02 steve]# docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES


# Note : Output of the commands docker images and docker ps -a

[root@stapp02 steve]# docker compose

[root@stapp02 ~]# cd /opt/docker/

[root@stapp02 docker]# ls

[root@stapp02 docker]# pwd
/opt/docker

[root@stapp02 docker]# vi docker-compose.yml

----------------------------------
version: '3'
services:
  web:
    image: httpd:latest
    container_name: httpd
    ports:
      - "5000:80"
    volumes:
      - /opt/devops:/usr/local/apache2/htdocs

Let's break down the Docker Compose file:

- version: Specifies the version of the Docker Compose format.
- services: Defines the services (containers) to be created.
- web: The name of the service (you can use any name).
- image: Specifies the Docker image to use (in this case, httpd:latest).
- container_name: Specifies the name of the container (in this case, httpd).
- ports: Maps port 5000 on the host machine to port 80 in the container.
- volumes: Maps the /opt/devops directory on the host machine to the /usr/local/apache2/htdocs directory in the container.

------------------------------------

[root@stapp02 docker]# docker compose -f docker-compose.yml up -d

[root@stapp02 docker]# docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
httpd        latest    199e3a035264   3 weeks ago   117MB

[root@stapp02 docker]# docker ps -a
CONTAINER ID   IMAGE          COMMAND              CREATED         STATUS         PORTS                  NAMES
c28e0aca1328   httpd:latest   "httpd-foreground"   2 minutes ago   Up 2 minutes   0.0.0.0:5000->80/tcp   httpd

[root@stapp02 docker]# docker ps -f name=httpd # OR this command also works
CONTAINER ID   IMAGE          COMMAND              CREATED         STATUS         PORTS                  NAMES
c28e0aca1328   httpd:latest   "httpd-foreground"   3 minutes ago   Up 3 minutes   0.0.0.0:5000->80/tcp   httpd
```

### docker-compose.yml
```
version: '3'
services:
  web:
    image: httpd:latest
    container_name: httpd
    ports:
      - "5000:80"
    volumes:
      - /opt/devops:/usr/local/apache2/htdocs
```
