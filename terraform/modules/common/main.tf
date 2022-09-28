locals {
  app_name                   = "echo"
  common_prefix              = "tomaciazek"
  location_name              = "North Europe"
  common_resource_group_name = "common"
  acr_name                   = "${local.common_prefix}${local.app_name}"
}
