#!/usr/bin/env sh

set -eo pipefail

ask (){
  read -p "Are you sure? " -n 1 -r
  echo  # (optional) move to a new line
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
      exit 1
  fi
}

prettify() {
  # Black        0;30     Dark Gray     1;30
  # Red          0;31     Light Red     1;31
  # Green        0;32     Light Green   1;32
  # Brown/Orange 0;33     Yellow        1;33
  # Blue         0;34     Light Blue    1;34
  # Purple       0;35     Light Purple  1;35
  # Cyan         0;36     Light Cyan    1;36
  # Light Gray   0;37     White         1;37
  sed -e 's/configured/\\033[1;33mconfigured\\033[0m/g' -e 's/unchanged/\\033[0;32munchanged\\033[0m/g'
}

echo "################"
echo "## Namespaces ##"
echo "################"

# echo "$(kubectl kustomize --enable-helm namespaces | kubectl apply --dry-run=client -f - | prettify )"
echo "$(kubectl kustomize --enable-helm namespaces | kubectl diff -f - | prettify )"
ask
echo "$(kubectl kustomize --enable-helm namespaces | kubectl apply -f - | prettify )"

echo "#################"
echo "## Deployments ##"
echo "#################"

# echo "$(kubectl kustomize --enable-helm deployments | kubectl apply --dry-run=client -f - | prettify )"
echo "$(kubectl kustomize --enable-helm deployments | kubectl diff -f - | prettify )"
ask
echo "$(kubectl kustomize --enable-helm deployments | kubectl apply -f - | prettify )"
