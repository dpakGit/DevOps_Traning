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
