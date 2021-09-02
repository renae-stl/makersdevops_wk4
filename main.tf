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
  sku                 = "Premium"

}

resource "azurerm_app_service_plan" "main" {
  name                = "team2sp"
  location            = "westeurope"
  resource_group_name = "Team2ResourceGroup2"
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "team2appservice"
  location            = azurerm_app_service_plan.main.location
  resource_group_name = "Team2ResourceGroup2"
  app_service_plan_id = azurerm_app_service_plan.main.id

  site_config {
    linux_fx_version = "NODE|10.14"
  }

}



