resource "azurerm_resource_group" "foreach_list" {
    for_each = toset(["sona-rg1", "sona-rg2", "sona-rg3", "sona-rg4", "sona-rg5"]) #use for_each and toset function here
  name     = each.key
  location = "West Europe"
}
# In this example, resource names are written directly inside the code.
# This is called hardcoded values.

# Example:
# toset(["sona-rg1", "sona-rg2", "sona-rg3"])

# Instead of hardcoding, we can also use variables.

# Example:
# for_each = toset(var.resource_group_name)

# Benefit of using variables:
# - Code becomes reusable
# - Easy to manage large data
# - No need to modify main.tf again and again
# - Better for production environments
# - Supports dynamic inputs

# Benefit of for_each:
# - Uses key-based tracking
# - No index shifting problem
# - Only changed resource gets modified
# - Prevents unnecessary destroy/recreate

# Benefit of toset():
# - Removes duplicate values automatically
# - Converts list into supported datatype for for_each

# Best Practice:
# Use variable + for_each + toset together
# for clean, scalable, and production-ready code.