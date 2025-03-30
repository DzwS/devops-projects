#!/bin/bash

# 定义镜像列表
IMAGES=(
  "quay.io/argoproj/argocd:v2.14.6"
  "ghcr.io/dexidp/dex:v2.41.1"
  "redis:7.0.15-alpine"
)

# 定义 K3d 集群名称
CLUSTER_NAME="mycluster"

# 确保 Docker 已启动
echo "检查 Docker 是否已启动..."
if ! systemctl is-active --quiet docker; then
  echo "Docker 未启动，请先启动 Docker！"
  exit 1
fi

# 下载镜像并导入到 K3d
for IMAGE in "${IMAGES[@]}"; do
  echo "正在拉取镜像: $IMAGE"
  docker pull $IMAGE
  if [ $? -ne 0 ]; then
    echo "拉取镜像 $IMAGE 失败，请检查镜像名称！"
    exit 1
  fi

  echo "正在导入镜像到 K3d 集群: $CLUSTER_NAME"
  k3d image import $IMAGE -c $CLUSTER_NAME
  if [ $? -ne 0 ]; then
    echo "导入镜像 $IMAGE 到 K3d 集群失败，请检查 K3d 配置！"
    exit 1
  fi

  echo "镜像 $IMAGE 已成功导入到 K3d 集群！"
done

echo