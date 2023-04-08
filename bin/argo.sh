#!/usr/bin/env sh

set -eo pipefail

ARGOCD_NAMESPACE=argocd
if [ ! "$(kubectl get namespaces -o json | jq -r ".items[].metadata.name | select (. == \"$ARGOCD_NAMESPACE\")")" == "$ARGOCD_NAMESPACE" ]; then
    echo "Creating namespace $ARGOCD_NAMESPACE"
    kubectl create namespace $ARGOCD_NAMESPACE
else
    echo "Namespace $ARGOCD_NAMESPACE exists, nothing to do"
fi

prettify() {
  # Black        0;30     Dark Gray     1;30
  # Red          0;31     Light Red     1;31
  # Green        0;32     Light Green   1;32
  # Brown/Orange 0;33     Yellow        1;33
  # Blue         0;34     Light Blue    1;34
  # Purple       0;35     Light Purple  1;35
  # Cyan         0;36     Light Cyan    1;36
  # Light Gray   0;37     White         1;37
  sed -e 's/configured/\\033[1;33mconfigured\\033[0m/g' -e 's/created/\\033[0;32mcreated\\033[0m/g' -e 's/unchanged/\\033[0;34munchanged\\033[0m/g'
}

echo "$(kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml | prettify )"
