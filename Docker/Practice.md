
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
**Practice Date: 26.4.2025** 
**Meta AI:**

[26-Apr-25 12:56 PM] Maverick: Explain me with a scenario where attaching a volume to docker container is useful
[26-Apr-25 12:56 PM] Meta AI: Here's a scenario:

Scenario: Web Application with User-Generated Content
You have a Docker container running a web application that allows users to upload images. The application is packaged in a Docker image, and you create a container from this image.

Problem without Volumes
Without attaching a volume, the uploaded images would be stored in the container's writable layer. When the container is:

- Deleted due to an update or failure
- Recreated for scaling or maintenance
- Removed and re-deployed

All the uploaded images would be lost.

Solution with Volumes
To persist the uploaded images, you attach a volume to the container, mapping a host directory (e.g., /opt/images) to the container's directory where images are stored (e.g., /app/images).

Benefits
With the volume attached:

- Uploaded images are stored on the host machine (/opt/images)
- Even if the container is deleted or recreated, the images remain on the host machine
- You can easily access and manage the images from the host machine

Example Command

bash
docker run -d -p 8080:8080 -v /opt/images:/app/images my-web-app


In this scenario, attaching a volume ensures that user-generated content (images) is persisted beyond the container's lifecycle, making it a crucial aspect of deploying applications that handle dynamic data.
[26-Apr-25 8:27 PM] Maverick: if we run the following command will it bind the volume to a container "docker volume create data_volume
"
[26-Apr-25 8:27 PM] Meta AI: The command docker volume create data_volume creates a named volume, but it doesn't bind it to a container.

What's Happening
When you run docker volume create data_volume:

- Docker creates a named volume called data_volume.
- The volume is stored on the host machine, typically in /var/lib/docker/volumes/data_volume/_data.

To bind the volume to a container, you need to specify the volume when running the container using -v or --mount.

Example

bash
docker run -d -v data_volume:/app/data myimage


or


bash
docker run -d --mount type=volume,src=data_volume,dst=/app/data myimage


In these examples, the data_volume is bound to the /app/data directory in the container.
[26-Apr-25 8:31 PM] Maverick: Is it possible to use the -v or --mount option while building an image , if that is possible each time a container is build from an image a volume will be automatically created
[26-Apr-25 8:31 PM] Meta AI: No, it's not possible to use the -v or --mount option while building a Docker image.

Dockerfile vs. Docker Run
- Dockerfile: Defines the build process for an image.
- docker run: Creates a container from an image.

Volume Configuration
Volumes are a runtime configuration, not a build-time configuration. You can specify volume configurations in:

- docker run command using -v or --mount.
- docker-compose.yml file.

VOLUME Instruction in Dockerfile
There is a VOLUME instruction in Dockerfile, but it works differently:

- VOLUME /data: Specifies that the /data directory should be a mount point for a volume.
- When a container is created from the image, Docker will create an anonymous volume for /data if no volume is mounted.

However, this doesn't allow you to specify a named volume or bind mount during the build process.

Conclusion
To automatically create a volume for each container created from an image, you can:

- Use the VOLUME instruction in the Dockerfile.
- Specify a volume configuration in a docker-compose.yml file.
- Use a script or automation tool to create and mount volumes when running containers.
[26-Apr-25 9:06 PM] Maverick: is it that the following command "docker run -d --name second  -v /opt:/etc/lala -p 8001:8080 " maps a volume in the host machine  to one in the container, and any updates or change in one will be reflected in the other
[26-Apr-25 9:06 PM] Meta AI: The command docker run -d --name second -v /opt:/etc/lala -p 8001:8080 maps a host directory /opt to a container directory /etc/lala. This is known as a bind mount.

What it Does
- Any changes made to files in /opt on the host machine will be reflected in /etc/lala in the container.
- Any changes made to files in /etc/lala in the container will be reflected in /opt on the host machine.

Real-time Sync
The bind mount provides a real-time synchronization between the host directory and the container directory. Changes are reflected immediately, without the need for manual synchronization.

Use Cases
Bind mounts are useful for:

- Development: Mount your code directory to the container for live updates.
- Testing: Share data between the host and container or between multiple containers.
- Data sharing: Share files between the host and container.

