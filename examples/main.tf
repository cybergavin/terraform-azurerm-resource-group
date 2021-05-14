module "resource-group" {
  source  = "cybergavin/rg/azurerm"
  version = "1.0.0"
  resource_groups = var.resource_groups
  global_tags     = var.global_tags
}
