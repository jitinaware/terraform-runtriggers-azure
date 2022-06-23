
locals {
  client_id     = data.terraform_remote_state.srcwksp.outputs.tenant_clientid
  client_secret = data.terraform_remote_state.srcwksp.outputs.tenant_clientsecret
  tenantid      = data.terraform_remote_state.srcwksp.outputs.tenant_tenantid
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}

  client_id       = local.client_id
  client_secret   = local.client_secret
  tenant_id       = local.tenantid
  subscription_id = var.az_subscription_id
}

