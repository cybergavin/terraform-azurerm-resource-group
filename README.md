### terraform-azurerm-resource-group
Create one or more Azure resource groups

- Allows the creation of one or more Azure resource groups with different names, locations and tags.
- Reads input data from the variable `resource_groups` (a map of resource groups).
- Each resource group is represented by a map with attributes name, location and tags.
- Within each resource group map, a tag is represented as another map, wherein you may add/modify/delete any number of tags.
- In order to apply the same tags across multiple resource groups, use the `global_tags` variable to store such common tags in a map.

### Example:

Refer examples folder
