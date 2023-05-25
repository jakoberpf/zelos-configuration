#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

helm upgrade --install gateway \
    /Users/jakoberpf/Code/jakoberpf/projects/zerotier-gateway/chart \
    --values values.yaml \
    -n gateway
