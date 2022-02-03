
# naming convention
resource "azurecaf_name" "rg" {
  name          = var.resource_group_name
  resource_type = "azurerm_resource_group"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_resource_group" "rg" {
  name     = azurecaf_name.rg.result
  location = var.location
  tags     = local.tags
}