variable "storage_account_name" {
  description = "(Required) The name of the storage account."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The id of the AzureBastionSubnet in which to create the bastion host."
  type        = string
}
variable "location" {
  description = "(Required) Specifies the Azure location to deploy the resource. Changing this forces a new resource to be created."
  type        = string
}
variable "tags" {
  description = "(Required) map of tags for the deployment"
}
variable "base_tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = map(any)
}
variable "global_settings" {
  description = "Global settings object (see module README.md)"
}