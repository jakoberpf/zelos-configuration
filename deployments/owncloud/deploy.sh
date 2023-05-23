#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

helm upgrade --install owncloud \
    /Users/jakoberpf/Code/jakoberpf/kubernetes/charts/charts/owncloud \
    --values values.yaml \
    -n owncloud
