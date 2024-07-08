1.   https://github.com/rskTech/k8s_material/blob/master/RBAC/README.md3. 

2.   __Certificates and Certificate Signing Requests__ : https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/
scroll down and read the following " How to issue a certificate for a user   "

3.  **Why and How to Use Kubectl Config Set-Context** (KODEKLOUD) : https://kodekloud.com/blog/kubectl-change-context/#:~:text=Contexts%20are%20shortcuts%20that%20let,to%20the%20Kubernetes%20API%20server.


4. **Using RBAC Authorization** : https://kubernetes.io/docs/reference/access-authn-authz/rbac/

5.  **Role Based Access Control Good Practices** :https://kubernetes.io/docs/concepts/security/rbac-good-practices/

you can not manage a resource that is not part of any namespace with inherently namespaced Role/RoleBinding. Those can only be managed by ClusterRole/ClusterRoleBindings

##**Cluster-Scoped Resources**
Cluster-scoped resources are Kubernetes resources that are not namespaced. Cluster-scoped resources may be part of the Kubernetes cluster configuration or may be part of one or more applications. K10 can protect and restore cluster-scoped resources together with or separately from applications.
