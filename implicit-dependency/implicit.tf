resource "azurerm_resource_group" "implicit_dependency" {
  name     = "implicit-dependency"
  location = "West Europe"
}

resource "azurerm_storage_account" "implicit_dependency" {
  name                     = "implicitdependency"
  resource_group_name      = azurerm_resource_group.implicit_dependency.name # This is the implicit dependency on the resource group
  location                 = azurerm_resource_group.implicit_dependency.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}