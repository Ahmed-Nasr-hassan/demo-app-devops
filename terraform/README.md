# Terraform Infrastructure

This directory contains Terraform configurations for both AWS and Azure cloud providers.

## Directory Structure

```
terraform/
├── aws/                # AWS infrastructure
│   ├── environments/   # Environment-specific configurations
│   │   └── dev/       # Development environment
│   └── modules/       # Reusable Terraform modules
│       └── eks/       # EKS cluster module
└── azure/             # Azure infrastructure
    ├── environments/  # Environment-specific configurations
    │   └── dev/      # Development environment
    └── modules/      # Reusable Terraform modules
        └── aks/      # AKS cluster module
```

## Prerequisites

### AWS
1. AWS CLI configured with appropriate credentials
2. Required environment variables:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`

### Azure
1. Azure CLI installed and configured
2. Required environment variables:
   - `ARM_SUBSCRIPTION_ID`
   - `ARM_TENANT_ID`
   - `ARM_CLIENT_ID`
   - `ARM_CLIENT_SECRET`

## Quick Start

### AWS Infrastructure

1. Navigate to the AWS environment:
   ```bash
   cd aws/environments/dev
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Plan the changes:
   ```bash
   terraform plan
   ```

4. Apply the changes:
   ```bash
   terraform apply
   ```

### Azure Infrastructure

1. Navigate to the Azure environment:
   ```bash
   cd azure/environments/dev
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Plan the changes:
   ```bash
   terraform plan
   ```

4. Apply the changes:
   ```bash
   terraform apply
   ```

## Infrastructure Components

### AWS Components
- EKS Cluster
- VPC with public and private subnets
- Node groups for worker nodes
- IAM roles and policies
- Security groups

### Azure Components
- AKS Cluster
- Virtual Network with subnets
- Node pools
- Managed identities
- Network security groups

## Module Usage

### AWS EKS Module
```hcl
module "eks" {
  source = "../../modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id         = var.vpc_id
  subnet_ids     = var.subnet_ids
  node_groups    = var.node_groups
}
```

### Azure AKS Module
```hcl
module "aks" {
  source = "../../modules/aks"

  cluster_name        = var.cluster_name
  location           = var.location
  resource_group_name = var.resource_group_name
  node_count         = var.node_count
  vm_size            = var.vm_size
}
```

## Environment Variables

### AWS Variables
- `cluster_name`: Name of the EKS cluster
- `cluster_version`: Kubernetes version
- `region`: AWS region
- `vpc_cidr`: VPC CIDR block
- `node_groups`: Worker node configurations

### Azure Variables
- `cluster_name`: Name of the AKS cluster
- `location`: Azure region
- `resource_group_name`: Name of the resource group
- `node_count`: Number of nodes in the default node pool
- `vm_size`: Size of the VM for the node pool

## Security Considerations

### AWS
- Use IAM roles for service accounts (IRSA)
- Implement network policies
- Use private subnets for worker nodes
- Enable encryption at rest

### Azure
- Use managed identities
- Implement network policies
- Use private subnets for worker nodes
- Enable encryption at rest

## Cost Optimization

### AWS
- Use spot instances for non-critical workloads
- Implement auto-scaling
- Use reserved instances for production workloads

### Azure
- Use spot instances for non-critical workloads
- Implement auto-scaling
- Use reserved instances for production workloads

## Additional Resources

- [AWS EKS Documentation](https://docs.aws.amazon.com/eks/)
- [Azure AKS Documentation](https://docs.microsoft.com/azure/aks/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
