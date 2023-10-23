terraform {
  backend "gcs" {
    bucket = "terraform-state-geo"
    prefix = "terraform/state"
  }
}


resource "google_storage_bucket" "tf-bucket" {
  project       = var.gcp_project
  name          = var.tf_bucket_name
  location      = var.gcp_region
  force_destroy = true
  storage_class = var.storage_class
  versioning {
    enabled = true
  }
}
