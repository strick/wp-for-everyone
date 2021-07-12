 variable "asp_id" {}
 variable "app_name" {}
 variable "location" {}
 variable "resource_group_name" {}
 
 resource "azurerm_app_service" "webapp" {
    name                = var.app_name
    location            = var.location
    resource_group_name = var.resource_group_name
    app_service_plan_id = "${var.asp_id}"
    

    site_config {
        app_command_line = ""
        use_32_bit_worker_process = "true"
        linux_fx_version = "DOCKER|wordpress"
    }

    app_settings = {
        "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false",
    }
 }