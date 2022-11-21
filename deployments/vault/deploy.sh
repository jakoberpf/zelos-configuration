#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

helm upgrade --install vault erpf/vault --namespace=vault --values=values.yaml --version=0.0.3

# https://developer.hashicorp.com/vault/docs/configuration/storage/s3
# https://github.com/hashicorp/vault-helm/blob/main/values.yaml