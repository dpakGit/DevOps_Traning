### Task:
The Nautilus DevOps team is diving into Kubernetes for application management. One team member has a task to create a pod according to the details below:

Create a pod named pod-nginx using the nginx image with the latest tag. Ensure to specify the tag as nginx:latest.

Set the app label to nginx_app, and name the container as nginx-container.

Note: The kubectl utility on jump_host is configured to operate with the Kubernetes cluster.

-----------------------------------------------

### What I Did

```
thor@jumphost ~$ kubectl

thor@jumphost ~$ vi pod.yaml

---------------------------------
# pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx
  labels:
    app: nginx_app
spec:
  containers:
  - name: nginx-container
    image: nginx:latest
    ports:
    - containerPort: 80

----------------------------------

thor@jumphost ~$ kubectl apply -f pod.yaml 
pod/pod-nginx created

thor@jumphost ~$ kubectl get pod
NAME        READY   STATUS    RESTARTS   AGE
pod-nginx   1/1     Running   0          14s

```