Note
Be cautious when using bind mounts, as changes made to the host directory can affect the container's behavior, and vice versa.
[26-Apr-25 9:09 PM] Maverick: so it maps a directory in host to one in a container. So if we create try to map a new directory in the host to a new directory in the container will it work. also suggest the best practice
[26-Apr-25 9:09 PM] Meta AI: You can map multiple host directories to multiple container directories using the -v or --mount option multiple times.

Example

bash
docker run -d \
  -v /opt:/etc/lala \
  -v /var/logs:/var/log/container_logs \
  myimage


or


bash
docker run -d \
  --mount type=bind,src=/opt,dst=/etc/lala \
  --mount type=bind,src=/var/logs,dst=/var/log/container_logs \
  myimage


Best Practices
1. Use meaningful directory names: Choose directory names that clearly indicate their purpose.
2. Use separate directories for separate purposes: Avoid mapping a single host directory to multiple container directories with different purposes.
3. Be mindful of permissions: Ensure the container has the necessary permissions to access the host directories.
4. Use named volumes for data persistence: For data that needs to be persisted across container restarts, consider using named volumes instead of bind mounts.

Named Volumes vs. Bind Mounts
- Named Volumes: Managed by Docker, suitable for data persistence.
- Bind Mounts: Directly map host directories to container directories, suitable for development, testing, and data sharing.

By following these best practices, you can effectively use Docker volumes and bind mounts to manage data and configuration for your containers.



**Practice Date: 28.4.2025**
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

**Meta AI:**

Q: Is it that the following command "docker run -d --name second  -v /opt:/etc/lala -p 8001:8080 " is creating a file or volume in both host and the container itself also which are sync
[28-Apr-25 1:00 PM] Meta AI: The command docker run -d --name second -v /opt:/etc/lala -p 8001:8080 creates a bind mount, which maps an existing directory on the host machine (/opt) to a directory in the container (/etc/lala).

What Happens
- No new volume or file is created on the host machine; the existing /opt directory is used.
- The /etc/lala directory in the container is not a separate copy, but rather a mount point that points to the /opt directory on the host machine.

Sync Behavior
- Any files or changes made to /opt on the host machine will be reflected in /etc/lala in the container.
- Any files or changes made to /etc/lala in the container will be reflected in /opt on the host machine.

No Duplication
There is no duplication of files or data. Both the host machine's /opt directory and the container's /etc/lala directory point to the same underlying storage.
[28-Apr-25 1:01 PM] Maverick: Any files or changes made to /opt on the host machine will be reflected in /etc/lala in the container.
- Any files or changes made to /etc/lala in the container will be reflected in /opt on the host machine.
but how this happens
[28-Apr-25 1:01 PM] Meta AI: The synchronization between the host directory (/opt) and the container directory (/etc/lala) happens because of how Docker implements bind mounts.

How Bind Mounts Work
When you create a bind mount, Docker doesn't copy the files from the host directory to the container directory. Instead:

1. Mounting: Docker mounts the host directory (/opt) to the container directory (/etc/lala).
2. Shared Filesystem: Both the host and container access the same underlying filesystem for the mounted directory.
3. Real-time Sync: Any changes made to the files in the mounted directory are reflected in real-time, because both the host and container are accessing the same storage.

Underlying Mechanism
The bind mount uses the host's operating system features, such as:

- Mount: The host's filesystem is mounted to a specific directory in the container's namespace.
- Namespace: The container's namespace is configured to access the host's filesystem for the mounted directory.

This allows Docker to provide a seamless and efficient way to share files between the host and container.
[28-Apr-25 1:05 PM] Maverick: so both the host and container point to the same file system or storage that is in a different palce and both access the data in the same filesystem
[28-Apr-25 1:05 PM] Meta AI: When you create a bind mount, both the host and container point to the same underlying storage or filesystem, which is located on the host machine.

Shared Underlying Storage
- The host directory (/opt) and the container directory (/etc/lala) are not separate copies of the data.
- Both directories are essentially aliases or pointers to the same underlying storage.

How it Works
When you make changes to files in /opt on the host machine:

1. The changes are written to the underlying storage.
2. Because the container's /etc/lala directory is mounted to the same underlying storage, the changes are immediately visible in the container.

Similarly, when you make changes to files in /etc/lala in the container:

