# wp-for-everyone
## Terraform located in /scripts
## Wordpress for Everyone located in /src

# How to create your own instance
## Setup Azure
- Create an Azure Resource Group in your subscription
- Create a blob storage in its own resource group and add a container to it.    This is used for terraform state.

## Create service account
- az login
- az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your-subscription"
  - Remember this information, it's needed later.

## Setup site
- Download source code
- cd /scripts
- Update variables.tf with your information (app_name and resource_group_name)
- Update container-registry.tf "name" to your own
- Update asp.tf with your information   (all of this could of been done in variables.tf...)
  - asp "name"
  - docker_login "command"
  - docker_push "command"
  - azurem_app_service.asp "linux_fx_version"
- Update backend.tf with your storage account information
- terraform init  (you may need to delete the backend.tf if you don't have a storage location)
- terraform apply -var="client_id=000000000000000000" -var="client_secret=000000000000000000" -var="subscription_id=000000000000000000" -var="tenant_id=000000000000000000"
  - use the information you got in the service account creation step here

That's it.
- 
