## Verified Environment

|                        | Version |
| ---------------------- | ------- |
| Kubernetes             | v1.26.0 |
| kubectl Client version | v1.26.0 |

## Examples

```console
$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-85996f8dbd-mq8z9   1/1     Running   0          4m43s
nginx-deployment-85996f8dbd-pl2cw   1/1     Running   0          4m43s
```

### `kubectl get events`

```console
$ kubectl get events --field-selector involvedObject.name=nginx-deployment-85996f8dbd-mq8z9
LAST SEEN   TYPE     REASON      OBJECT                                  MESSAGE
5m4s        Normal   Scheduled   pod/nginx-deployment-85996f8dbd-mq8z9   Successfully assigned default/nginx-deployment-85996f8dbd-mq8z9 to node01
5m3s        Normal   Pulling     pod/nginx-deployment-85996f8dbd-mq8z9   Pulling image "nginx:1.14.2"
4m59s       Normal   Pulled      pod/nginx-deployment-85996f8dbd-mq8z9   Successfully pulled image "nginx:1.14.2" in 3.911484541s (3.911583232s including waiting)
4m59s       Normal   Created     pod/nginx-deployment-85996f8dbd-mq8z9   Created container nginx
4m59s       Normal   Started     pod/nginx-deployment-85996f8dbd-mq8z9   Started container nginx
```

### `kubectl events`

```console
kubectl events --for pods/nginx-deployment-85996f8dbd-mq8z9
LAST SEEN   TYPE     REASON      OBJECT                                  MESSAGE
11m         Normal   Scheduled   Pod/nginx-deployment-85996f8dbd-mq8z9   Successfully assigned default/nginx-deployment-85996f8dbd-mq8z9 to node01
11m         Normal   Pulling     Pod/nginx-deployment-85996f8dbd-mq8z9   Pulling image "nginx:1.14.2"
11m         Normal   Pulled      Pod/nginx-deployment-85996f8dbd-mq8z9   Successfully pulled image "nginx:1.14.2" in 3.911484541s (3.911583232s including waiting)
11m         Normal   Created     Pod/nginx-deployment-85996f8dbd-mq8z9   Created container nginx
11m         Normal   Started     Pod/nginx-deployment-85996f8dbd-mq8z9   Started container nginx
```
