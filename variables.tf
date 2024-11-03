variable "prefix" {
  type        = string
  description = "The prefix which should be used for all resources in this module"
  default     = "aaa"
  validation {
    condition     = length(var.prefix) < 4 
    error_message = "prefix must be less than 4 characters long"
  }
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

variable "admin" {
  type        = list
  description = "admin for the Fabric capacity"
}

variable "sku" {
  type        = string
  description = "The Fabric SKU F2 to F128"
  default     = "F2"
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources in this module"
  default     = "eastus2"
}


# Standard Tags
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

