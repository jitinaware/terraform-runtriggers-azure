



variable "az_region" {
  type        = string
  description = "Region"
  default     = "eastus"
}

variable "az_rg_name" {
  default = "tenantrg"
}

variable "az_subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}
