#!/bin/bash

# 定义变量
CHART_NAME="prometheus-community/prometheus"   # Helm Chart 名称
RELEASE_NAME="my-prometheus"                      # Release 名称
NAMESPACE="monitoring"                         # 命名空间
VALUES_FILE="values.yaml"                      # 自定义 values 文件
PRIVATE_REPO="my-private-repo.com"             # 私有镜像仓库地址
REPO_NAME='test'
MANIFEST_FILE="manifest.yaml"                  # Helm 渲染结果文件
OUTPUT_IMAGES_FILE="images.yaml"               # 提取的镜像列表

# 第一步：使用 helm template 渲染 YAML 文件
echo "渲染 Helm Chart..."
helm template "$RELEASE_NAME" ./prometheus -f "$VALUES_FILE" --namespace "$NAMESPACE" > "$MANIFEST_FILE"
if [ $? -ne 0 ]; then
  echo "Helm 渲染失败，请检查 Helm 配置。"
  exit 1
fi

# 第二步：从渲染结果中提取镜像
echo "提取镜像列表..."
grep "image:" "$MANIFEST_FILE" | awk '{print $2}' | sed 's/"//g' | sort | uniq > "$OUTPUT_IMAGES_FILE"
if [ $? -ne 0 ]; then
  echo "镜像提取失败，请检查渲染文件。"
  exit 1
fi
echo "镜像列表已保存到 $OUTPUT_IMAGES_FILE"

# 第三步：拉取镜像并推送到私有仓库
echo "开始处理镜像..."
while IFS= read -r image; do
  echo "处理镜像：$image"

  # 检查镜像格式是否正确
  if [[ -z "$image" ]]; then
    echo "跳过空镜像条目..."
    continue
  fi

  # 拉取镜像
  docker pull "$image"
  if [ $? -ne 0 ]; then
    echo "拉取镜像失败：$image"
    continue
  fi

  # 创建新的镜像标签
  image_name=$(echo "$image" | awk -F'/' '{print $3}')
  new_image="$PRIVATE_REPO/$REPO_NAME/${image_name}"
  docker tag "$image" "$new_image"

  # 推送镜像到私有仓库
  docker push "$new_image"
  if [ $? -ne 0 ]; then
    echo "推送镜像失败：$new_image"
    continue
  fi

  echo "镜像已推送到私有仓库：$new_image"

done < "$OUTPUT_IMAGES_FILE"

echo "所有镜像处理完成！"
