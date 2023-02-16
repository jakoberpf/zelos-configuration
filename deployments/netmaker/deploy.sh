#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

helm upgrade --install netmaker-postgres /Users/jakoberpf/Code/jakoberpf/kubernetes/charts/charts/postgres --namespace=netmaker --values=postgres-values.yaml

helm upgrade --install netmaker /Users/jakoberpf/Code/jakoberpf/kubernetes/charts/charts/netmaker --namespace=netmaker --values=netmaker-values.yaml
