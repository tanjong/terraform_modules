#/========================================\#
#***  Database  modules   ***#
#/========================================\#
resource "azurerm_resource_group" "rg" {
  name     = var.dbrgname
  location = local.buildregion
}

resource "azurerm_storage_account" "sqldb_storageaccount" {
  name                     = join("", ["devlab", var.sqldbsa])
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

#### mysql server  ###

resource "azurerm_mssql_server" "sql_server" {
  name                         = join("-", ["devlab", var.sqlserver])
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  version                      = var.versionsql
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password #data.azurerm_key_vault_secret.exisitingkeyvaultsecret.value 
}

resource "azurerm_mssql_database" "sql_database" {
  name         = join("", ["devlab", "db"])
  server_id    = azurerm_mssql_server.sql_server.id
  collation    = var.collation
  license_type = var.license_type
  read_scale = var.read_scale
  zone_redundant = var.zone_redundant

  tags = local.db_tags
}

resource "azurerm_mssql_firewall_rule" "sql_fwRule" {
  name             = join("", ["devlab", var.fwRulename, "db"])
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}