resource "azurerm_resource_group" "list_without_loop" {
  count = length (var.resource_group_name) #use length function here
  name     = var.resource_group_name[count.index] #use variable here
  location = "West Europe"
}

#length() ko count ke saath tab use karte hain jab hame 
#dynamically utne resources create karne ho jitne items list me present hain.