

module "sql-db_postgresql" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "12.0.0"
  project_id                      = var.gcp_project
  name                            = var.postgress_name
  db_name                         = "my-db"
  database_version                = "POSTGRES_12"
  region                          = var.gcp_region
}
