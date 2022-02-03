
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.81.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~> 1.2.0"
    }
    null = {
      source = "hashicorp/null"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {
  }
}

data "azurerm_subscription" "primary" {}
data "azurerm_client_config" "current" {}
