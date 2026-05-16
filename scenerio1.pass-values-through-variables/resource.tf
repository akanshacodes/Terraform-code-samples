resource "azurerm_resource_group" "example" { #use variable here
  name     = var.resource_group_name
  location = var.location
}

