data "databricks_metastore" "location" {
    name="dataverse2"
}

output "metastore_id" {
  value = data.databricks_metastore.location.id
}



#resource "databricks_metastore_assignment" "this" {
#  metastore_id = databricks_metastore.this.id
#  workspace_id = local.workspace_id
#}
