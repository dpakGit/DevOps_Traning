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

#### Labels in Kubernetes
- *labels in Kubernetes*: Key-value pairs attached to objects like Pods, helping to organize, filter, or select resources.
- Example from your YAML:

labels:
  role: myrole

- *Here, role: myrole* labels the Pod with a role of myrole.
- Uses of labels:
- Organization: Categorize resources.
- Selection: Use label selectors to target specific resources.

Do you need help with:
- Using labels and selectors in Kubernetes resources?
- *Understanding other parts of the Pod YAML (like apiVersion, kind)*?
- Something else related to Kubernetes or YAML?

#### *Difference Between metadata and spec in Kubernetes*
- *metadata*:
- Contains identifying information about the object (like name, namespace, labels, annotations).
- Helps in organizing, selecting, or finding the resource.
- *spec*:
- Defines the desired state of the object.
- Specifies configuration details for Kubernetes to achieve that state.

Example in a Pod
- *metadata* might have name, labels.
- *spec* defines containers, volumes, etc.

Do you need help with:
- Understanding other parts of a Kubernetes YAML?
- Working with Pods, Deployments, or other Kubernetes resources?
- Something else related to Kubernetes?



#### Pod YAML with Many Attributes
Here's a Pod YAML with various attributes for general understanding. Note that not all attributes are required for every use case.


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


Key Sections
- *metadata*: Name, labels, annotations.
- *spec*: Containers, volumes, restart policy.

Do you need help with:
- Understanding specific parts of this YAML?
- Creating or editing Pod YAMLs for Kubernetes?
- Something else related to Kubernetes or YAML?

#### Pod Attributes Explained
Here's a breakdown of each attribute in the provided Pod YAML:

Metadata
- *name*: Name of the Pod.
- *namespace*: Namespace where the Pod runs.
- *labels*: Key-value pairs for organizing/selecting.
- *annotations*: Key-value pairs for extra info (not for selection).

Spec
- *volumes*: Volumes available to containers.
- *initContainers*: Containers run before main containers.
- *containers*: Main containers in the Pod.
- *name*: Container name.
- *image*: Container image.
- *ports*: Ports exposed (containerPort, name).
- *env*: Environment variables.
- *volumeMounts*: Mount paths for volumes.
- *resources*: CPU/memory requests/limits.
- *restartPolicy*: Policy for restarting containers.
- *nodeSelector*: Select nodes with specific labels.

Do you need help with:
- Understanding how to use specific attributes in a Pod?
- Troubleshooting or configuring Pods in Kubernetes?
- Something else related to Kubernetes or Pods?

#### YAML Structure Elements in Kubernetes
In a Kubernetes YAML file like the Pod definition:
- *apiVersion*, *kind*, *metadata*, *spec* are top-level fields.
- *metadata* and *spec* are sections or fields containing attributes.

Terminology
- These are often referred to as fields or sections in the YAML structure.
- In Kubernetes docs, they're called fields.

Do you need help with:
- Understanding YAML structure for other Kubernetes objects?
- Working with Kubernetes YAML files for deployment or config?
- Something else related to Kubernetes or YAML?

#### Terminology for YAML Elements in Kubernetes
In Kubernetes:
- *apiVersion*, *kind*, *metadata*, *spec* are called fields.
- Within *metadata* and *spec*, the key-value pairs are also referred to as attributes or fields.

Common Terminology
- Fields: Referring to top-level elements like metadata, spec.
- Attributes: Referring to key-value pairs within those fields.

Do you need help with:
- Understanding Kubernetes object structure or fields?
- Working with YAML for Kubernetes resources?
- Something else related to Kubernetes or YAML?

#### Key-Value Pairs Under Fields in YAML
- The key-value pairs under fields like *metadata* or *spec* are commonly called:
- attributes
- properties
- key-value pairs

In Kubernetes Context
- They're often referred to as fields or attributes in documentation.

Do you need help with:
- Understanding how to use specific attributes in Kubernetes YAML?
- Working with YAML for Kubernetes resources or configuration?
- Something else related to Kubernetes or YAML?

#### *Use Case of annotations*
- *annotations* in Kubernetes allow adding arbitrary non-identifying metadata to objects.
- Example: annotations: description: "An example pod"
- Adds a description to the Pod.
- Not used for selection like labels.
- Useful for documentation, notes, or extra info about the object.

Common Uses of Annotations
- Adding descriptions or notes.
- Storing extra metadata for humans or tools.
- Integration with external tools or systems.

Do you need help with:
- Using annotations for specific Kubernetes objects?
- Understanding labels vs annotations in Kubernetes?
- Something else related to Kubernetes or YAML?

#### Annotations in Kubernetes YAML
- *annotations* are part of the *metadata* field in a Kubernetes YAML.
- Example:

