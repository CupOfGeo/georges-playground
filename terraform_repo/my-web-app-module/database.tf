resource "google_sql_database" "database" {
  count = var.with_database ? 1 : 0
  name     = "my-database"
  instance = google_sql_database_instance.instance[count.index].name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "instance" {
  count = var.with_database ? 1 : 0
  name             = "my-database-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"

  settings {
    tier = "db-f1-micro"
  }

  deletion_protection = "false"
}
