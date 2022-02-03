# naming convention
resource "azurecaf_name" "stg" {
  name          = var.storage_account_name
  resource_type = "azurerm_storage_account"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}
# Create storage account
resource "azurerm_storage_account" "storage" {
  name                     = azurecaf_name.stg.result
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}

## Create storage account container
resource "azurerm_storage_container" "storage_container" {
  name                  = "app-container"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}