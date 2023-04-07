#!/usr/bin/env bash

set -eo pipefail

ask () {
  read -p "Are you sure? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
      exit 1
  fi
}

################
## Namespaces ##
################

kubectl kustomize --enable-helm namespaces | kubectl apply --dry-run=client -f -
kubectl kustomize --enable-helm namespaces | kubectl diff -f  -
ask
kubectl kustomize --enable-helm namespaces | kubectl apply -f -

# view yaml manifest first
kubectl kustomize --enable-helm deployments | kubectl apply --dry-run=client -f -
kubectl kustomize --enable-helm deployments | kubectl diff -f  -
ask
kubectl kustomize --enable-helm deployments | kubectl apply -f -
