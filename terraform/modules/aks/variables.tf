variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to place AKS in"
}

variable "kubernetes_version" {
  type        = string
  description = "Version of Kubernetes to use in AKS"
}

variable "environment" {
  type        = string
  description = "One of (dev, prod)"
}
