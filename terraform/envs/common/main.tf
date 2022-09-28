module "common" {
  source = "../../modules/common"
}

resource "azurerm_container_registry" "acr" {
  name                = module.common.acr_name
  location            = module.common.location_name
  resource_group_name = module.common.common_resource_group_name
  sku                 = "Standard"
}
