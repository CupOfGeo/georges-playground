# this was if i wanted to set if you want a database based on a var when defining the module
# resource "google_sql_database" "database" {
#   count = var.with_database ? 1 : 0
#   name     = "my-database"
#   instance = google_sql_database_instance.instance[count.index].name
# }

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "postgres_instance" {
  name             = "${var.app_name}-db"
  region           = "us-central1"
  database_version = "POSTGRES_15"

  settings {
    tier      = "db-f1-micro"
    disk_size = 10
    disk_type = "PD_HDD"
  }
  deletion_protection = "false"
}
