#!/bin/bash

# create all namespaces at the beginning to prevent errors with the bundle sync
/mithril/POC/create-namespaces.sh

kubectl create configmap upstream-ca-crt --from-file /mithril/usecases/workload-to-ingress-upstream-disk/server-cluster/upstream-ca.pem --namespace="spire"
kubectl create configmap upstream-ca-key --from-file /mithril/usecases/workload-to-ingress-upstream-disk/server-cluster/upstream-ca.key.pem --namespace="spire"

(cd spire ; ./deploy-spire.sh)
sleep 2
(cd istio ; ./deploy-istio.sh)
(cd workloads ; ./deploy-workloads.sh)
