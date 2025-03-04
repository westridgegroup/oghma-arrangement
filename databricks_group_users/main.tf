data "azuread_user" "current" {
    object_id = var.user_object_id
}

resource "databricks_user" "me" {
  user_name = data.azuread_user.current.user_principal_name
}

resource "databricks_group_member" "this" {
  group_id  = var.group_id
  member_id = databricks_user.me.id
}


