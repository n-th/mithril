#!/bin/bash

INGRESS_POD=$(kubectl get pod -l app=istio-ingressgateway -n istio-system -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward "$INGRESS_POD" --address 0.0.0.0 8000:8080 -n istio-system &