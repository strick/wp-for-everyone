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