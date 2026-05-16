resource "azurerm_resource_group" "foreach_list" {
  for_each = var.resource_group_name
  name     = each.key
  location = "West Europe"
}

# Requirement:
# Suppose we have a requirement to create multiple Azure Resource Groups dynamically
# and only unique RG names should be allowed.
# In this scenario, set(string) is used because set automatically removes duplicate values.
# Since variable type is already set, no need to use toset() function separately.
# for_each iterates over each unique RG name and creates resources dynamically.



 # Since variable is already a set,
  # no need to use toset()
  # each.key and each.value are same in set


