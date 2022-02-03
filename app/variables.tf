
variable "client_config" {
  default = {}
}

# Global settings
variable "global_settings" {
  description = "Global settings object for the current deployment."
  default = {
    passthrough    = false
    random_length  = 4
    default_region = "region1"
    prefixes       = ["caf"]
    use_slug       = true
    base_tags = {
      Orchestrator = "Terraform"
      Owner        = "caf"
      CostCenter   = "caf"
      Project      = "caf"
    }
    regions = {
      region1 = "westeurope"
      region2 = "northeurope"
    }
  }
}

variable "resource_group_name" {
  type    = string
  default = "kpdemo"
}
variable "storage_account_name" {
  type    = string
  default = "kpdemo"
}
variable "location" {
  type    = string
  default = "westeurope"
}

#App variables
variable "appis_name" {
  type    = string
  default = "kpdemoappis"
}
variable "plan_name" {
  type    = string
  default = "kpdemoplan"
}
variable "app_service_name" {
  type    = string
  default = "kpdemoappsvc"
}
variable "tags" {
  description = "Tags to be used for this resource deployment."
  type        = map(any)
  default = {
    ProductID = "app-demo"
    Owner     = "caf"
  }
}
