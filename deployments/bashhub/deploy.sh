#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

helm upgrade --install bashhub erpf/bashhub --namespace=bashhub --version=0.1.14 --values=values.yaml
