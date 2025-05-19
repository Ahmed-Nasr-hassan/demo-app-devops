# GitHub Actions Workflows

This directory contains the GitHub Actions workflows for our CI/CD pipeline.

## Workflows Overview

### Docker Build and Push (ci-docker-build-push.yml)

This workflow handles the building and pushing of Docker images, as well as updating the Kubernetes deployment configuration.

**Triggers:**
- Push to main branch
- Pull requests to main branch
- Changes in the `Microservices/` directory

**Steps:**
1. **Checkout Code**: Retrieves the latest code from the repository
2. **Setup Docker Buildx**: Configures Docker Buildx for multi-platform builds
3. **DockerHub Login**: Authenticates with DockerHub using repository secrets
4. **Get Commit Hash**: Captures the short commit hash for image tagging
5. **Build and Push**: 
   - Builds the Docker image
   - Tags with both `latest` and commit hash
   - Pushes to DockerHub
   - Uses build cache for faster builds
6. **Update Kubernetes Deployment**:
   - Updates the image tag in `k8s-yaml/deployment.yaml`
   - Commits and pushes the updated deployment file (only on main branch)

**Required Secrets:**
- `DOCKERHUB_USERNAME`: DockerHub username
- `DOCKERHUB_TOKEN`: DockerHub access token
- `GH_PAT`: GitHub Personal Access Token with repo scope

### Terraform (terraform.yml)

This workflow manages our infrastructure using Terraform.

**Triggers:**
- Push to main branch
- Pull requests to main branch
- Changes in the `terraform/` directory

**Steps:**
1. **Checkout Code**: Retrieves the latest code
2. **Setup Terraform**: Configures Terraform with specified version
3. **AWS Credentials**: Configures AWS credentials
4. **Format**: Checks Terraform code formatting
5. **Init**: Initializes Terraform working directory
6. **Validate**: Validates Terraform configuration
7. **Plan**: Creates execution plan (on pull requests)
8. **Apply**: Applies changes (on main branch)

**Required Secrets:**
- `AWS_ACCESS_KEY_ID`: AWS access key
- `AWS_SECRET_ACCESS_KEY`: AWS secret key



