#!/bin/bash
echo "Installing MetalLB..."

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.5/config/manifests/metallb.yaml

echo "Waiting for MetalLB to start..."
sleep 10

kubectl apply -f metallb-auto.yaml

echo "Restarting MetalLB speakers..."
kubectl delete pod -n metallb-system -l component=speaker

echo "MetalLB applied!"
