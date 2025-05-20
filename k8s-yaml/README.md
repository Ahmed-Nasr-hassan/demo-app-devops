# Kubernetes Manifests

This directory contains all Kubernetes configurations for the demo application.

## Directory Structure

```
k8s-yaml/
├── argocd/              # ArgoCD configurations
│   └── application.yaml # Demo app ArgoCD application
├── demo-app/           # Demo application manifests
│   ├── deployment.yaml # Application deployment
│   ├── service.yaml    # LoadBalancer service
│   └── ingress.yaml    # NGINX ingress configuration
└── ingress-nginx/      # NGINX Ingress Controller manifests
    └── azure-ingress-nginx.yaml
```

## Prerequisites

1. Kubernetes cluster
2. NGINX Ingress Controller
3. ArgoCD (for GitOps)

## Quick Start

1. **Install NGINX Ingress Controller**

   For AWS:
   ```bash
   kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/cloud/deploy.yaml
   ```

   For Azure:
   ```bash
   kubectl apply -f ingress-nginx/ingress-nginx.yaml
   ```

2. **Install ArgoCD**
   ```bash
   # Create namespace
   kubectl create namespace argocd

   # Install ArgoCD
   kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

   # Wait for ArgoCD to be ready
   kubectl get pods -n argocd -w
   ```

3. **Deploy Demo App**
   ```bash
   kubectl apply -f argocd/application.yaml
   ```

## Accessing the Application

1. **Get LoadBalancer IP**
   ```bash
   kubectl get svc demo-app
   ```

2. **Get Ingress IP**
   ```bash
   kubectl get ingress demo-app-ingress
   ```

## Additional Resources

- [ArgoCD Documentation](https://argo-cd.readthedocs.io/)
- [NGINX Ingress Controller](https://kubernetes.github.io/ingress-nginx/) 