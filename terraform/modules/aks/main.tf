module "common" {
  source = "../common"
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${module.common.app_name}-${var.environment}-cluster"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${module.common.app_name}-${var.environment}-aks"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "agentpool"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = var.environment
    purpose     = "Echo cluster"
  }
}

data "azurerm_container_registry" "acr" {
  name                = module.common.acr_name
  resource_group_name = module.common.common_resource_group_name
}


# Equivalent of `az aks update --attach-acr`
resource "azurerm_role_assignment" "aks_acrpull" {
  scope                = data.azurerm_container_registry.acr.id
  role_definition_name = "acrpull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
