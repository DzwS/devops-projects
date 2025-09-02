kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.15.2/config/manifests/metallb-native.yaml

kubectl apply -f gitops/infra/metallb-config.yaml
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argocd argo/argo-cd --namespace argocd --create-namespace -f terraform/argocd/values.yaml



# Add the External Secrets Helm repository
helm repo add external-secrets https://charts.external-secrets.io

# Update Helm repositories
helm repo update

# Install External Secrets Operator
helm install external-secrets external-secrets/external-secrets \
  --namespace external-secrets \
  --create-namespace \
  --version 0.15.0 \
  --set installCRDs=true


kubectl create ns vault
helm repo add hashicorp https://helm.releases.hashicorp.com
helm install vault hashicorp/vault \
       --set='server.dev.enabled=true' \
       --set='ui.enabled=true' \
       --set='ui.serviceType=LoadBalancer' \
       --namespace vault
# 默认密码是root


# Add the External Secrets Helm repository
helm repo add external-secrets https://charts.external-secrets.io

# Update Helm repositories
helm repo update

# Install External Secrets Operator
helm install external-secrets external-secrets/external-secrets \
  --namespace external-secrets \
  --create-namespace \
  --version 0.15.0

kubectl  apply -f terraform/eso/secretstore.yaml 

kubectl create ns homepage