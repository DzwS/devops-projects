#!/bin/bash
helm repo add grafana https://grafana.github.io/helm-charts
helm pull grafana/grafana --untar

cp grafana/values.yaml ./values.yaml

helm install grafana grafana/grafana -f values.yaml --namespace monitoring --create-namespace


helm get values grafana --namespace monitoring -o yaml > values.yaml
# helm get manifest <release-name> --namespace <namespace> > manifest.yaml