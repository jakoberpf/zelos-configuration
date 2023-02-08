#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

# helm upgrade --install keycloak-postgres /Users/jakoberpf/Code/jakoberpf/kubernetes/charts/charts/postgres --namespace=keycloak --values=values.yaml
# https://blog.knoldus.com/migrate-keycloak-h2-database-to-postgres-on-kubernetes/

kubectl scale deploy -n keycloak --replicas=0 keycloak
helm upgrade --install keycloak erpf/keycloak --namespace=keycloak --values=values.yaml
