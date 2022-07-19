



variable "az_region" {
  type        = string
  description = "Region"
  default     = "eastus"
}

variable "az_name_prefix" {
  description = "Prefix to prepend all resource names with"
}

variable "az_subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "az_vnet_address_space" {
  default = ["172.25.0.0/16"]
}

variable "az_subnet_cidrs" {
  default = ["172.25.1.0/24"]
}

variable "az_gateway_subnet_cidrs" {
  default = ["172.25.0.0/27"]
}

variable "az_ssh_pubkey" {
  type        = string
  description = "Public key for SSH access"
  default     = ""
}