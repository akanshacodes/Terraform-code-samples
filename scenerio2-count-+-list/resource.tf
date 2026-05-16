resource "azurerm_resource_group" "list_without_loop" {
  count = 5 #Creates 5 copies of the resource block
  name     = var.resource_group_name[count.index] #use variable here
  location = "West Europe"
}

# ---------------------- LIMITATION OF COUNT ----------------------

# In this example, only the resource names are dynamic.
# The location is hardcoded, so every Resource Group
# will be created in the same location.

# Example:
# rg1 -> West Europe
# rg2 -> West Europe
# rg3 -> West Europe

# If different locations are required for each resource,
# count becomes difficult to manage because it only works
# properly with index-based lists.

# Example Problem:
# name list:
# [ "rg1", "rg2", "rg3" ]

# location list:
# [ "West Europe", "Central India", "East US" ]

# Both lists must always maintain the same order.
# If order changes, wrong mapping can happen.

# ---------------------- DRAWBACK OF COUNT ----------------------

# count uses index-based tracking.
# Terraform identifies resources using indexes, not names.

# Initial Mapping:
# 0 -> rg1
# 1 -> rg2
# 2 -> rg3

# If rg2 is removed:
# [ "rg1", "rg3" ]

# New Mapping:
# 0 -> rg1
# 1 -> rg3

# Terraform thinks:
# index 1 changed from rg2 -> rg3

# Result:
# - rg2 gets destroyed
# - rg3 gets recreated

# This is called:
# "Index Shift Problem"

# ---------------------- WHEN COUNT IS GOOD ----------------------

# Use count when:
# - Fixed number of resources are needed
# - Resources are almost identical
# - Same configuration is used everywhere
# - Order/index does not matter

# Example:
# - 3 identical VMs
# - 5 similar Resource Groups
# - Same location resources

# ---------------------- BETTER ALTERNATIVE ----------------------

# for_each is better in production because:
# - It uses key-based tracking
# - No index shifting problem
# - Supports unique values properly
# - Easier to manage different configurations