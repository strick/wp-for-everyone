resource "azurerm_app_service_plan" "asp" {
 name                   = "hackdaysummer2021"
 location               = var.location
 resource_group_name    = var.resource_group_name
 kind                   = "Linux"
 reserved               = true

 sku {
   tier     = "Basic"
   size     = "F1"
 }
}

resource "azurerm_app_service" "asp" {

  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = "${azurerm_app_service_plan.asp.id}"

  site_config {
    app_command_line = ""
    use_32_bit_worker_process = "true"
    linux_fx_version = "DOCKER|wordpress"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false",
  }
  
}