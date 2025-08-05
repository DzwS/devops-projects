## 什么是helm
helm是包管理器

## 关键概念
Chart: 一个Helm包，其中包含了运行一个应用所需要的镜像，依赖和资源定义等，还可能包含kubernetes集群中的服务定义，类似yum的rpm文件
Repository: 存储Helm Charts的地方
Release: Chart在k8s上运行的Chart的一个实例，例如，如果一个MySQL Chart想在服务器上运行两个数据库，可以将这个Chart安装两次，并在每次安装中生成自己的Release以及Release名称
Value: Helm Chart的参数，用于配置kubernetes对象
Template: 使用Go模板语言生成Kubernetes对象的定义文件
Namespace: kubernetes中用于隔离资源的逻辑分区

## Chart Sheet
常用的hub网站：https://artifacthub.io/

## 初始化
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add <repository-name> <url>
helm search repo <keyword>
helm search repo <repository-name>/<keyword>
helm search hub <keyword>
helm repo remove <repository-name>
## 搜索chart
helm search repo <repository-name>/<chart-name> --versions
helm search repo ingress-nginx --versions

## 安装
helm pull <repository-name>/<chart>
helm repo update

helm install [release-name] [chart] [flags]
helm install mywordpress myrepo/wordpress
helm install bitnami/mysql --generate-name
helm install -f myvalues.yaml myapp ./chart-dir

## 管理
helm upgrade [release] [chart]
helm upgrade mywordpress myrepo/wordpress

helm rollback mywordpress 1

## 下载release信息
helm list
helm get all [release]



## 最佳实践案例
1. search repo and chart in https://artifacthub.io/ or github or official website 
2. helm repo add <repo-name> <url>
3. helm pull <repository-name>/<chart>
4. 复制values.yaml并按需求自己修改
5. helm install <release-name> <chart>     -f <yaml-file/url> --namespace <namespace> 或者
6. helm install <release-name> ./chart-dir -f <yaml-file/url> --namespace <namespace>
7. helm upgrade <release-name> ./chart-dir -f <new-values> --namespace <namespace>
8. helm uninstall <release-name>

