variable "location" {
    default = "East US"
}

variable resource_group_name {
    default = "hackday-summer-2021"
}

variable admin_username {
  default = "linux_admin"
}

variable app_name {
    default = "wordpress-for-everyone"
}

variable app_service_plan_name {
    default = "hackdaysummer2021"
}

variable container_registry_name {
    default = "hackdaysummer2021"
}

variable client_id {
    sensitive = true
}

variable client_secret {
    sensitive = true
}

variable subscription_id {
    sensitive = true
}

variable tenant_id {
    sensitive = true
}