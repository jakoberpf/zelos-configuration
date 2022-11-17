#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

kubectl scale deploy -n keycloak --replicas=0 keycloak
helm upgrade --install keycloak erpf/keycloak --namespace=keycloak --version=0.0.3 --values=values.yaml
