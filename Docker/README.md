
### When you run docker exec on a container, you will land in the default working directory of the container, which is the directory specified by the WORKDIR instruction in the Dockerfile.

In your case, since the Dockerfile has WORKDIR /app, when you run docker exec on the container, you will land in the /app directory.

Here's an example:
WORKDIR /app

If you run docker exec like this:
docker exec -it container_id /bin/bash

You will be logged into the container's /app directory:
root@container_id:/app#

You can verify the current working directory using the pwd command:
root@container_id:/app# pwd
/app

So, to answer your question, yes, you will land in the /app directory when you run docker exec on the container.


### When you create a Docker image using a Dockerfile, the files that are copied to the working directory (in this case, /app) during the build process will indeed be available inside the container under the same working directory /app.

Here's an example:
WORKDIR /app
COPY . /app

Or, more concisely:
WORKDIR /app
COPY . .

When you build the Docker image and create a container from it, the files that were copied to the /app directory during the build process will be available in the container's /app directory.

So, if you run docker exec on the container and navigate to the /app directory, you'll see the files that were copied during the build process:
docker exec -it container_id /bin/bash
root@container_id:/app# ls
file1.txt  file2.txt  ...

In this example, file1.txt and file2.txt are files that were copied to the /app directory during the build process.

To summarize:

- Files copied to the working directory (/app) during the build process will be available in the container's /app directory.
- When you run docker exec on the container, you'll land in the /app directory, and you'll see the files that were copied during the build process.

This is one of the key benefits of using Docker: you can package your application code and dependencies into a container, and then run it consistently across different environments.



### Port Number

Each computer in a network (or in the Internet) might offer multiple services (e.g. Web Server, Database Server using PostgreSQL, Database Server using Redis, and Secure Shell).

In order to connect to a specific Service, we need not just the IP Address of the Computer, but also the Port Number of the specific Service on that Computer.

The Port Number is a number between 0 and 65535 (with numbers between 0 and 1000 boundable only by Privileged Services).

The Port Number is part of the UDP and TCP Protocols and is transmitted in every packet/request/response in order to make sure the data reaches the specific Server Application and the specific Client Application.
