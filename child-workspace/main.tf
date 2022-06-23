


resource "azurerm_resource_group" "resource_group" {
  name     = var.az_rg_name
  location = var.az_region
}