#!/usr/bin/env bash

set -eo pipefail

# view yaml manifest first
kubectl kustomize --enable-helm
kubectl kustomize --enable-helm | kubectl apply --dry-run=client -f -

kubectl apply -f namespace.yaml

read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

# apply to kubernetes cluster
# 'apply' command does not have enable-helm flag
kubectl kustomize --enable-helm | kubectl apply -f -
