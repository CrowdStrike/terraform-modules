resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "${var.alias}-${var.cluster_name}"
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = var.alias

  kubernetes_version  = var.kubernetes_version # 1.23.12, 1.22.11, 1.22.15, 1.23.8, 1.24.3, 1.24.6, 1.25.2 (preview) 

  default_node_pool {
    enable_auto_scaling = true
    name                 = "povnodepool"
    node_count           = var.aks_num_nodes
    min_count            = var.aks_min_nodes
    max_count            = var.aks_max_nodes
    vm_size              = var.node_vm_size
    os_sku               = var.os_sku
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.alias
  }
}