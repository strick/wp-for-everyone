# wp-for-everyone
## Terraform located in /scripts
## Wordpress for Everyone located in /src

# How to create your own instance
- Create an Azure Resource Group in your subscription
- Download source code
- cd /scripts
- Update variables.tf with your information (app_name and resource_group_name)
- Change some of the 
- terraform init  (you may need to delete the backend.tf if you don't have a storage location)
- terraform apply -var="client_id=000000000000000000" -var="client_secret=000000000000000000" -var="subscription_id=000000000000000000" -var="tenant_id=000000000000000000"

That's it.
- 
