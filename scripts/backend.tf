# Sets the "backend" used to store Terraform state.
# This is required to make continous delivery work.

terraform {
    backend "azurerm" {
        resource_group_name  = "hackday-tf"
        storage_account_name = "hackdaytf"
        container_name       = "tf-state"
        key                  = "terraform.tfstate"
    }
}