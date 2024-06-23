https://yuminlee2.medium.com/kubernetes-static-pods-734dc0684f31
https://medium.com/jorgeacetozi/kubernetes-master-components-etcd-api-server-controller-manager-and-scheduler-3a0179fc8186
Create static Pods ( https://kubernetes.io/docs/tasks/configure-pod-container/static-pod/ )

Constants and well-known values and paths (https://kubernetes.io/docs/reference/setup-tools/kubeadm/implementation-details/#constants-and-well-known-values-and-paths)


In order to reduce complexity and to simplify development of higher level tools that build on top of kubeadm, it uses a limited set of constant values for well-known paths and file names.

The Kubernetes directory /etc/kubernetes is a constant in the application, since it is clearly the given path in a majority of cases, and the most intuitive location; other constant paths and file names are:

/etc/kubernetes/manifests as the path where the kubelet should look for static Pod manifests. Names of static Pod manifests are:

etcd.yaml

kube-apiserver.yaml

kube-controller-manager.yaml

kube-scheduler.yaml
