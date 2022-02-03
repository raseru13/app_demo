
module "resource_group" {
  source = "../terraform/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
  global_settings     = var.global_settings
  tags                = var.tags
  base_tags           = try(var.global_settings.base_tags, null)
}

module "storage" {
  source               = "../terraform/storage"
  global_settings      = var.global_settings
  storage_account_name = var.storage_account_name
  resource_group_name  = module.resource_group.name
  location             = var.location
  tags                 = var.tags
  base_tags            = try(var.global_settings.base_tags, null)
}
# Virtual network
#
module "appservice" {
  source              = "../terraform/app_service"
  appis_name          = var.appis_name
  plan_name           = var.plan_name
  app_service_name    = var.app_service_name
  global_settings     = var.global_settings
  resource_group_name = module.resource_group.name
  location            = var.location
  tags                = var.tags
  base_tags           = try(var.global_settings.base_tags, null)
}