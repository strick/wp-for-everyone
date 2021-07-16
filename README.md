# Wordpress for Everyone
# How to create your own instance
***WARNING:  This will incur a $0.17 charge per day***
## Setup Azure
- Create an Azure Resource Group in your subscription
- Create a blob storage in its own resource group and add a container to it.    This is used for terraform state.
  - Create a new resource group for it (example below)
    - Resource group:  hackday-tf
    - Blob name: hackdaytf
    - Container name: tf-state  (private container)

## Create service account
- az login
- az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your-subscription"
  - Remember this information, it's needed later.

## Deploy your instance
- Download source code
- cd /scripts
- Update variables.tf with your information
- Update backend.tf with your storage account information
- terraform init  
- terraform apply -var="client_id=000000000000000000" -var="client_secret=000000000000000000" -var="subscription_id=000000000000000000" -var="tenant_id=000000000000000000"
  - use the information you got in the service account creation step here

That's it, you'll then have a site named app_name.azurewebsites.net that can auto generate wordpress sites!

## Terraform located in /scripts
## Wordpress for Everyone located in /src
