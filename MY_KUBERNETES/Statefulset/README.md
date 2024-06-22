(kodekloud community link)https://kodekloud.com/community/t/stateful-set-pvc-not-deleted-when-replicas-scaled-down/460952


Stateful set - PVC not deleted when replicas scaled down 

I have created a Stateful set having 5 replicas.
I am using a Local storage class .
I have 4 PV yaml files pv1.yaml,pv2.yaml …, storage class yaml and Stateful set yaml (check my git repo).
each time i create a PV manually it is binded to a PVC and a pod is created.
I scaled down the STS replica to 2, and when i checked the no of pods running it is showing 2 , but when i checked the PVC it is showing 4.

root@Master:/home/labsuser/DevOps_Class/MY_KUBERNETES/Statefulset# ls
pv1.yaml  pv2.yaml  pv3.yaml  pv4.yaml  sc.yaml  sfs.yaml

root@Master:/home/labsuser/DevOps_Class/MY_KUBERNETES/Statefulset# ls
Commands  pv1.yaml  pv2.yaml  pv3.yaml  pv4.yaml  sc.yaml  sfs.yaml
root@Master:/home/labsuser/DevOps_Class/MY_KUBERNETES/Statefulset# alias k=kubectl
root@Master:/home/labsuser/DevOps_Class/MY_KUBERNETES/Statefulset# k get po
NAME    READY   STATUS    RESTARTS      AGE
web-0   1/1     Running   1 (58m ago)   8h
web-1   1/1     Running   1 (58m ago)   8h
root@Master:/home/labsuser/DevOps_Class/MY_KUBERNETES/Statefulset# k get pv
NAME    CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS        CLAIM               STORAGECLASS       REASON   AGE
mypv    2Gi        RWO            Retain           Bound         default/www-web-0   my-storage-class            8h
mypv1   5Gi        RWO            Retain           Bound         default/www-web-1   my-storage-class            8h
mypv2   4Gi        RWO            Retain           Terminating   default/www-web-2   my-storage-class            8h
mypv4   5Gi        RWO            Retain           Terminating   default/www-web-3   my-storage-class            8h
root@Master:/home/labsuser/DevOps_Class/MY_KUBERNETES/Statefulset#  k get pvc
NAME        STATUS    VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS       AGE
www-web-0   Bound     mypv     2Gi        RWO            my-storage-class   8h
www-web-1   Bound     mypv1    5Gi        RWO            my-storage-class   8h
www-web-2   Bound     mypv2    4Gi        RWO            my-storage-class   8h
www-web-3   Bound     mypv4    5Gi        RWO            my-storage-class   8h
www-web-4   Pending                                      my-storage-class   8h
root@Master:/home/labsuser/DevOps_Class/MY_KUBERNETES/Statefulset# k get sts
NAME   READY   AGE
web    2/2     8h

My doubt is how can there be 5 PVC when the replica is 2(kindly refer the sfs.yaml file). Since 3 pods are deleted their respective PVC’s should also be deleted.
Kindly explain the doubt.

Reply from kodekloud.
rob_kodekloud
11h
Apparently, the PVCs are NOT DELETED AUTOMATICALLY,to prevent potential data loss, since in a lot of 
environments (not yours using local volumes, but some cloud environments) deleting the PVC will cause the PVs to be 
deallocated. See this post 1, which is on point for this. His doc link is still good, too, and the docs back him up.
(See this post 1- the link)https://stackoverflow.com/questions/65687515/delete-kubernetes-persistent-volume-from-statefulset-after-scale-down/65690759#65690759

dpakmishra.1983
6m
Thank you for the reply ,Sir.
So is it that deleting a PVC in this case means unbinding the respective PV and PVC. And now this unbonded PV with the existing data inside it can be claimed by any other PVC leading to data loss ?

Solution



Reply

rob_kodekloud
1m
Depends on the settings. Using a local or hostPath volume, your data most likely will be untouched. If you’re using an EBS volume on AWS, your data has probably gone and joined the Choir Invisible, and will not be seen again.