metadata:
  annotations:
    description: "An example pod"


Placement
- *annotations* are *nested under metadata*.
- Like labels, but used for non-identifying metadata.

Do you need help with:
- Using annotations or labels in Kubernetes objects?
- Understanding other parts of Kubernetes YAML structure?
- Something else related to Kubernetes or YAML?

#### *emptyDir in Kubernetes*
- *emptyDir* is a type of volume in Kubernetes.
- Behavior:
- Creates an empty directory on the node where the Pod runs.
- Lifespan: Exists as long as the Pod is running on that node.
- Use case: For temporary storage or sharing data between containers in a Pod.

Example

volumes:
  - name: example-volume
    emptyDir: {}


Do you need help with:
- *Using volumes or emptyDir in Kubernetes Pods*?
- Understanding other volume types in Kubernetes?
- Something else related to Kubernetes or storage?


### *Use of " - " in YAML* 
 - Important note

- In YAML, *-* is used to indicate a list item.
- Examples:
- - containerPort: 80 in ports is a list item.
- - name: example-volume in volumes is a list item.

Meaning
- This syntax denotes that ports, volumes, etc., are lists of items.
- Multiple items can be added using multiple - entries.

Do you need help with:
- Understanding YAML syntax for Kubernetes resources?
- Working with lists or other structures in YAML?
- Something else related to Kubernetes or YAML?

#### List Items in YAML
- A list item in YAML is an entry in a sequence or list of items.
- Indicated by a *-* (hyphen) followed by space.
- Example:

items:
  - apple
  - banana


In Kubernetes YAML
- Lists are used for things like containers, volumes, ports.
- Multiple items are added with multiple - entries.

Do you need help with:
- Understanding YAML syntax or structures?
- Working with lists in Kubernetes YAML files?
- Something else related to Kubernetes or YAML?

#### Multiple Containers and Ports in a Pod
- In a Pod spec, *containers* is a list of containers.
- Each container can have multiple *ports*.
- Example:

containers:
  - name: container1
    ports:
      - containerPort: 80
      - containerPort: 443
  - name: container2
    ports:
      - containerPort: 8080


Structure
- *containers*: List of containers in the Pod.
- *ports* (in each container): List of ports exposed.

Do you need help with:
- Defining multiple containers or ports in a Pod?
- Understanding Pod structure or container config in Kubernetes?
- Something else related to Kubernetes or Pods?

#### Q. Is it that we can have multiple volumeMounts so name under volume mount is a list ?

*volumeMounts in a Container*
- *volumeMounts* in a container's spec is a list of volumes to mount.
- Each item in the list has a *name* (referring to a volume) and a *mountPath*.
- Example:

volumeMounts:
  - name: example-volume
    mountPath: /data
  - name: another-volume
    mountPath: /logs


Structure
- *volumeMounts*: List of mounts for a container.
- *name*: References a volume defined in volumes.

Do you need help with:
- *Using volumeMounts or volumes in Kubernetes Pods*?
- Understanding volume config or mounting in containers?
- Something else related to Kubernetes or storage?

#### *Explanation of volumeMounts Code*

volumeMounts:
  - name: example-volume
    mountPath: /data
  - name: another-volume
    mountPath: /logs


- This code defines two volume mounts for a container in a Kubernetes Pod.
- Each volume mount:
- *name*: References a volume defined in the Pod's volumes section.
- *mountPath*: The path inside the container where the volume is mounted.

Breakdown
1. *example-volume* is mounted at /data inside the container.
2. *another-volume* is mounted at /logs inside the container.

Implications
- Containers can write/read data to /data and /logs.
- These paths correspond to the respective volumes (example-volume, another-volume) defined elsewhere in the Pod spec.

Do you need help with:
- *Defining volumes or volumeMounts in Kubernetes Pods*?
- Understanding how volumes work in Kubernetes containers?
- Something else related to Kubernetes or storage?

#### Pod YAML Example with Two Containers and Volume Mounts

apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  containers:
    - name: container1
      image: busybox
      command: ["sleep", "3600"]
      volumeMounts:
        - name: shared-data
          mountPath: /data
    - name: container2
      image: busybox
      command: ["sleep", "3600"]
      volumeMounts:
        - name: shared-data
          mountPath: /logs
  volumes:
    - name: shared-data
      emptyDir: {}


Explanation
- Two containers: container1 and container2.
- Both containers mount the *shared-data* volume.
- container1: Mounted at /data.
- container2: Mounted at /logs.
- *shared-data*: An emptyDir volume shared between the containers.

Do you need help with:
- *Using volumes or volumeMounts in Kubernetes Pods*?
- Understanding multi-container Pods in Kubernetes?
- Something else related to Kubernetes or Pods?

       - pod

      - kubernetes
