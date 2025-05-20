module "aks" {
  source = "../../modules/aks"

  location            = var.location
  resource_group_name = var.resource_group_name
  cluster_name        = var.cluster_name
  node_count         = var.node_count
  vm_size            = var.vm_size
  tags               = var.tags
} 