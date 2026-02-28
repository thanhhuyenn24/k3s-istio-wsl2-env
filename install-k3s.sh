#!/bin/bash
echo "Installing K3s..."
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --disable traefik" sh -
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $USER:$USER ~/.kube/config
echo "K3s installed!"
