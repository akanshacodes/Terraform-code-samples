resource "azurerm_resource_group" "foreach_map" {  
    for_each = {
        "rg-dev-payment-we-01"     = "West Europe",
        "rg-test-payment-ne-01"    = "North Europe",
        "rg-stage-banking-eus-01"  = "East US",
        "rg-prod-banking-cus-01"   = "Central US",
        "rg-prod-security-ne-01"   = "North Europe"
    }
    name     = each.key
    location = each.value
}

# ---------------------- LIMITATION ----------------------

# In this map structure, we are only storing:
# name -> location

# So we can dynamically change:
# - Resource Group Name
# - Location

# But if we want to manage additional properties like:
# - tags
# - environment
# - owner
# - project name

# then this simple map structure becomes limited.

# Example:
# We cannot assign different tags dynamically
# using only key-value pair mapping.

# Because:
# key   = name
# value = location

# No extra attributes are available here.

# For advanced configurations,
# object or map of objects is preferred.

# To solve this limitation, Nested Map (Map of Objects)
# is used in Terraform.