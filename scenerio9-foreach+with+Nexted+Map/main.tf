resource "azurerm_resource_group" "nexted_map" {  
    for_each = var.resource_group_details
    name     = each.value.name
    location = each.value.location
}

  # ==========================================
  # for_each with Nested Map(Object)
  # ==========================================

  # resource_group_details -> variable name

  # Ye nested map(object) concept hai
  # Means:
  # Map ke andar multiple objects store kiye gaye hai

  # Example:
  #
  # rg1 = {
  #   name     = "rg-dev-payment-we-01"
  #   location = "West Europe"
  # }

  # Yaha:
  # rg1 -> key
  # name, location -> values/attributes

  # for_each har map object ko one by one iterate karta hai

  # each.key -> current key
  # Example:
  # each.key = "rg1"

  # each.value -> current object values
  # Example:
  # each.value.name     = "rg-dev-payment-we-01"
  # each.value.location = "West Europe"

  # Ye concept tab use hota hai
  # jab har resource ki multiple values ho

  # Example:
  # Different name
  # Different location
  # Different tags
  # Different sku

  # Simple list/set sirf single values store kar sakta hai
  # Isliye yaha nested map(object) use kiya

  # Advantage:
  # Easy to manage multiple values dynamically
  # Better readable and scalable Terraform code

