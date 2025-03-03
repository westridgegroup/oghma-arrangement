data "databricks_metastores" "all" {}

output "all_metastores" {
  value = data.databricks_metastores.all.ids
}



#resource "databricks_metastore_assignment" "this" {
#  metastore_id = databricks_metastore.this.id
#  workspace_id = local.workspace_id
#}
