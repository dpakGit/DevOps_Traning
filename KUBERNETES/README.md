 Listing all resources in a namespace : Link - https://stackoverflow.com/questions/47691479/listing-all-resources-in-a-namespace

 https://www.baeldung.com/ops/kubernetes-list-all-resources
 
 https://kubernetes.io/docs/reference/kubectl/quick-reference/

 Declarative Management of Kubernetes Objects Using Configuration Files : https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/

 Imperative Management of Kubernetes Objects Using Configuration Files : https://kubernetes.io/docs/tasks/manage-kubernetes-objects/imperative-config/

 Managing Kubernetes Objects Using Imperative Commands : https://kubernetes.io/docs/tasks/manage-kubernetes-objects/imperative-command/


Imperative Commands in Kubernetes — A Primer by poornima narasimhan : https://talktopoorni.medium.com/imperative-commands-in-kubernetes-a-primer-9565c25535f7


 
### In Kubernetes, the following objects can create pods:

1. Deployment: A Deployment is a Kubernetes object that manages a set of replicas (i.e., multiple copies) of a pod. It ensures that a specified number of replicas are running at any given time.
2. ReplicaSet: A ReplicaSet is a Kubernetes object that ensures a specified number of replicas (i.e., identical pods) are running at any given time. It's often used in conjunction with Deployments.
3. StatefulSet: A StatefulSet is a Kubernetes object that manages a set of pods with unique network identities. It's used for stateful applications that require persistent storage and network identities.
4. DaemonSet: A DaemonSet is a Kubernetes object that ensures a specific pod runs on each node in a cluster. It's often used for logging, monitoring, or other node-specific tasks.
5. Job: A Job is a Kubernetes object that creates one or more pods to run a batch job or a task that needs to be completed.
6. CronJob: A CronJob is a Kubernetes object that creates a Job object at a specified interval (e.g., every hour, daily).

These objects can create and manage pods in a Kubernetes cluster, each serving a specific purpose and use case.


### In Kubernetes, the following objects have a pod template section in their YAML files:

1. Deployment: Yes, Deployments have a spec.template section that defines the pod template.
2. ReplicaSet: Yes, ReplicaSets have a spec.template section that defines the pod template.
3. StatefulSet: Yes, StatefulSets have a spec.template section that defines the pod template.
4. DaemonSet: Yes, DaemonSets have a spec.template section that defines the pod template.

However, the following objects do not have a traditional pod template section:

1. Job: Jobs have a spec.template section, but it's not exactly the same as a pod template. Instead, it's a pod specification that defines the pod that will be created to run the job.
2. CronJob: CronJobs have a spec.jobTemplate.spec.template section, which defines the pod template for the job that will be created.

In general, any object that creates pods will have some form of pod specification or template section in its YAML file. The exact structure and naming of this section may vary depending on the object type.

### Here are YAML files for each object, highlighting the template section:

Deployment

apiVersion: apps/v1
kind: Deployment
metadata:
  name: example-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: example
  template:
    metadata:
      labels:
        app: example
    spec:
      containers:
      - name: example-container
        image: example-image


ReplicaSet

apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: example-replicaset
spec:
  replicas: 3
  selector:
    matchLabels:
      app: example
  template:
    metadata:
      labels:
        app: example
    spec:
      containers:
      - name: example-container
        image: example-image


StatefulSet

apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: example-statefulset
spec:
  replicas: 3
  selector:
    matchLabels:
      app: example
  serviceName: example-service
  template:
    metadata:
      labels:
        app: example
    spec:
      containers:
      - name: example-container
        image: example-image


DaemonSet

apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: example-daemonset
spec:
  selector:
    matchLabels:
      app: example
  template:
    metadata:
      labels:
        app: example
    spec:
      containers:
      - name: example-container
        image: example-image


Job

apiVersion: batch/v1
kind: Job
metadata:
  name: example-job
spec:
  template:
    spec:
      containers:
      - name: example-container
        image: example-image
      restartPolicy: OnFailure


CronJob

apiVersion: batch/v1
kind: CronJob
metadata:
  name: example-cronjob
spec:
  schedule:
    - cron: 0 * * * *
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: example-container
            image: example-image
          restartPolicy: OnFailure


Notice how the template section is similar across most objects, but the structure and nesting may vary depending on the object type.
