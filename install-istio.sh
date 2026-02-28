#!/bin/bash
echo "Downloading Istio..."
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.29.0
export PATH=$PWD/bin:$PATH
echo "Installing Istio demo profile..."
istioctl install --set profile=demo -y
echo "Istio installed!"
