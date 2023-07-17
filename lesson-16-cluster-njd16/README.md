From Jenkins EC2

eksctl create cluster --name njd16 --version 1.27 --region us-west-2 --nodegroup-name njd16 --node-type t2.medium --nodes 4

#---------------------------------

k apply -f deploy-svc-simple.yaml 
k apply -f deploy-svc-app.yaml

#------------------------------------------------

/home/ubuntu/projects/k8s-lessons-buk/pull_changes.sh

#-------------------------------------------------

https://kubernetes.github.io/ingress-nginx/deploy/#aws

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/aws/deploy.yaml

k get svc -n ingress-nginx

k apply -f ingress.yaml 
k get ingress

#-----------------------------------------------------------

In Route53 for A record use Alias to Network LoadBalancer

#--------------------------------------------------

ubuntu@ip-172-31-10-23:~/projects/k8s-lessons-buk/lesson-16$ nslookup
> a0cead6c2640045a78118618e6a63be4-417bfb9aa5bb6d49.elb.us-west-2.amazonaws.com
Server:         127.0.0.53
Address:        127.0.0.53#53

Non-authoritative answer:
Name:   a0cead6c2640045a78118618e6a63be4-417bfb9aa5bb6d49.elb.us-west-2.amazonaws.com
Address: 54.200.146.165
Name:   a0cead6c2640045a78118618e6a63be4-417bfb9aa5bb6d49.elb.us-west-2.amazonaws.com
Address: 52.10.153.215
Name:   a0cead6c2640045a78118618e6a63be4-417bfb9aa5bb6d49.elb.us-west-2.amazonaws.com
Address: 54.68.1.128

#-------------------------------------------------------

Cert Manager Installation 

https://cert-manager.io/docs/installation/

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.0/cert-manager.yaml

k apply -f staging_ClusterIssuer.yaml
k apply -f prod_ClusterIssuer.yaml
k get clusterissuers.cert-manager.io

k get certificate
k get certificaterequests.cert-manager.io
k describe certificate
k describe  certificaterequests.cert-manager.io

k get orders.acme.cert-manager.io
k get challenges.acme.cert-manager.io
k describe challenges.acme.cert-manager.io


k get pods

ubuntu@ip-172-31-10-23:~$ k get pods
NAME                    READY   STATUS    RESTARTS   AGE
app-54c7669c88-bwfxn    1/1     Running   0          48m
app-54c7669c88-h9hn4    1/1     Running   0          48m
java-776c8df68b-4j5bw   1/1     Running   0          24m
java-776c8df68b-lg28q   1/1     Running   0          24m
main-74b44fb6d4-dfcs5   1/1     Running   0          23m
main-74b44fb6d4-tz6mz   1/1     Running   0          23m
simple-7c67bcb6-gdx5p   1/1     Running   0          128m
simple-7c67bcb6-gvpq2   1/1     Running   0          128m

k get svc

ubuntu@ip-172-31-10-23:~$ k get svc
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
app          ClusterIP   10.100.6.215     <none>        80/TCP    54m
java         ClusterIP   10.100.216.187   <none>        80/TCP    24m
kubernetes   ClusterIP   10.100.0.1       <none>        443/TCP   167m
main         ClusterIP   10.100.244.58    <none>        80/TCP    24m
simple       ClusterIP   10.100.117.13    <none>        80/TCP    128m

k get ingress

buntu@ip-172-31-10-23:~$ k get ingress
NAME           CLASS    HOSTS                                                                               ADDRESS                                                                         PORTS     AGE
main-ingress   <none>   app.notjustdevops.com,simple.notjustdevops.com,java.notjustdevops.com + 1 more...   a0cead6c2640045a78118618e6a63be4-417bfb9aa5bb6d49.elb.us-west-2.amazonaws.com   80, 443   123m

#------------------------------------------------------




