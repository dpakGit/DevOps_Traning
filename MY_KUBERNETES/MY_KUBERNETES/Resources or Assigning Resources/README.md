I am trying to assign the following resources to a pod, using " resource " attribute.

Q) CPU limits in pod.yaml is 0.2m, but when i describe the pod or node , in the output the CPU limits it is displaying 1m and not 2m.
Kindly explain.

# pod.yaml

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx
  name: nginx
spec:
  containers:
  - image: nginx
    name: nginx
    ports:
    - containerPort: 80
    resources:
      requests:
        cpu: 0.1m
        memory: 200M
      limits:
        memory: 400M
        **cpu: 0.2m**
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
# output of the command " K describe po nginx "
Limits:
      **cpu:     1m**
      memory:  400M
    Requests:
      cpu:        1m
      memory:     200M

# output of the command " k describe node <nodename> "

  Namespace                   Name                                        CPU Requests  CPU Limits  Memory Requests  Memory Limits  Age
  ---------                   ----                                        ------------  ----------  ---------------  -------------  ---
  default                     nginx                                       1m (0%)       **1m (0%)**     200M (2%)        400M (4%)      4m36s
  kube-system                 calico-kube-controllers-658d97c59c-qv9j2    0 (0%)        0 (0%)      0 (0%)           0 (0%)         18d
  kube-system                 calico-node-v6q8k                           250m (12%)    0 (0%)      0 (0%)           0 (0%)         18d
  kube-system                 kube-proxy-nn96k                            0 (0%)        0 (0%)      0 (0%)           0 (0%)         18d
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource           Requests    Limits
  --------           --------    ------
  cpu                251m (12%)  1m (0%)
  memory             200M (2%)   400M (4%)
  ephemeral-storage  0 (0%)      0 (0%)
  hugepages-1Gi      0 (0%)      0 (0%)
  hugepages-2Mi      0 (0%)      0 (0%)
Thank you
Deepak


rob_kodekloud ( https://kodekloud.com/community/t/assigning-resources-to-kubernetes-pod/461060 )
..............................
This is addressed in the docs: Note: Kubernetes doesn’t allow you to specify CPU resources with a precision finer than 1m or 0.001 CPU. To avoid accidentally using an invalid CPU quantity, it’s useful to specify CPU units using the milliCPU form instead of the decimal form when using less than 1 C…




This is addressed in the docs 1:

Note:
Kubernetes doesn’t allow you to specify CPU resources with a precision finer than 1m or 0.001 CPU. To avoid accidentally using an invalid CPU quantity, it’s useful to specify CPU units using the milliCPU form instead of the decimal form when using less than 1 CPU unit.

For example, you have a Pod that uses 5m or 0.005 CPU and would like to decrease its CPU resources. By using the decimal form, it’s harder to spot that 0.0005 CPU is an invalid value, while by using the milliCPU form, it’s easier to spot that 0.5m is an invalid value.


Alistair_KodeKloud.
.....................................
Kubernetes understands the unit u for micro, thus 200u = 0.2m, however I believe the minimum amount of CPU you can assign is 1m and that’s defined by the Linux kernel, so anything less than that will be rounded up.

