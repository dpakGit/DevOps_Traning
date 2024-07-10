1.   https://github.com/rskTech/k8s_material/blob/master/RBAC/README.md3. 

2.   __Certificates and Certificate Signing Requests__ : https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/
scroll down and read the following " How to issue a certificate for a user   "

3.  **Why and How to Use Kubectl Config Set-Context** (KODEKLOUD) : https://kodekloud.com/blog/kubectl-change-context/#:~:text=Contexts%20are%20shortcuts%20that%20let,to%20the%20Kubernetes%20API%20server.

4. **Devopspro** :-https://github.com/devopsproin/certified-kubernetes-administrator/blob/main/RBAC/README.md  


5. **Using RBAC Authorization** : https://kubernetes.io/docs/reference/access-authn-authz/rbac/

6.  **Role Based Access Control Good Practices** :https://kubernetes.io/docs/concepts/security/rbac-good-practices/

you can not manage a resource that is not part of any namespace with inherently namespaced Role/RoleBinding. Those can only be managed by ClusterRole/ClusterRoleBindings

##**Cluster-Scoped Resources**
Cluster-scoped resources are Kubernetes resources that are not namespaced. Cluster-scoped resources may be part of the Kubernetes cluster configuration or may be part of one or more applications. K10 can protect and restore cluster-scoped resources together with or separately from applications.
 
 **Using RBAC Authorization-Kubernetes**  :- https://kubernetes.io › reference

A Role always sets permissions within a particular namespace; when you create a Role, you have to specify the namespace it belongs in. ClusterRole, by contrast, is a non-namespaced resource.

**What is the difference between a role and a ClusterRole?** :- https://cloud.google.com 

 ### A Role defines access to resources within a single Namespace, while a ClusterRole defines access to resources in the entire cluster. 
Roles and ClusterRoles have the same syntax. Each has a rules section, where you define the resources the rule applies to and allowed operations for the Role.

**Can we use RoleBinding with ClusterRole?** :- Learnk8s


RoleBindings can link ClusterRoles, but they only grant access to the namespace of the RoleBinding. 
ClusterRoleBindings link accounts to ClusterRoles and grant access across all resources.



### **Checking API access** : https://kubernetes.io/docs/reference/access-authn-authz/authorization/


kubectl provides the auth can-i subcommand for quickly querying the API authorization layer. The command uses the SelfSubjectAccessReview API to determine if the current user can perform a given action, and works regardless of the authorization mode used.

``
kubectl auth can-i create deployments --namespace dev
``

The output is similar to this:

yes

``
kubectl auth can-i create deployments --namespace prod
``

The output is similar to this:

no

Administrators can combine this with user impersonation to determine what action other users can perform.

``
kubectl auth can-i list secrets --namespace dev --as dave
``

The output is similar to this:

no

Similarly, to check whether a ServiceAccount named dev-sa in Namespace dev can list Pods in the Namespace target:

``
kubectl auth can-i list pods \
    --namespace target \
    --as system:serviceaccount:dev:dev-sa
``    
    
The output is similar to this:

yes

........................................................
### **resourceNames Attribute**


1. **Question to kodekloud** : 

Role binding will allow user “DevUser” to read all the pods in the “development” namespace.

Q) Suppose I have three Pods ( P1, P2, P3 ) running in the development namespace, how can i give permission to the User to access only two particular pods( P1 and P2 ) and deny access to the third pod ?

https://kodekloud.com/community/t/role-based-access-control/461725

Reply : As for your question: You can further restrict the role by actually naming the resourceNames of the pods you want the grant to apply to.

2. https://stackoverflow.com/questions/65202615/proper-use-of-role-rules-resourcenames-for-creating-pods-with-limited-access-to

3. https://stackoverflow.com/questions/62274122/kubernetes-rbac-roles-with-resourcename-and-listing-objects

4. https://github.com/kubernetes/kubernetes/issues/56582
