# wp-for-everyone

# How to create your own instance
## Setup Azure
- Create an Azure Resource Group in your subscription
- Create a blob storage in its own resource group and add a container to it.    This is used for terraform state.

## Create service account
- az login
- az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your-subscription"
  - Remember this information, it's needed later.

## Deploy your instance
- Download source code
- cd /scripts
- Update variables.tf with your information (app_name and resource_group_name)
- Update container-registry.tf "name" to your own  
  - ***WARNING:  This will incur a $0.17 charge per day***
- Update asp.tf with your information   (all of this could of been done in variables.tf...)
  - asp "name"
  - docker_login "command"
  - docker_push "command"
  - azurem_app_service.asp "linux_fx_version"
- Update backend.tf with your storage account information
- terraform init  
- terraform apply -var="client_id=000000000000000000" -var="client_secret=000000000000000000" -var="subscription_id=000000000000000000" -var="tenant_id=000000000000000000"
  - use the information you got in the service account creation step here

That's it, you'll then have a site named app_name.azurewebsites.net that can auto generate wordpress sites!

## Terraform located in /scripts
## Wordpress for Everyone located in /src
