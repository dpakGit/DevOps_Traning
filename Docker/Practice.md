
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
12.	docker build -t image:1.0 .
13.	docker images
14.	/# Create and Run the docker container
15.	docker run -d --name Container-1 -p 8000:8080 image:1.0
16.	docker ps # to see if any container is running
17.	docker ps -a # to see all running and exited containers
18.	curl localhost:8000
