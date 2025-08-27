### Task:
The Nautilus DevOps team possesses confidential data on App Server 1 in the Stratos Datacenter. A container named ubuntu_latest is running on the same server.

Copy an encrypted file /tmp/nautilus.txt.gpg from the docker host to the ubuntu_latest container located at /tmp/. Ensure the file is not modified during this operation.


### What I Did
```
thor@jumphost ~$ ssh tony@stappo1

[tony@stapp01 ~]$ sudo -s

root@stapp01 tony]# docker ps -a

CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
7c0940bcaf97   ubuntu    "/bin/bash"   2 minutes ago   Up 2 minutes             ubuntu_latest

[root@stapp01 tony]# ls /tmp/

nautilus.txt.gpg
systemd-private-9e0b3f4f9f944fabb6055bb68fd4247f-dbus-broker.service-IK5g9s
systemd-private-9e0b3f4f9f944fabb6055bb68fd4247f-systemd-logind.service-OMoZp8


[root@stapp01 tony]# docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/tmp/

Successfully copied 2.05kB to ubuntu_latest:/tmp/

[root@stapp01 tony]# docker exec -it ubuntu_latest bash

root@7c0940bcaf97:/# ls /tmp/
nautilus.txt.gpg

root@7c0940bcaf97:/# exit

exit

# Alternative - Use docker exec with a command to check directly:                                       

[root@stapp01 tony]# docker exec ubuntu_latest ls /tmp/nautilus.txt.gpg
/tmp/nautilus.txt.gpg # This is the output of the above command

[root@stapp01 tony]#   docker exec ubuntu_latest basename /tmp/nautilus.txt.gpg
nautilus.txt.gpg # Output of the above command

[root@stapp01 tony]# docker exec ubuntu_latest ls /tmp/
nautilus.txt.gpg

# Above is the correect command

```
