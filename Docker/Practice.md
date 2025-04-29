
### Application code : app.py
```
from flask import Flask
import os
app = Flask(__name__)
@app.route('/')

def hello():
    return ('\nHello from Container World! \n\n')

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)
```

### Dockerfile
```
FROM ubuntu:20.04
RUN apt update && apt install python3 -y && apt install python3-pip -y && pip3 install flask
COPY app.py /opt
EXPOSE 8080
CMD ["python3", "/opt/app.py"]

```

```
# FIRST BECOME A ROOT USER 
sudo -s 
apt update
apt install docker.io -y
```

docker status

docker info

docker ps

ls

  
1.	docker info
2.	docker
3.	ls
4.	mkdir docker
5.	ls
6.	cd docker/
7.	ls
8.	vi app.py
9.	vi Dockerfile
10.	docker images
11.	/# First build the Docker image from the Dockerfile
```
docker build -t image:1.0 .
```
    
14.	docker images
15.	/# Create and Run the docker container
```
docker run -d --name Container-1 -p 8000:8080 image:1.0
```
18.	docker ps # to see if any container is running
19.	docker ps -a # to see all running and exited containers
20.	curl localhost:8000


Practice date: 17.4.2025


docker logs Container-1

### How to login inside a Container

docker exec -it Container-1 bash 

**Commands inside a docker container**

pwd

ls -al

cd /opt/

ls

cat app.py 

/ # ps -ef is a command that displays a list of running processes in the container

ps -ef       
Or
ps -eaf

/# to come out of the container
exit 

**Date: 18.4.2025**

### COPY A FILE FROM HOST TO THE CONTAINER


Different Methods to check the availability of a file copied from host machine to the opt directory of a Container

**First Method:**

docker exec -it Con1 bash
pwd
ls
cd /opt
ls

**Second Method**

docker exec Con1 ls  :# Dislays all the 
docker exec Con1 ls /opt/

**Third Method**
docker exec Con1 test -f /opt/TEST.PY

**Fourth Method**
docker exec Con1 test -f /opt/TEST.PY  && echo "File exists" || echo "File does not exist"

****to check multiple files****
Alternatively, you can use a loop to check for multiple files:

bash
for file in TEST.PY app.py; do
  docker exec Con1 test -f /opt/$file && echo "$file exists" || echo "$file does not exist"
done

**Fifth Method : USE FIND COMMAND**

docker exec Con1 find /opt  -name TEST.PY

docker exec Con1 find /opt  -name app.py 

****To find multiple files using the find command with docker exec, you can use the -o operator, which stands for "or":****

docker exec Con1 find /opt -name TEST.PY -o -name app.py


- If you have more files to search for, you can continue adding -o -name filename clauses:

bash
docker exec Con1 find /opt -name app1.py -o -name app2.py -o -name app3.py


**Copy a file from a container to the host directory**

docker cp Con1:/opt/Dockerfile .



**Docker Registry:** https://notes.kodekloud.com/docs/Docker-Training-Course-for-the-Absolute-Beginner/Docker-Registry/Docker-Registry

### Why tag a docker image before pushing it to docker hub ?

https://kodekloud.com/community/t/tagging-a-docker-image-before-pushing-it-to-docker-hub/476969

**Date:25.4.2025**



### Creating a Private docker Registry and pushing an image inside it

docker pull ubuntu:latest # pulled an image from docker hub
docker images

### Creating a Private Registry

docker run -d --name pvt_Registry -p 5000:5000 registry:2
docker ps
docker images

### tag the image ubuntu:latest before pushing it to the private registry

docker tag ubuntu:latest localhost:5000/ubuntu:latest
docker images

### Push the tagged image to the private registry

docker push localhost:5000/ubuntu:latest
docker images
docker exec -it pvt_Registry bash #  bash shell does not worked so sh is used
docker exec -it pvt_Registry sh

### Commands to run inside the Private Registry container

var/lib/registry/

 docker/

 registry/

 v2/

 repositories/

 ubuntu/

### We can also use the following Command to achieve the above purpose:

```
curl localhost:5000/v2/_catalog
```

Source: Meta AI

The command curl localhost:5000/v2/_catalog is used to:

Query a Docker Registry
- localhost:5000: The URL of a local Docker registry.
- /v2/_catalog: The API endpoint to retrieve a list of repositories in the registry.

Purpose
This command allows you to:

1. List all repositories (image collections) in the registry.
2. Verify the registry's contents.
3. Check if specific images or repositories are available.

Response
The registry will respond with a JSON object containing a list of repository names.

Example Response

{
  "repositories": [
    "ubuntu",
    "myapp",
    "another-image"
  ]
}


This shows that the registry contains images or repositories named ubuntu, myapp, and another-image.

### How to push a docker image to a private repository ? - Stackoverflow

https://stackoverflow.com/questions/28349392/how-to-push-a-docker-image-to-a-private-repository

If you docker registry is private and self hosted you should do the following :

