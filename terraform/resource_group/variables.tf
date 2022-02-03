variable "global_settings" {
  description = "Global settings object (see module README.md)"
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group where to create the resource."
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
variable "location" {
  description = "(Required) Specifies the Azure location to deploy the resource. Changing this forces a new resource to be created."
  type        = string
}