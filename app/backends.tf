terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-dev-rg"
    storage_account_name = "kktfstatedevstg"
    container_name       = "akstfstatefiles"
    key                  = "appservice.tfstate"
  }
}