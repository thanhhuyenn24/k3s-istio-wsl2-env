#!/bin/bash
IP=$(kubectl get svc istio-ingressgateway -n istio-system -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
echo "=================================================="
echo "Ingressgateway IP: $IP"
echo "Open Bookinfo at:"
echo "http://$IP/productpage"
echo "=================================================="
