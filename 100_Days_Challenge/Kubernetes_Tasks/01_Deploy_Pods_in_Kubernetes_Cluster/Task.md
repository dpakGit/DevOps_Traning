### Task:
The Nautilus DevOps team is diving into Kubernetes for application management. One team member has a task to create a pod according to the details below:

Create a pod named pod-nginx using the nginx image with the latest tag. Ensure to specify the tag as nginx:latest.

Set the app label to nginx_app, and name the container as nginx-container.

Note: The kubectl utility on jump_host is configured to operate with the Kubernetes cluster.

-----------------------------------------------

### What I Did

thor@jumphost ~$ kubectl
kubectl controls the Kubernetes cluster manager.

 Find more information at: https://kubernetes.io/docs/reference/kubectl/

Basic Commands (Beginner):
  create          Create a resource from a file or from stdin
  expose          Take a replication controller, service, deployment or pod and expose it as a new Kubernetes service
  run             Run a particular image on the cluster
  set             Set specific features on objects

Basic Commands (Intermediate):
  explain         Get documentation for a resource
  get             Display one or many resources
  edit            Edit a resource on the server
  delete          Delete resources by file names, stdin, resources and names, or by resources and label selector

Deploy Commands:
  rollout         Manage the rollout of a resource
  scale           Set a new size for a deployment, replica set, or replication controller
  autoscale       Auto-scale a deployment, replica set, stateful set, or replication controller

Cluster Management Commands:
  certificate     Modify certificate resources
  cluster-info    Display cluster information
  top             Display resource (CPU/memory) usage
  cordon          Mark node as unschedulable
  uncordon        Mark node as schedulable
  drain           Drain node in preparation for maintenance
  taint           Update the taints on one or more nodes

Troubleshooting and Debugging Commands:
  describe        Show details of a specific resource or group of resources
  logs            Print the logs for a container in a pod
  attach          Attach to a running container
  exec            Execute a command in a container
  port-forward    Forward one or more local ports to a pod
  proxy           Run a proxy to the Kubernetes API server
  cp              Copy files and directories to and from containers
  auth            Inspect authorization
  debug           Create debugging sessions for troubleshooting workloads and nodes
  events          List events

Advanced Commands:
  diff            Diff the live version against a would-be applied version
  apply           Apply a configuration to a resource by file name or stdin
  patch           Update fields of a resource
  replace         Replace a resource by file name or stdin
  wait            Experimental: Wait for a specific condition on one or many resources
  kustomize       Build a kustomization target from a directory or URL

Settings Commands:
  label           Update the labels on a resource
  annotate        Update the annotations on a resource
  completion      Output shell completion code for the specified shell (bash, zsh, fish, or powershell)

Subcommands provided by plugins:

Other Commands:
  api-resources   Print the supported API resources on the server
  api-versions    Print the supported API versions on the server, in the form of "group/version"
  config          Modify kubeconfig files
  plugin          Provides utilities for interacting with plugins
  version         Print the client and server version information

Usage:
  kubectl [flags] [options]

Use "kubectl <command> --help" for more information about a given command.
Use "kubectl options" for a list of global command-line options (applies to all commands).
thor@jumphost ~$ vi pod.yaml
thor@jumphost ~$ kubectl apply -f pod.yaml 
pod/pod-nginx created
thor@jumphost ~$ kubectl get pod
NAME        READY   STATUS              RESTARTS   AGE
pod-nginx   0/1     ContainerCreating   0          9s
thor@jumphost ~$ kubectl get pod
NAME        READY   STATUS    RESTARTS   AGE
pod-nginx   1/1     Running   0          14s
thor@jumphost ~$ cat pod.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx
  labels:
    app: nginx_app
spec:
  containers:
  - name: pod-nginx
    image: nginx:latest
    ports:
    - containerPort: 80


thor@jumphost ~$ kubectl delete pod pod-nginx
pod "pod-nginx" deleted
thor@jumphost ~$ kubectl get pod
No resources found in default namespace.
thor@jumphost ~$ vi pod.yaml
thor@jumphost ~$ kubectl apply -f pod.yaml 
pod/pod-nginx created
thor@jumphost ~$ kubectl get pod
NAME        READY   STATUS    RESTARTS   AGE
pod-nginx   1/1     Running   0          6s
thor@jumphost ~$ history |cut -c 8-
kubectl
vi pod.yaml
kubectl apply -f pod.yaml 
kubectl get pod
cat pod.yaml 
kubectl delete pod pod-nginx
kubectl get pod
vi pod.yaml
kubectl apply -f pod.yaml 
kubectl get pod
history |cut -c 8-
thor@jumphost ~$ cat pod.yaml 
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


thor@jumphost ~$ 
