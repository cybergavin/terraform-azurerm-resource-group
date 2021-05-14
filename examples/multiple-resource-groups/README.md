This example creates 2 resource groups with their names, locations and tags and applies global tags too.

### main.tf
```
module "resource-group" {
  source  = "cybergavin/resource-group/azurerm"
  version = "2.1.0"
  resource_groups = var.resource_groups
  global_tags     = var.global_tags
}
```
---
### variables.tf
```
variable "resource_groups" {
  type        = map(any)
  description = "(Required) A list of Azure Resource Groups with locations and tags"
}
variable "global_tags" {
  type        = map(any)
  description = "(Optional) A map of tags to be applied globally on all Azure resource groups"
  default     = {}
}
```
---
### terraform.tfvars
```
global_tags = {
  Provisioner  = "Terraform"
}
resource_groups = {
  my-linux-rg = {
    location   = "canadacentral",
    tags       = {
      Owner      = "cybergavin",
      CostCenter = "C8888",
      Description = "Linux Infrastructure"} }

  my-windows-rg = {
    location   = "canadacentral",
    tags       = {
      Owner      = "cybergavin",
      CostCenter = "C9999",
      Description = "Windows Infrastructure"} }
}
```
