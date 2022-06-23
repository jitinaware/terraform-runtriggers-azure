# Output the newly created Service Principal and password
output "tenant_clientid" {
  value     = azuread_application.tenantapp.application_id
  sensitive = false
}

output "tenant_clientsecret" {
  value     = azuread_service_principal_password.tenantsppwd.value
  sensitive = true
}

output "tenant_tenantid" {
  value     = azuread_service_principal.tenantsp.application_tenant_id
  sensitive = false
}