variable "appis_name" {
  description = ""
  type        = string
}
variable "plan_name" {
  description = ""
  type        = string
}
variable "app_service_name" {
  description = ""
  type        = string
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = ""
  type        = string
}
variable "tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = map(any)
}

variable "base_tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = map(any)
}
variable "global_settings" {
  description = "Global settings object (see module README.md)"
}