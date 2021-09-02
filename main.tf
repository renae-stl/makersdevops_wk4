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

resource "azurerm_container_registry" "acr" {
  name                = "Team2cr"
  resource_group_name = "Team2ResourceGroup2"
  location            = "westeurope"
  admin_enabled       = false
  storage_account_id  = "/subscriptions/f4302618-e61f-48fe-8b0a-ef8f228a102d/resourceGroups/Team2ResourceGroup2/providers/Microsoft.Storage/storageAccounts/makersteam2storage"  
}



