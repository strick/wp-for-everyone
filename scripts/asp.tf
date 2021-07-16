resource "azurerm_app_service_plan" "asp" {

  depends_on = [ azurerm_resource_group.rg ]

 name                   = var.app_service_plan_name
 location               = var.location
 resource_group_name    = var.resource_group_name
 kind                   = "Linux"
 reserved               = true

 sku {
   tier     = "Basic"
   size     = "F1"
 }
}

resource "null_resource" "docker_login" {

  depends_on = [ azurerm_container_registry.container_registry ]

    triggers = {
        always_run = timestamp()
    }

    provisioner "local-exec" {
        command = "az acr login -n ${var.container_registry_name}"
    }
}

resource "null_resource" "docker_push" {

  depends_on = [ null_resource.docker_login ]

    triggers = {
        always_run = timestamp()
    }

    provisioner "local-exec" {
        command = "docker push ${azurerm_container_registry.container_registry.login_server}/hackdaysummer2021:latest"
    }
}

resource "azurerm_app_service" "asp" {

  depends_on = [ null_resource.docker_push ]

  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = "${azurerm_app_service_plan.asp.id}"

  site_config {
    app_command_line = ""
    use_32_bit_worker_process = "true"
    linux_fx_version = "DOCKER|${azurerm_container_registry.container_registry.login_server}/hackdaysummer2021:latest"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false",
    "DOCKER_REGISTRY_SERVER_USERNAME" = azurerm_container_registry.container_registry.admin_username,
    "DOCKER_REGISTRY_SERVER_URL" = azurerm_container_registry.container_registry.login_server,
    "DOCKER_REGISTRY_SERVER_PASSWORD" = azurerm_container_registry.container_registry.admin_password
  }
}