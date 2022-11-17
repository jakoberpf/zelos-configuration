#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

helm upgrade --install postgres ./postgres --namespace=postgres # --values=values.yaml
