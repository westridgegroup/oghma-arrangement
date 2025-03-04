variable "user_object_id" {
    type = string
}

data "azuread_user" "current" {
    object_id = var.user_object_id
}

output "user"{
    value = data.azuread_user.current.user_principal_name
}

#resource "databricks_user" "me" {
#  user_name = data.azuread_user.current.user_principal_name
#}
