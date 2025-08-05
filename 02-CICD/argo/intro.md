【入门介绍】https://www.youtube.com/watch?v=MeU5_k9ssrs
【架构详解】https://tinychen.com/20230506-argocd-intro-and-ha-deploy/
【文档】https://argo-cd.readthedocs.io/en/stable/


## 核心概念 && 架构
API Server: argocd的API入口，提供外部接口以便用户或外部工具与ArgoCD进行交互。API Server同时也是web ui的后台服务
Repository Server: 负责与Git仓库进行交互。它从仓库中拉取应用定义，并将这些定义转化为Kubernetes清单文件。Repository Server会缓存从Git仓库中获取的文件，以加快后续的操作
Controller：核心控制器，持续监控Kubernetes集群的当前状态与期望状态（定义在Git仓库中）之间的差异。Controller负责将集群的状态与Git中期望状态保持一致。
Application Controller：负责清理用户定义的Argo CD applicaton资源。它会检查git仓库中的定义，并确保这些确保这些定义与kubernetes集群中的应用保持同步
Redis Server：用于缓存数据和提升系统性能，尤其在处理大量应用和频繁同步操作时显得尤为重要。
Web UI: 提供了一个友好的图形化界面，用户可以通过Web UI查看应用状态，同步状态以及进行手动操作


## Cheat Sheet
argocd login: 登入
argocd app create:
argocd app get:
argocd app sync:
argocd app delete:
argocd app diff:
argocd app rollback:
argocd repo add:
argocd repo list:
argocd repo rm:
argocd repo list-resources:
argocd proj create:
argocd proj get:
argocd proj delete:
argocd proj delete:
argocd cluster add:
argocd cluster list:
argocd cluster rm:
argocd account update-password:
argocd account list:
argocd version:
