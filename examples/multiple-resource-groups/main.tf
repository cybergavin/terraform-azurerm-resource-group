module "resource-group" {
  source  = "cybergavin/resource-group/azurerm"
  version = "1.3.0"
  resource_groups = var.resource_groups
  global_tags     = var.global_tags
}
