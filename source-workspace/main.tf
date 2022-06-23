

data "azuread_client_config" "current" {}

resource "time_rotating" "defaultrotation" {
  rotation_days = 30
}

resource "azuread_application" "tenantapp" {
  display_name = "${var.az_appspdisplayname}"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "tenantsp" {
  application_id               = azuread_application.tenantapp.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal_password" "tenantsppwd" {
  service_principal_id = azuread_service_principal.tenantsp.object_id
  rotate_when_changed = {
    rotation = time_rotating.defaultrotation.id
  }
}

resource "azurerm_role_assignment" "tenantra" {
  scope                = "/subscriptions/${var.az_subscription_id}"
  role_definition_name = "${var.az_sprole}"
  principal_id         = azuread_service_principal.tenantsp.object_id
}