#!/bin/bash
set -e
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)

# k3d cluster create -c $SHELL_FOLDER/simple.yaml
k3d cluster create -c $SHELL_FOLDER/mycluster.yaml



# manual import image
# k8s can not connect registry-1.docker.io
# docker pull registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.4.4
# k3d image import registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.4.4 --cluster mycluster



# # create ingress
# # 创建对应的命名空间
# kubectl create ns ingress-nginx
# docker pull registry.k8s.io/ingress-nginx/controller:v1.12.0-beta.0
# docker pull registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.4.4
# docker pull registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.4.4

## install prometheus-operator
# cat setup/*.yaml | grep image: | grep -v  "^$" | awk -F":" '{print $2":"$3}' > images.txt

# cat *.yaml | grep image: | grep -v  "^$" | awk -F":" '{print $2":"$3}' >> images.txt

# xargs -n 1 docker pull < images.txt
# xargs -n 1 k3d image import -c mycluster < images.txt


function install_argocd(){
    ## argo cd images
    docker pull quay.io/argoproj/argocd:v2.14.2
    docker pull ghcr.io/dexidp/dex:v2.41.1
    docker pull redis:7.0.15-alpine

    k3d image import quay.io/argoproj/argocd:v2.14.2 --cluster mycluster
    k3d image import ghcr.io/dexidp/dex:v2.41.1 --cluster mycluster
    k3d image import redis:7.0.15-alpine --cluster mycluster

    ## example applicatoin
    docker pull aimvector/python:1.0.0
    k3d image import aimvector/python:1.0.0 --cluster mycluster

    # kubectl create namespace argocd
    # kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
    # kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
    # kubectl apply -f $SHELL_FOLDER/argocd/argocd-ingress.yaml
}

# generate a funciton to add two numbers

