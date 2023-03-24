#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

helm upgrade --install teleport-postgres bitnami/postgresql-ha -n teleport

helm upgrade --install teleport /Users/jakoberpf/Code/jakoberpf/kubernetes/charts/charts/teleport -n teleport --values=values.yaml
