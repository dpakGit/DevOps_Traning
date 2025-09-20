https://www.youtube.com/watch?v=NQtX0vH8L1E&t=96s

https://www.youtube.com/watch?v=9NTr6EFmxkI



1. https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
2. https://medium.com/@manojkumar_41904/understanding-init-containers-and-sidecar-containers-in-kubernetes-ca94bec10a7b

- The init containers will run in the order they are defined in the YAML file.

- The init containers will run before the main container.

Here's the order of execution:

1. Init Containers: Run in the order they are defined in the YAML file.
    - init-myservice will run first.
    - Once init-myservice completes successfully, init-mydb will run.
2. Main Container: After all init containers have completed successfully, the main container myapp-container will start.

So, the overall order of execution is:

1. init-myservice
2. init-mydb
3. myapp-container

The init containers are designed to run and complete before the main container starts. This allows you to perform initialization tasks, such as setting up dependencies or waiting for services to become available, before the main application starts.

- In the YAML file, you can define the initContainers section either before or after the containers section. The order of definition doesn't affect the execution order.

The important thing is that initContainers and containers are both defined under the spec section, and they are separate sections.

So, both of the following YAML structures are valid:

Structure 1: initContainers first
```
spec:
  initContainers:
  - name: init-myservice
    ...
  - name: init-mydb
    ...
  containers:
  - name: myapp-container
    ...
```
Structure 2: containers first
```
spec:
  containers:
  - name: myapp-container
    ...
  initContainers:
  - name: init-myservice
    ...
  - name: init-mydb
    ...
```
Both structures will work correctly, and the init containers will run before the main container in either case.

