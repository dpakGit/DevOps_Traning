###  We can also define the term as Cluster Maintenance / Node Maintenance 

**kubectl drain** :  https://kubernetes.io/docs/reference/kubectl/generated/kubectl_drain/

**Safely Drain a Node** : https://kubernetes.io/docs/tasks/administer-cluster/safely-drain-node/

**Put nodes into maintenance mode** : https://cloud.google.com/kubernetes-engine/distributed-cloud/bare-metal/docs/how-to/maintenance-mode

**LINUX HANDBOOK - How to Drain a Node in Kubernetes** :https://linuxhandbook.com/kubectl-drain-node/
To perform maintenance on a node, you should unschedule and then drain a node.

Node drain the node of all its resources running on it. Due to this, services running on the target node should be rescheduled to run on other nodes.:- Harness Developer Hub
