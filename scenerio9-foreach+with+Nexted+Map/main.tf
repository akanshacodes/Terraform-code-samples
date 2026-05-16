resource "azurerm_resource_group" "nexted_map" {  
    for_each = var.resource_group_details
    name     = each.value.name
    location = each.value.location
}