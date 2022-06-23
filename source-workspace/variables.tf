

variable "az_client_id" {
  type        = string
  description = "Azure Client ID"
  sensitive   = true
}

variable "az_client_secret" {
  type        = string
  description = "Azure Client Secret"
  sensitive   = true
}

variable "az_tenant_id" {
  type        = string
  description = "Azure Tenant ID"
  sensitive   = true
}

variable "az_subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  sensitive   = true
}

variable "az_appspdisplayname" {
  type = string
  description = "The display name for the new Azure App Registration/Service Principal"
}

variable "az_sprole" {
  type = string
  description = "Role assignment for the newly created Service Principal (must be equivalent to Contributor + have ability to RW roles)"
}
