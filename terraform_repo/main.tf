provider "google" {
  credentials = file("../secret/terraform_service_account.json")
  project     = "playground-geo"
  region      = "us-central1"
  zone        = "us-central1-c"
}

module "fastapi-crud" {
  source    = "./fastapi-crud"
  web_image = var.web_image
}

#resource "google_artifact_registry_repository" "my-repo" {
#    provider = google
#    location = "us-central1"
#    repository_id = "test-flask-app-images"
#    format        = "DOCKER"
#}
