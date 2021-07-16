# Wordpress for Everyone
# How to create your own instance
***WARNING about cost***
- The tool is built on the free teir App Service Plan, but there may be additional costs associated with storage accounts and the azure container registry.   I've personally only experienced the $0.17 per day, but this may differ for you.   Use at your own risk.

## Preqs
- Need an Azure Account
- Docker installed on your system
- az cli installed on your system

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

- NOTE:  During the terraform build process, you will be asked to verify your Azure login.  You must do this otherwise the build process will not continue and the application will not be able to build resources:

```null_resource.docker_build (local-exec): #17 [12/12] RUN /azure-cli/bin/python -m azure.cli login
null_resource.docker_build (local-exec): #17 sha256:3027a084ed488d73d3fc32e787b314d4aa07d2a51054c62f819f48338d42d896
null_resource.docker_build (local-exec): #17 2.702 WARNING: Not able to launch a browser to log you in, falling back to device code...
null_resource.docker_build (local-exec): #17 3.332 WARNING: To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code XXXXXXXXX to authenticate.
```

That's it, you'll then have a site named app_name.azurewebsites.net that can auto generate wordpress sites!
