terraform {
  backend "azurerm" {
    resource_group_name  = "common"
    storage_account_name = "tomaciazeksacommon"
    container_name       = "terraform-state"
    key                  = "dev.terraform.tfstate"
  }
}
