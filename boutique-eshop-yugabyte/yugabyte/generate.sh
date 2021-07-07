#!/bin/bash

helm repo add yugabytedb https://charts.yugabyte.com
helm repo update

helm template yuga-aws yugabytedb/yugabyte -f aws.yaml --namespace yugabyte-aws > aws-out.yaml
sed -i '' 's/failure-domain.beta.kubernetes.io\/zone/topology.storage.csi.cast.ai\/csp/g' aws-out.yaml

helm template yuga-azure yugabytedb/yugabyte -f azure.yaml --namespace yugabyte-azure > azure-out.yaml
sed -i '' 's/failure-domain.beta.kubernetes.io\/zone/topology.storage.csi.cast.ai\/csp/g' azure-out.yaml

helm template yuga-gcp yugabytedb/yugabyte -f gcp.yaml --namespace yugabyte-gcp > gcp-out.yaml
sed -i '' 's/failure-domain.beta.kubernetes.io\/zone/topology.storage.csi.cast.ai\/csp/g' gcp-out.yaml

helm template yuga-do yugabytedb/yugabyte -f do.yaml --namespace yugabyte-do > do-out.yaml
sed -i '' 's/failure-domain.beta.kubernetes.io\/zone/topology.storage.csi.cast.ai\/csp/g' do-out.yaml
