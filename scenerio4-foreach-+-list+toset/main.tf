resource "azurerm_resource_group" "foreach_list" {
    for_each = toset(var.resource_group_name) #use for_each and toset function here
  name     = each.key
  location = "West Europe"
}

#Scenario 1 — for_each + list(string)
# Requirement

# Suppose we have a requirement to create multiple Azure Resource Groups dynamically using Terraform.
# User/team is providing RG names in a list variable from terraform.tfvars.

# There may be duplicate values in the list.
# So we use:

# list(string) in variable
# toset() in for_each
# to remove duplicates and create only unique Resource Groups.

#list is here that's why we are using toset function to convert list into set.
 # Using for_each to dynamically create multiple Azure Resource Groups

  # for_each iterates over only one collection at a time
  # Here it is iterating over resource_group_name variable
 # for_each doesnt suport multiple variables or complex objects like name, location, tags together
  # Since only RG names are passed in variable,
  # location is kept hardcoded

  # toset() converts list into set
  # Duplicate values are automatically removed
  # Resource will be created only for unique values

  # for_each works best with set or map collections
  # In set of strings, both each.key and each.value return same value

  # Advantage:
  # Better than count for uniquely named resources
  # Avoids index shifting issue
  # Stable resource tracking

  # Drawback:
  # Duplicate values are not supported after conversion to set
  # Complex multiple attributes (name, location, tags) cannot be managed
  # using simple string list collection
