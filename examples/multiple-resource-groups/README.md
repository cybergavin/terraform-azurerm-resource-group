This example creates 2 resource groups with their names, locations and tags and applies global tags too.

### main.tf
```
terraform {
  required_version = ">= 0.15"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.58.0"
    }
  }
}
provider "azurerm" {
  features {}
}
module "resource-group" {
  source  = "cybergavin/resource-group/azurerm"
  version = "2.2.0"
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
---
### terraform.plan
```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.resource-group.azurerm_resource_group.rg["my-linux-rg"] will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "canadacentral"
      + name     = "my-linux-rg"
      + tags     = {
          + "CostCenter"  = "C8888"
          + "Description" = "Linux Infrastructure"
          + "Owner"       = "cybergavin"
          + "Provisioner" = "Terraform"
        }
    }

  # module.resource-group.azurerm_resource_group.rg["my-windows-rg"] will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "canadacentral"
      + name     = "my-windows-rg"
      + tags     = {
          + "CostCenter"  = "C9999"
          + "Description" = "Windows Infrastructure"
          + "Owner"       = "cybergavin"
          + "Provisioner" = "Terraform"
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.
```
