#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

helm upgrade --install grafana grafana/grafana --namespace=grafana --values=values.yaml

# https://grafana.com/docs/grafana/v9.0/setup-grafana/configure-security/configure-authentication/github/

helm upgrade --install mimir grafana/mimir-distributed --namespace=grafana --values=values.yaml

# https://grafana.com/docs/mimir/latest/operators-guide/running-production-environment-with-helm/configuration-with-helm/
# https://grafana.com/docs/mimir/latest/operators-guide/deploy-grafana-mimir/getting-started-helm-charts/
