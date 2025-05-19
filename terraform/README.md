# Terraform EKS Infrastructure

This directory contains Terraform configurations for deploying and managing an EKS cluster infrastructure on AWS.

## Directory Structure

```
terraform/
├── modules/
│   └── eks/                    # EKS module
│       ├── main.tf            # Main EKS and VPC configuration
│       ├── variables.tf       # Module variables
│       └── outputs.tf         # Module outputs
├── environments/
│   └── dev/                   # Development environment
│       ├── main.tf           # Environment-specific configuration
│       └── terraform.tfvars  # Environment variables
├── providers.tf              # Provider configurations
└── variables.tf             # Global variables
```

## Infrastructure Components

- **VPC**: Custom VPC with public and private subnets across 3 AZs
- **EKS Cluster**: Managed Kubernetes cluster
- **Node Groups**: Managed node groups with auto-scaling capabilities
- **Networking**: NAT Gateway for private subnet internet access
- **Security**: Proper security groups and IAM roles

## Prerequisites

1. AWS CLI configured with appropriate credentials
2. Terraform >= 1.0.0
3. S3 bucket for Terraform state
4. DynamoDB table for state locking

## Setup

1. Create S3 bucket for state:
```bash
aws s3api create-bucket --bucket demo-app-terraform-state --region us-east-1
```

2. Create DynamoDB table for state locking:
```bash
aws dynamodb create-table \
    --table-name demo-app-terraform-locks \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
```

## Usage

1. Initialize Terraform:
```bash
cd environments/dev
terraform init
```

2. Plan the changes:
```bash
terraform plan
```

3. Apply the changes:
```bash
terraform apply
```

## CI/CD Pipeline

The infrastructure is managed through GitHub Actions workflows that:
- Run `terraform plan` on pull requests
- Run `terraform apply` on merges to main branch
- Use remote state in S3
- Implement state locking with DynamoDB

## Variables

Key variables can be configured in `environments/dev/terraform.tfvars`:
- `aws_region`: AWS region for deployment
- `environment`: Environment name (dev, staging, prod)
- `cluster_name`: EKS cluster name
- `cluster_version`: Kubernetes version
- `node_groups`: Node group configurations

## Security

- State file is encrypted in S3
- State locking prevents concurrent modifications
- Private subnets for worker nodes
- Public subnets only for load balancers
- Proper IAM roles and policies

## Maintenance

- Regular updates of Terraform modules
- Monitoring of node group scaling
- Regular security group reviews
- Cost optimization through node group configurations 