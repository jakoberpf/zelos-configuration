#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .
helm upgrade --install anonaddy /Users/jakoberpf/Code/jakoberpf/kubernetes/charts/charts/anonaddy --namespace=anonaddy --values=values.yaml
