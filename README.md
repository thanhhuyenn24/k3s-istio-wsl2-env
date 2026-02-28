# K3s + Istio + MetalLB on WSL2

A fully reproducible Kubernetes environment tailored for WSL2 (Ubuntu 22.04).  
This setup ensures all team members can run identical environments for development, testing, and Reinforcement Learning (RL) experiments.

> ⚠️ **All commands MUST be executed inside the WSL Ubuntu terminal (not PowerShell).**

## Tech Stack
- **K3s** (v1.34.4+k3s1) – Traefik disabled.
- **Istio** (1.29.0) – demo profile.
- **MetalLB** – LoadBalancer for WSL2 environments.
- **Bookinfo** – Sample application to validate routing/service mesh behavior.

## Prerequisites
- Windows 10/11 with WSL2 enabled.
- Ubuntu 22.04 installed.
- `curl`, `git`.

## Quick Start

Clone the repository and execute the setup scripts:

```bash
git clone https://github.com/thanhhuyenn24/k3s-istio-wsl2-env
cd k3s-istio-wsl2-env

# 1. Install K3s
./install-k3s.sh

# 2. Install Istio
./install-istio.sh

# 3. Apply MetalLB
./apply-metallb.sh

# 4. Deploy Bookinfo
./deploy-bookinfo.sh
```

## Accessing the Application

Fetch LoadBalancer IP:

```bash
./get-ingress-ip.sh
```

Then open:

```
http://<LB_IP>/productpage
```

## WSL2 Restart Behavior

WSL2 assigns a new internal eth0 IP on every reboot.  
**You do NOT need to reinstall anything.**  
MetalLB will automatically assign a working LoadBalancer IP again.

Just run:

```bash
./get-ingress-ip.sh
```

## Verification

```bash
kubectl get nodes -o wide
kubectl get pods -A
kubectl get gateway -A
kubectl get virtualservice -A
```

Bookinfo pods should show:

```
READY = 2/2
```

## Repository Structure

```text
.
├── apply-metallb.sh
├── deploy-bookinfo.sh
├── get-ingress-ip.sh
├── install-istio.sh
├── install-k3s.sh
├── metallb-auto.yaml
└── README.md
```
