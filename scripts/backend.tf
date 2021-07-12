# Sets the "backend" used to store Terraform state.
# This is required to make continous delivery work.

terraform {
    backend "azurerm" {
        resource_group_name  = "hackday-summer-2021"
        storage_account_name = "hackdaysummer2021tf2"
        container_name       = "tf-state"
        key                  = "terraform.tfstate"
    }
}