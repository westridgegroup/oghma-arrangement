variable "admin" {
  type        = string
  description = "overall resource administrator, this is not owner at the subscription level, but specific RBACs at the RG level"
}

variable "devs" {
  type = string
  description = "Individuals who need developer access to the environment"
}

variable "env" {
  type        = string
  description = "The environement for the resoruce"
  default     = "dev"
  validation {
    condition     = length(var.env) < 4
    error_message = "env value must be less than 4 characters long"
  }
}

variable "local_ip" {
  type        = list
  description = "The teams or admins ip addresses for white listing"
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources in this module"
  default     = "eastus2"
}

variable "prefix" {
  type        = string
  description = "The prefix which should be used for all resources in this module"
  default     = "aaa"
  validation {
    condition     = length(var.prefix) < 4 
    error_message = "prefix must be less than 4 characters long"
  }
}

variable "retention_days" {
  type = number
  description = "The number of days blobs and containers hould be retained"
  default = 7
}

variable "users" {
  type = string
  description = "Individuals who are users of the environment"  
}



# wrgcli managed variables
variable "arm_client_id" {
  default=""
  description = "The arm client id coming in from a environment variable"
  type = string
}

variable "arm_client_secret" {
  default=""
  description = "The arm client secret coming in from a environment variable"
  type = string
}

variable "arm_tenant_id" {
  default=""
  description = "The Azure tenant id coming in from a environment variable"
  type = string
}

variable "databricks_account_id" {
  default=""
  description = "Databricks Account Id coming in from a environment variable"
  type = string
}


variable "tags" {
  default     = {}
  description = "The generic tags for this project that go on all resources"
  type        = map(string)
}

variable "state_container_name" {
  default     = ""
  description = "Used by the boostrap shell script but provide here incase it is needed, in the output by default"
  type        = string
}

variable "state_key" {
  default     = ""
  description = "Used by the bootstrap shell script but provided here incase it is needed, in the output by default"
  type        = string
}

