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
}
resource "azurerm_resource_group" "rg-hello-azure" {
  name     = "rg-hello-azure"
  location = "westeurope"
}    


