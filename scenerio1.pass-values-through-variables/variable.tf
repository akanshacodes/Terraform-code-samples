variable "resource_group_name" { #declare variable here
  description = "The name of the resource group"
  type        = string
  default     = "akansha-resource-group"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "eastus"
}