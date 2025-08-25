### Task.md

create a deployment with name "nginx" and image "nginx:latest"
````
thor@jumphost ~$ kubectl create deploy nginx --image=nginx:latest
deployment.apps/nginx created

thor@jumphost ~$ kubectl get deploy
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
nginx   1/1     1            1           13s

thor@jumphost ~$ kubectl get po
NAME                     READY   STATUS    RESTARTS   AGE
nginx-7bf8c77b5b-dn92d   1/1     Running   0          22s

thor@jumphost ~$ kubectl get rs
NAME               DESIRED   CURRENT   READY   AGE
nginx-7bf8c77b5b   1         1         1       49s

thor@jumphost ~$ ls

thor@jumphost ~$ kubectl get deploy -o yaml > deploy-nginx.yaml

thor@jumphost ~$ ls
deploy-nginx.yaml
```
