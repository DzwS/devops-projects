#!/bin/bash
set -e
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)

# k3d cluster create -c $SHELL_FOLDER/simple.yaml
k3d cluster create -c $SHELL_FOLDER/mycluster.yaml



# manual import image
# k8s can not connect registry-1.docker.io
# docker pull registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.4.4
# k3d image import registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.4.4 --cluster mycluster



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

function install_ingress() {
    kubectl create ns ingress-nginx
    docker pull registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.4.4
    k3d image import registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.4.4 --cluster mycluster

    docker pull registry.k8s.io/ingress-nginx/controller:v1.11.3
    k3d image import registry.k8s.io/ingress-nginx/controller:v1.11.3 --cluster mycluster
}

function install_prometheus() {
    docker pull ghcr.io/prometheus-operator/prometheus-config-reloader:v0.78.2
    k3d image import ghcr.io/prometheus-operator/prometheus-config-reloader:v0.78.2 --cluster mycluster

    docker pull prom/prometheus:v3.1.0
    k3d image import prom/prometheus:v3.1.0 --cluster mycluster
}

function install_grafana() {
    docker pull docker.io/grafana/grafana:11.3.1
    k3d image import docker.io/grafana/grafana:11.3.1 --cluster mycluster
}


function install_istio(){
    # istio
    docker pull docker.io/istio/pilot:1.25.0
    k3d image import docker.io/istio/pilot:1.25.0 --cluster mycluster

    docker pull docker.io/istio/proxyv2:1.25.0
    k3d image import docker.io/istio/proxyv2:1.25.0 --cluster mycluster

    k3d image import aimvector/service-mesh:playlists-api-1.0.0 --cluster mycluster
    k3d image import aimvector/service-mesh:videos-web-1.0.0 --cluster mycluster
}

install_argocd