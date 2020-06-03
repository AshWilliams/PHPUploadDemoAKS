output "acr_server" {
  value = "${azurerm_container_registry.acr01.login_server}"
}

output "acr_user" {
  value = "${azurerm_container_registry.acr01.admin_username}"
}

output "acr_pass" {
  value = "${azurerm_container_registry.acr01.admin_password}"
}