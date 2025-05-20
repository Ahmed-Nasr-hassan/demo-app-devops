location            = "eastus"
resource_group_name = "demo-app-dev-rg"
cluster_name        = "demo-app-dev-aks"
node_count         = 2
vm_size            = "Standard_D2s_v3"

tags = {
  Environment = "dev"
  Project     = "demo-app"
  ManagedBy   = "terraform"
} 