1. The changes are written to the underlying storage.
2. The changes are immediately visible on the host machine in the /opt directory.

This shared access to the same underlying storage enables the real-time synchronization between the host and container directories.
[28-Apr-25 1:16 PM] Maverick: improve the command to see the files inside the /opt/lala
[28-Apr-25 1:16 PM] Meta AI: To see the files inside the /opt directory on the host machine, which is mapped to /etc/lala in the container, you can use the following command:


bash
docker run -d --name second -v /opt:/etc/lala -p 8001:8080 myimage
docker exec -it second ls /etc/lala


However, if you want to map /opt/lala on the host to /etc/lala in the container, the command would be:


bash
docker run -d --name second -v /opt/lala:/etc/lala -p 8001:8080 myimage
docker exec -it second ls /etc/lala


This will list the files inside the /etc/lala directory in the container, which are the same files as in the /opt/lala directory on the host machine.
[28-Apr-25 1:16 PM] Maverick: docker exec  C-1 ls /opt/lala
[28-Apr-25 1:16 PM] Meta AI: If you run the command docker exec C-1 ls /opt/lala, it will list the files and directories in the /opt/lala directory inside the container C-1.

Note
However, based on your previous command docker run -d --name second -v /opt:/etc/lala -p 8001:8080, it seems that /opt is a directory on the host machine, and it's mounted to /etc/lala in the container.

So, if you want to list the files in the mounted directory inside the container, you should use docker exec second ls /etc/lala.
[28-Apr-25 1:18 PM] Maverick: docker exec -it C-1 rm-rf /etc/lala/host_file1.txt
[28-Apr-25 1:18 PM] Meta AI: The command docker exec -it C-1 rm -rf /etc/lala/host_file1.txt will delete the file host_file1.txt from the /etc/lala directory inside the container C-1.

Impact on Host Machine
Since /etc/lala in the container is a bind mount of /opt on the host machine (based on your previous command docker run -d --name second -v /opt:/etc/lala -p 8001:8080), deleting the file in the container will also delete the file on the host machine.

The file /opt/host_file1.txt on the host machine will be deleted.

Caution
Be careful when using rm -rf as it permanently deletes files without prompting for confirmation.




**Date: 29.4.2025** 
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


The line "verify its visibility" is understandable, but you can modify it for more clarity:

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



Q: Explain the following part of the command "/opt:/etc/lala/"

Sol: 
The part /opt:/etc/lala in the Docker command is a bind mount specification.

Breakdown
- /opt: This is the source directory on the host machine. It's the directory that you want to share with the container.
- :: This is the separator between the source directory and the target directory.
- /etc/lala: This is the target directory or mount point inside the container. It's where the host directory (/opt) will be mounted.

What it Does
When you run the container with this bind mount, Docker will:

1. Mount the host machine's /opt directory to the container's /etc/lala directory.
2. Allow both the host and container to access and modify the same underlying storage.

This enables seamless sharing of files between the host machine and the container.

Q: What is the use of ":" sign here expalin ?

Sol: 

In the Docker bind mount specification /opt:/etc/lala, the : (colon) serves as a separator between two parts:

1. Source directory (before the colon): /opt (on the host machine)
2. Target directory (after the colon): /etc/lala (inside the container)

The : sign tells Docker to:

- Take the directory on the left (/opt) and mount it to the directory on the right (/etc/lala) inside the container.

In essence, the : sign is used to specify the mapping between the host directory and the container directory.


Q: So we can say whenever we map something we can use the : sign

Sol:
In Docker bind mount specifications, the : sign is used to separate the source and target directories.

General Format  -  **source : target**

Usage
- source (before the colon): The directory on the host machine that you want to share.
- target (after the colon): The mount point or directory inside the container.

Example
/opt:/etc/lala

- /opt is the source directory on the host machine.
- /etc/lala is the target directory inside the container.

The : sign is a standard convention in Docker for specifying bind mounts.


Q: Can we write the following "source:target" as source_path:target_path ?

 Sol: You can think of it as:     **source_path : target_path**

This notation makes it clear that:

- source_path refers to the path on the host machine.
- target_path refers to the path inside the container.

Both notations (source:target and source_path:target_path) convey the same meaning in the context of Docker bind mounts.
