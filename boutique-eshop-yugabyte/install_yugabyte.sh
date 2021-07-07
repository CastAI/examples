#!/bin/bash

set -e

kubectl create namespace yugabyte-aws --dry-run=client -o yaml | kubectl apply -f -
kubectl create namespace yugabyte-azure --dry-run=client -o yaml | kubectl apply -f -
kubectl create namespace yugabyte-gcp --dry-run=client -o yaml | kubectl apply -f -
kubectl create namespace yugabyte-do --dry-run=client -o yaml | kubectl apply -f -

kubectl -n yugabyte-aws apply -f ./yugabyte/aws-out.yaml
kubectl -n yugabyte-azure apply -f ./yugabyte/azure-out.yaml
kubectl -n yugabyte-gcp apply -f ./yugabyte/gcp-out.yaml
kubectl -n yugabyte-do apply -f ./yugabyte/do-out.yaml

kubectl wait --timeout="300s" --for=condition=ready pod yb-master-0 -n yugabyte-aws
kubectl wait --timeout="300s" --for=condition=ready pod yb-master-0 -n yugabyte-azure
kubectl wait --timeout="300s" --for=condition=ready pod yb-master-0 -n yugabyte-gcp
kubectl wait --timeout="300s" --for=condition=ready pod yb-master-0 -n yugabyte-do
