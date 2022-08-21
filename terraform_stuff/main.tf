provider "google" {
  project = "playground-geo"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_storage_bucket" "geo_bucket" {
  name          = "attractors-bucket"
  location      = "us-central1"
  project       = "playground-geo"
  force_destroy = true
  role          = "roles/storage.objectViewer"
  member        = "allUsers"

  uniform_bucket_level_access = true
}
