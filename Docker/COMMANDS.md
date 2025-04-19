
To Check if docker is installed on your machine.
```
docker status

docker info
```
```
docker --version
```
 Command to build an image.

```
docker build -t <Image Name> .
```
Command lists all the Docker images that are locally available on your system.
```
docker images
```
or 
```
docker images ls
```
Command to create or run a container fron an image.
```
docker run -d --name <Image Nmae> -p <Host Port>:<Container Port> <Image Name>
```
To see if any container is running
```
docker ps
```
To see all running and exited containers
```
docker ps -a
```
