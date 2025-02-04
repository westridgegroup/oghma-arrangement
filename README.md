# oghma-arrangement
Terraform for an Azure based data platform

## Overivew
This repoistory is a complete set of code to stand up an Azure based data platform.  This platform allows for both batch and realtime processing of data.  The platform supports reporting, analytics, and machine learning.  The platform is deployed in a way that encapsulates and secures the resources making it accetable to the most robust security requirments.

## Platform Componenets
1. Databricks
2. Key Vault
3. Azure Storage
4. Azure Fabric
5. Logic App


## Getting Started
1. This project is expects resources created by [wrgcli](https://github.com/westridgegroup/wrg-terraform-azure-bootstrap) project's TerraformAzureBootstrap.sh script to exist.	
2. From bash shell: az login (make sure you are in the correct subscription)
3. From bash shell: source ../wrg-terraform-azure-bootstrap/TerraformAzureBootstrap.sh 
4. From bash shell: terraform_setup ./env/dev.tfvars
4. From bash shell: terraform_plan 	
5. From bash shell: terrform_apply 

##### Notes: This project follows the standard West Ridge Group terraform famework, state container name and state key information is in the tfvars file. 
##### Notes: The user_groups variable is read at execution time to populate the access control policy