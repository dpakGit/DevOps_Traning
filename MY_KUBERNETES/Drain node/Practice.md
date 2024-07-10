k explain role.rules
k explain role.rules.resourceNames
k get all
# .....................Drain node practice..................................
k get po
k get po -o wide
kubectl config current-context
k run pod --image=nginx --port=80
k get po
k create deploy mydeploy --image=nginx --port=80 --replicas=5
k get po
k get po -o wide
k get no
k drain node-1
#-Note : Try Draining the node with the Stand alone pod
k drain node-2   # Since in my practice Stand alone pod was running in this node
k uncordon node-1
k drain node-2 --force --ignore-daemonsets
k get po -o wide
k get no   # See the output
#-Status of node-2 is Ready,SchedulingDisabled
k get no 
k uncordon node-2
k get no 
k get po - o wide
