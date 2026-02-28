#!/bin/bash
echo "Deploying Bookinfo..."
cd istio-1.29.0
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
echo "Bookinfo deployed!"
