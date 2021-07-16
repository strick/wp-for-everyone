resource "azurerm_container_registry" "container_registry" {

  depends_on = [azurerm_resource_group.rg]
  
    name = var.container_registry_name
    resource_group_name = var.resource_group_name

    location = var.location
    admin_enabled = true
    sku = "Basic"

}

output "registry_hostname" {
  value = azurerm_container_registry.container_registry.login_server
}

output "registry_un" {
  value = azurerm_container_registry.container_registry.admin_username
}

output "registry_pw" {
  value = azurerm_container_registry.container_registry.admin_password
  sensitive = true
}