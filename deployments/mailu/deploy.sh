#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

helm upgrade --install mailu /Users/jakoberpf/Code/jakoberpf/kubernetes/charts/charts/mailu --namespace=mailu --values=values.yaml
