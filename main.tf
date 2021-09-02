provider "azurerm" {
  features {}
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }

    backend "azurerm" {
        resource_group_name  = "Team2ResourceGroup2"
        storage_account_name = "makersteam2storage"
        container_name       = "makersteam2container"
        key                  = "terraform.tfstate"
    }

  resource "azurerm_container_registry" "acr" {
    name                = "Team2cr"
    resource_group_name = "Team2ResourceGroup2"
    location            = "westeurope"
    admin_enabled       = false
    georeplications = [
      {
        location                = "West Europe"
        zone_redundancy_enabled = true
        tags                    = {}
      },
      {
        location                = "westeurope"
        zone_redundancy_enabled = true
        tags                    = {}
    }]
  }
  
}    



