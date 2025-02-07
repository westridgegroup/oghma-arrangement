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
6. VMs
7. Bastion


## Getting Started
1. This project is expects resources created by [wrgcli](https://github.com/westridgegroup/wrg-terraform-azure-bootstrap) project's TerraformAzureBootstrap.sh script to exist.	
2. From bash shell: az login (make sure you are in the correct subscription)
3. From bash shell: source ../wrg-terraform-azure-bootstrap/TerraformAzureBootstrap.sh 
4. From bash shell: terraform_setup ./env/dev.tfvars
4. From bash shell: terraform_plan 	
5. From bash shell: terrform_apply 

##### Notes: This project follows the standard West Ridge Group terraform famework, state container name and state key information is in the tfvars file. 
##### Notes: The user_groups variable is read at execution time to populate the access control policy

## Platform Details
The Databricks workspace, key vault, storage and logic app are all wrapped in a vnet and do not all for external access directly from the internet.   All resource connectivity is via private endpoints with the except of Fabric which uses VNET Data Gateways.

### Data Storage Accounts
- Raw
    - This storage account is used for Diagnostic Logging accross all resources.  The idea is that Databricks will used to investigate the logs.
    - Settings:
        - account_tier = "Standard"
        - account_replication_type = "GRS"
        - account_kind = "BlockBlobStorage"
        - access_tier = N/A
        - https_traffic_only_enableed = true
        - shared_access_key_enabled = false
        - public_network_access_enabled = false
        - default_to_oauth_authentication = true
        - is_hns_enabled = false 
        - local_user_enabled = false
        - allow_nested_items_to_be_public = false
    - Private Endpoint for Blob connected to the Private Endpoint subnet
- Refined
- Modeled
- Logging
    - This storage account is used for Diagnostic Logging accross all resources.  The idea is that Databricks will used to investigate the logs.
    - Settings:
        - account_tier = "Standard"
        - account_replication_type = "LRS"
        - account_kind = "BlockBlobStorage"
        - access_tier = N/A
        - https_traffic_only_enableed = true
        - shared_access_key_enabled = false
        - public_network_access_enabled = false
        - default_to_oauth_authentication = true
        - is_hns_enabled = false 
        - local_user_enabled = false
        - allow_nested_items_to_be_public = false
    - Private Endpoint for Blob connected to the Private Endpoint subnet

### Vnet Details
Class B Network starting at: 130.1.0.0/16
If we need additional networks that talk to one another they would take the next class B 130.2.0.0/16.  An example would be to have one instance of this code for Development and another for production.  Each section below describes specific resource configuration.  
- DDoS Network Protection: Disabled
- DNS Server: Default
- Diagnostic Settings:
    - All Logs
    - All Metrics
    - Archive to Storage Account: XXX

#### Subnets
- Gateway 
    - CIDR: 130.1.0.0/24
    - NSG:
    - Route Table:
- Databricks Public 
    - CIDR: 130.1.1.0/24
    - NSG:
    - Route Table:
- Databricks Private 
    - CIDR: 130.2.0/24
    - NSG:
    - Route Table:
- Private End Points (Storage and Key Vault) 
    - CIDR: 130.3.0/24
    - NSG:
    - Route Table:
- Vnet Datagateway 
    - CIDR: 130.4.0.0/24
    - NSG:
    - Route Table:
- Logic App 
    - CIDR: 130.5.0.0/24
    - NSG:
    - Route Table:
- VM 
    - CIDR: 130.6.0.0/24
    - NSG:
    - Route Table:
- Bastion 
    - CIDR: 130.7.0.0/24
    - NSG:
    - Route Table:

### NSGs

### Resource Groups
- Logging resources: logging-rg
- Networking resources: vnet-rg
- Databricks Public
- Databricks Private
- Three seperate storage account rgs: raw-rg, refined-rg, modeled-rg
- Key Vaults (for all)
- Logic Apps (For all)
- VM (one for each vm including all of the resources for the VM)
- Bastion

 ### Databricks Configuration
 - 