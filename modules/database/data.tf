data "azurerm_resource_group" "rg" {
  name = var.dbrgname
}

# data "azurerm_storage_account" "sqldb_storageaccount" {
#   name                = join("", ["devlab", "sqldbsa"])
#   resource_group_name = "rg"
# }