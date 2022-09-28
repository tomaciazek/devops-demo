output "app_name" {
  value       = local.app_name
  description = "Name of the application"
}

output "common_prefix" {
  value       = local.common_prefix
  description = "A prefix for naming all resources that require a globally unique name"
}

output "location_name" {
  value       = local.location_name
  description = "Name of the location where all resources are deployed"
}

output "common_resource_group_name" {
  value       = local.common_resource_group_name
  description = "Name of the resource group where common resources are deployed"
}

output "acr_name" {
  value       = local.acr_name
  description = "Name of the shared Azure Container Registry"
}
