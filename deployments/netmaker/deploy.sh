#!/usr/bin/env bash

set -eo pipefail

kubectl apply -k .

# helm upgrade --install netmaker-nfs /Users/jakoberpf/Code/jakoberpf/kubernetes/charts/charts/nfs --namespace=netmaker --values=nfs-values.yaml

helm upgrade --install netmaker-postgres /Users/jakoberpf/Code/jakoberpf/kubernetes/charts/charts/postgres --namespace=netmaker --values=postgres-values.yaml

helm upgrade --install netmaker /Users/jakoberpf/Code/jakoberpf/kubernetes/charts/charts/netmaker --namespace=netmaker --values=netmaker-values.yaml

# helm install netmaker netmaker/netmaker https://docs.netmaker.org/server-installation.html#highly-available-installation-kubernetes
# --set baseDomain=nm.example.com \ # the base wildcard domain to use for the netmaker api/dashboard/grpc ingress
# --set replicas=3 \ # number of server replicas to deploy (3 by default)
# --set dns.enabled=true \ # deploy and enable private DNS management with CoreDNS
# --set dns.clusterIP=10.245.75.75 --set dns.RWX.storageClassName=nfs \ # required fields for DNS
# --set postgresql-ha.postgresql.replicaCount=2 \ # number of DB replicas to deploy (default 2)