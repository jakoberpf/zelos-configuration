#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

helm upgrade --install postgres bitnami/postgresql-ha -n postgres
