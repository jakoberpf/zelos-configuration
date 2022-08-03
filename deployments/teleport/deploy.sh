#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .
helm upgrade --install teleport erpf/teleport --namespace=teleport --version=0.0.3 --values=values.yaml
