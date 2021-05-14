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
