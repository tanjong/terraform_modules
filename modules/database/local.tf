locals {
  # Common tags to be assigned to all resources
  db_tags = {
    Service     = "devOps"
    Owner       = "devlab_admin"
    environment = "Development"
    ManagedWith = "terraform"
  }
  
  main        = var.main
  buildregion = var.buildregion
  dbrgname    = var.dbrgname
}