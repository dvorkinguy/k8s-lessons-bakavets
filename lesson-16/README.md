From Jenkins EC2

eksctl create cluster --name njd16 --version 1.27 --region us-west-2 --nodegroup-name njd16 --node-type t2.medium --nodes 4

k apply -f deploy-svc-simple.yaml 
k apply -f deploy-svc-app.yaml

/home/ubuntu/projects/k8s-lessons-buk/pull_changes.sh
#----------------------
https://kubernetes.github.io/ingress-nginx/deploy/#aws

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/aws/deploy.yaml

k get svc -n ingress-nginx

874  k apply -f ingress.yaml 
875  k get ingress

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

#------------------------------------------------------