```
docker login <REGISTRY_HOST>:<REGISTRY_PORT>
docker tag <IMAGE_ID> <REGISTRY_HOST>:<REGISTRY_PORT>/<APPNAME>:<APPVERSION>
docker push <REGISTRY_HOST>:<REGISTRY_PORT>/<APPNAME>:<APPVERSION>
```
**Practice date: 28.4.2025**

- Practice: 1
```
  vi app.py
  vi Dockerfile
  docker build -t image:1 .
docker run -d --name C-1 -p 8000:8080 image:1
docker ps
docker exec -it first bash
docker exec -it C-1 bash

- Commands inside the container

cd /opt/
ls
echo "This is a test file" > abc.txt
ls
exit

docker stop C-1
docker ps -a
docker rm C-1
docker ps -a
docker run -d --name C-1 -p 8000:8080 image:1
docker ps -a
docker exec -it C-1 bash
cd /opt/
ls
```
- Recreate the same Container
```
vi app.py
vi Dockerfile
docker build -t image:1 .
docker run -d --name C-1 -p 8000:8080 image:1
docker ps
docker exec -it first bash
docker exec -it C-1 bash

- Commands inside the container

cd /opt/
ls
```

**Practice-2** 

## "Create a file or directory in the host machine's /opt directory and verify its visibility in the container's /etc/lala directory."

Or, in a more detailed format:

"Test bind mount functionality by:

1. Creating a file or directory in the host machine's /opt directory.
2. Verifying that the file or directory is visible and accessible in the container's /etc/lala directory.

This confirms that changes made on the host machine are reflected in the container."
Q: Is the line "verify its visibility" correct or shall we modify it for more clarity

Sol: The line "verify its visibility" is understandable, but you can modify it for more clarity:

- "Verify that it is visible"
- "Check if it appears"
- "Confirm that it is accessible"
- "Validate that it is synced"

Here's an example:

"Create a file or directory in the host machine's /opt directory and confirm that it is synced to the container's /etc/lala directory."

Alternatively, you can use more specific language:

- "Check if the file/directory is listed in /etc/lala"
- "Verify that the file/directory contents are identical in both locations"

Choose the wording that best fits your context and purpose.
``` 
docker run -d --name C-1 -v /opt:/etc/lala/ -p 8000:8080 image:1
docker ps -a
cd /opt
mkdir host_file.txt

# Or mkdir /opt/testing.txt Meaning make a file testing.txt inside the directory /opt
ls /opt/ # List the files inside the /opt directory
cd ..
docker exec -it C-1 bash
cd /opt/
ls
cd ..
exit
docker exec -it C-1 ls /etc/lala # Imp command
docker exec -it C-1 rm-rf /etc/lala/host_file1.txt
docker ps
docker exec -it C-1 ls /etc/lala # the file host_file.txt is visible under the /etc/lala directory

# Delete the existing container.

docker stop C-1
docker rm C-1

# Recreate the container with the same volume mount (/opt:/etc/lala).

docker run -d --name C-1 -v /opt:/etc/lala/ -p 8000:8080 image:1

# Verify that the file host_file.txt is available in the container's /etc/lala directory.

docker exec -it C-1 bash
cd /etc/lala
ls

Your steps are well-structured and easy to follow. This format works well for
instructional or procedural content.
```

**Practice-3**

## "Create a file in the container's /etc/lala directory and verify its visibility in the host machine's /opt directory."

Or, in a more detailed and testable format:

"Test bind mount functionality by:
1. Creating a file in the container's /etc/lala directory.
2. Verifying that the file is visible in the host machine's /opt directory.

This confirms that changes made in the container are reflected on the host machine."

```
docker run -d --name C-1 -v /opt:/etc/lala/ -p 8000:8080 image:first
docker ps
ls /opt/
docker exec -it C-1 bash
# Creating a file in the container's /etc/lala directory.
ls
cd /etc/lala/
ls
echo "THIS IS VOLUME TEST" > con_file.txt
ls
# This file is supposed to be visible in the /opt directory of the host with the same content.
exit

# Verifying that the file is visible in the host machine's /opt directory.
cd /opt/
ls

# Delete the existing container.

docker stop C-1
docker rm C-1
docker  ps
docker ps -a

# Now verify that even after the container is deleted the file created inside the container
 is avialable inside the /opt directory
cd /opt/
ls

# Recreate the container with the same volume mount (/opt:/etc/lala).

docker run -d --name C-1 -v /opt:/etc/lala/ -p 8000:8080 image:first

# Verify that the file created inside the previous container is now available in the
new container's /etc/lala directory ?

docker exec -it C-1 bash
cd /etc/lala
ls
exit
But if we check the /opt directory in the host the file is present and is not repeated
cd /opt/
ls
```

### - Note: For data to persist beyond the container's lifecycle, it's essential to create or modify files within the container's /etc/lala directory, which is bind-mounted to the host machine's /opt directory. Any changes made to files within this mounted directory will be reflected on the host machine and will remain even after the container is restarted, updated, or deleted.

