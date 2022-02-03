resource "azurecaf_name" "appis" {
  name          = var.appis_name
  resource_type = "azurerm_application_insights"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurecaf_name" "plan" {
  name          = var.plan_name
  resource_type = "azurerm_app_service_plan"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurecaf_name" "app_service" {
  name          = var.app_service_name
  resource_type = "azurerm_app_service"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

# Create app service plan
resource "azurerm_app_service_plan" "plan" {
  name                = azurecaf_name.plan.result
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Windows"

  sku {
    tier = "Basic"
    size = "B1"
  }

  tags = local.tags
}

# Create application insights
resource "azurerm_application_insights" "appinsights" {
  name                = azurecaf_name.appis.result
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"

  tags = local.tags
}

# Create app service
resource "azurerm_app_service" "webapp" {
  name                = azurecaf_name.app_service.result
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  tags = local.tags

  site_config {
    always_on                = true
    dotnet_framework_version = "v5.0"
    app_command_line         = "dotnet EventManagement.Web.dll"
  }

  app_settings = {
    # "EVENT_CONTAINER"                     = azurerm_storage_container.storage_container.name
    # "RANDOM_KEY"                          = "random_value"
    # "NESTED__VARIABLE"                    = "<variable>"
    # "WEBSITE_RUN_FROM_PACKAGE"            = 1
    "APPINSIGHTS_INSTRUMENTATIONKEY"      = azurerm_application_insights.appinsights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.appinsights.connection_string
  }

  # connection_string {
  #   name  = "StorageAccount"
  #   type  = "Custom"
  #   value = azurerm_storage_account.storage.primary_connection_string
  # }
}