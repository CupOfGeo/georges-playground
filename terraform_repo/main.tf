provider "google" {
  credentials = file("../secret/terraform_service_account.json")
  project     = "playground-geo"
  region      = "us-central1"
  zone        = "us-central1-c"
}

# module "fastapi-crud" {
#   source    = "./fastapi-crud"
#   web_image = var.web_image
# }
# uncomment output.tf url too

# Create a Google Cloud Artifact Registry repository
#resource "google_artifact_registry_repository" "my-repo" {
#    provider = google
#    location = "us-central1"
#    repository_id = "test-flask-app-images"
#    format        = "DOCKER"
#    mode = Standard
#    description = "main arifact-repository for this project supports all projects"
#}

# Create a service account that will be used to push Docker images
# resource "google_service_account" "push_service_account" {
#   account_id   = "push-service-account"
#   display_name = "Push Service Account"
# }

# # Bind the service account to the Artifact Registry repository
# resource "google_project_iam_member" "push_service_account_member" {
#   project = "your-project-id"
#   role    = "roles/artifactregistry.writer"
#   member  = "serviceAccount:${google_service_account.push_service_account.email}"
# }

# # Create a JSON key for the service account (you can use this key to authenticate)
# resource "google_service_account_key" "push_service_account_key" {
#   service_account_id = google_service_account.push_service_account.name
# }

# output "repository_name" {
#   value = google_artifact_registry_repository.example.name
# }

# output "service_account_email" {
#   value = google_service_account.push_service_account.email
# }
