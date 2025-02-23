data "azuread_group" "example" {
  display_name     = var.admin
  security_enabled = true
}