# GitHub Actions Workflows

This directory contains GitHub Actions workflows for CI/CD automation of our infrastructure and application deployment.

## Workflows

### 1. CI Pipeline (`ci-docker-build-push.yml`)

Manages the building and pushing of Docker images to DockerHub.

#### Triggers
- Push to `main` branch
- Only when changes are made in the `Microservices/` directory

#### Workflow Steps
1. **Checkout**: Clones the repository
2. **Docker Setup**: Configures Docker Buildx
3. **DockerHub Login**: Authenticates with DockerHub
4. **Build and Push**: Builds and pushes the Docker image

#### Required Secrets
- `DOCKERHUB_USERNAME`: DockerHub username
- `DOCKERHUB_TOKEN`: DockerHub access token

### 2. Terraform Infrastructure Management (`terraform.yml`)

Manages the deployment and updates of our AWS infrastructure using Terraform.

#### Triggers
- Push to `main` branch
- Pull requests to `main` branch
- Only when changes are made in the `terraform/` directory

#### Workflow Steps
1. **Checkout**: Clones the repository
2. **Setup Terraform**: Installs Terraform 1.5.0
3. **AWS Credentials**: Configures AWS access using secrets
4. **Terraform Format**: Checks code formatting
5. **Terraform Init**: Initializes Terraform
6. **Terraform Validate**: Validates the configuration
7. **Terraform Plan**: Creates execution plan (on PRs)
8. **PR Update**: Posts plan results as PR comment
9. **Terraform Apply**: Applies changes (on main branch) #commented to avoid unexpected costs

#### Required Secrets
- `AWS_ACCESS_KEY_ID`: AWS access key
- `AWS_SECRET_ACCESS_KEY`: AWS secret key
- `GITHUB_TOKEN`: Automatically provided by GitHub

#### Environment Variables
- `TF_WORKSPACE`: Set to "dev"
- `TF_VAR_environment`: Set to "dev"




