provider "google" {
  credentials = file("../secret/terraform_service_account.json")
  project = "playground-geo"
  region  = "us-central1"
  zone    = "us-central1-c"
}

module "webserver" {
  source = "./my-web-app-module"
  web-image = var.web-image
  with_database = false
}

#resource "google_artifact_registry_repository" "my-repo" {
#    provider = google
#    location = "us-central1"
#    repository_id = "test-flask-app-images"
#    format        = "DOCKER"
#}
