



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
sudo -s # FIRST BECOME A ROOT USER 
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
12.	docker build -t image:1.0 .
13.	docker images
14.	/# Create and Run the docker container
15.	docker run -d --name Container-1 -p 8000:8080 image:1.0
16.	docker ps # to see if any container is running
17.	docker ps -a # to see all running and exited containers
18.	curl localhost:8000


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

ps -ef        : # ps -ef is a command that displays a list of running processes in the container

Or
ps -eaf

exit # to come out of the container


