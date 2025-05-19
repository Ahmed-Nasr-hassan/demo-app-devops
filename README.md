# Demo App DevOps

This repository contains a demo application with a complete DevOps setup, including Docker containerization, Kubernetes deployment, and infrastructure as code using Terraform.

## Project Structure

```
.
├── Microservices/          # Application source code
├── k8s-yaml/              # Kubernetes manifests
│   └── deployment.yaml    # Kubernetes deployment configuration
│   └── service.yaml       # Kubernetes service configuration
├── terraform/             # Terraform infrastructure code
│   ├── modules/          # Reusable Terraform modules
│   │   └── eks/         # EKS cluster module
│   └── environments/     # Environment-specific configurations
│       └── dev/         # Development environment
└── .github/
    └── workflows/        # GitHub Actions workflows
        ├── docker-build-push.yml  # Docker build and push workflow
        └── terraform.yml         # Terraform workflow
```

## CI/CD Pipeline

### Docker Build and Push Pipeline

The Docker build pipeline (`docker-build-push.yml`) is triggered on:
- Push to main branch
- Pull requests to main branch
- Changes in the `Microservices/` directory

The pipeline:
1. Builds the Docker image
2. Tags it with both `latest` and the commit short hash
3. Pushes to DockerHub
4. Updates the Kubernetes deployment file with the new image tag
5. Commits and pushes the updated deployment file (only on main branch)

### Terraform Pipeline

The Terraform pipeline (`terraform.yml`) is triggered on:
- Push to main branch
- Pull requests to main branch
- Changes in the `terraform/` directory

The pipeline:
1. Formats and validates Terraform code
2. Plans changes on pull requests
3. Applies changes on main branch pushes

## Prerequisites

1. DockerHub account with:
   - `DOCKERHUB_USERNAME` secret
   - `DOCKERHUB_TOKEN` secret

2. AWS account with:
   - `AWS_ACCESS_KEY_ID` secret
   - `AWS_SECRET_ACCESS_KEY` secret

3. GitHub repository with:
   - Actions permissions enabled
   - Repository secrets configured

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd demo-app-devops
   ```

2. Set up required secrets in GitHub repository settings:
   - `DOCKERHUB_USERNAME`
   - `DOCKERHUB_TOKEN`
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`

3. Make changes to the application code in `Microservices/`

4. Create a pull request or push to main branch to trigger the pipelines

## Infrastructure

The infrastructure is managed using Terraform and includes:
- EKS cluster
- VPC with public and private subnets
- Node groups for worker nodes
- IAM roles and policies

See the `terraform/README.md` for detailed infrastructure documentation.
