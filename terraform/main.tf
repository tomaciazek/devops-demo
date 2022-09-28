module "common" {
  source = "./modules/common"
}

resource "azurerm_resource_group" "rg" {
  name     = var.environment
  location = module.common.location_name
}

module "aks" {
  source = "./modules/aks"

  resource_group_name = azurerm_resource_group.rg.name
  kubernetes_version  = "1.23.8"
  environment         = var.environment
}
