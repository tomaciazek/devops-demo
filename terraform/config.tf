terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.24.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "48ede9d0-4af1-43c0-bc59-28b90023eca9"
  tenant_id       = "e825fe7c-d8b7-4a62-9bf0-4caaf34cc728"
}
