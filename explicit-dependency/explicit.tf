resource "azurerm_resource_group" "explicit_dependency" {
  name     = "explicit-dependency"
  location = "West Europe"
}

resource "azurerm_storage_account" "explicit_dependency" {
    depends_on = [azurerm_resource_group.explicit_dependency] # This is the explicit dependency on the resource group
  name                     = "explicitdependenc01"
  resource_group_name      = "explicit-dependency"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}