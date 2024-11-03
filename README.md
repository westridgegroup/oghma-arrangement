# terraform-dbx
Terraform for a Databricks workspace

## Getting Started
1. This project is expects resources created by [obhcgcli](https://github.com/obhcapitalgroup/obhcgcli) project's TerraformAzureBootstrap.sh script to exist.	
2. From bash shell: az login (make sure you are in the correct subscription)
3. From bash shell: source ../obhcgcli/TerraformAzureBootstrap.sh 
4. From bash shell: terraform_setup ./env/haystack.tfvars
4. From bash shell: terraform_plan 	
5. From bash shell: terrform_apply 

##### Notes: This project follows the standard West Ridge Group terraform famework, state container name and state key information is in the tfvars file. 
##### Notes: The user_groups variable is read at execution time to populate the access control policy