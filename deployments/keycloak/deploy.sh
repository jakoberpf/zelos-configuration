#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

helm upgrade --install keycloak erpf/keycloak --namespace=keycloak  --version=0.0.1 --values=values.yaml
