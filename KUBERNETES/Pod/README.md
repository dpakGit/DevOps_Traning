 To run two containers inside a single pod using Kubernetes imperative commands, you can use the `kubectl run` command with the `--container` and `--container-port` options.

Here is an example:
```
kubectl run my-pod --image=container1-image --container=container1 --container-port=8080 --image=container2-image --container=container2 --container-port=8081
```
This command creates a pod named `my-pod` that runs two containers:

- `container1` using the `container1-image` image and exposing port 8080
- `container2` using the `container2-image` image and exposing port 8081

You can also specify additional options, such as `--requests` and `--limits` to specify resource requests and limits for each container.

Here is an example:
```
kubectl run my-pod --image=container1-image --container=container1 --container-port=8080 --requests cpu=100m,memory=256Mi --limits cpu=200m,memory=512Mi --image=container2-image --container=container2 --container-port=8081 --requests cpu=50m,memory=128Mi --limits cpu=100m,memory=256Mi
```
This command creates a pod with two containers, each with its own resource requests and limits.

Note: The imperative commands are not recommended for production use, instead you should use declarative configuration files (yaml or json) to define your resources.


## Pod yaml files

```
# 1.  Simple pod yaml file

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
```


### 2. Pod YAML with Many Attributes

 - Here's a Pod YAML with various attributes for general understanding.
 
 -  Note that not all attributes are required for every use case.

```
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
  namespace: default
  labels:
    app: example
    environment: dev
  annotations:
    description: "An example pod"
spec:
  volumes:
    - name: example-volume
      emptyDir: {}
  initContainers:
    - name: init-container
      image: busybox
      command: ["sh", "-c", "echo 'init done'"]
  containers:
    - name: main-container
      image: nginx:latest
      ports:
        - containerPort: 80
          name: http
      env:
        - name: ENV_VAR
          value: "example-value"
      volumeMounts:
        - name: example-volume
          mountPath: /data
      resources:
        requests:
          cpu: 100m
          memory: 128Mi
        limits:
          cpu: 200m
          memory: 256Mi
  restartPolicy: Always
  nodeSelector:
    kubernetes.io/os: linux
```

Key Sections
- *metadata*: Name, labels, annotations.
- *spec*: Containers, volumes, restart policy.

Do you need help with:
- Understanding specific parts of this YAML?
- Creating or editing Pod YAMLs for Kubernetes?
- Something else related to Kubernetes or YAML?  
