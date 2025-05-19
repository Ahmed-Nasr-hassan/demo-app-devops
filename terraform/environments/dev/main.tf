terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "demo-app-terraform-state-file-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile   = true
    encrypt        = true
  }
}

module "eks" {
  source = "../../modules/eks"

  aws_region      = var.aws_region
  environment     = var.environment
  project_name    = var.project_name
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  node_groups     = var.node_groups
} 