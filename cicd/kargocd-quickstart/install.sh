#!/bin/sh
set -e


# install helm
function install_helm() {
    wget https://get.helm.sh/helm-v3.16.3-linux-amd64.tar.gz
    # 解压压缩包
    tar -xf helm-v3.6.1-linux-amd64.tar.gz
    # 将helm文件拷贝到系统path路径下
    cp linux-amd64/helm /usr/local/bin/helm
    # 验证
    helm version
}


function install_cert-manager() {
    docker pull quay.io/jetstack/cert-manager-webhook:v1.17.0
    docker pull quay.io/jetstack/cert-manager-cainjector:v1.17.0
    docker pull quay.io/jetstack/cert-manager-controller:v1.17.0

    k3d image import quay.io/jetstack/cert-manager-webhook:v1.17.0 --cluster mycluster
    k3d image import quay.io/jetstack/cert-manager-cainjector:v1.17.0 --cluster mycluster
    k3d image import quay.io/jetstack/cert-manager-controller:v1.17.0 --cluster mycluster

    # kargo
    docker pull ghcr.io/akuity/kargo:v1.3.1

    k3d image import ghcr.io/akuity/kargo:v1.3.1 --cluster mycluster


}


