#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

# https://github.com/TwiN/gatus#configuration
helm repo add gatus https://avakarev.github.io/gatus-chart
helm repo update
helm upgrade --install gatus gatus/gatus --namespace=gatus --values=values.yaml
