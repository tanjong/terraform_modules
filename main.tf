module "database" {

  source                       = "./modules/database"
  dbrgname                     = join("_", ["devlab", "db", "rg"])
  main                         = lower("devlab")
  buildregion                  = lower("centralus")
  sqldbsa                      = "sqldbsa"
  sqldb_storageaccount         = join("", ["devlab", "sqldbsa"])
  sqlserver                    = "sqlserver"
  sql_server                   = join("-", ["devlab", "sqlserver"])
  administrator_login          = join("", ["devlab", "sqladmin"])
  administrator_login_password = var.administrator_login_password
  sql_database                 = join("", ["devlab", "db"])
  sql_fwRule                   = join("", ["devlab", "fwdevRule", "db"])
  fwRulename                   = "fwdevRule"
  start_ip_address             = "75.28.18.240"
  end_ip_address               = "75.28.18.240"
}
