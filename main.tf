resource "azurerm_resource_group" "rg" {
  for_each    = var.resource_groups

    name      = each.key
    location  = each.value.location
    tags      = lookup(each.value,"tags",null) == null ? var.global_tags : merge(var.global_tags,each.value.tags)
}