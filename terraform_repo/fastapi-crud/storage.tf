# Make a storage bucket in google cloud storage name it "george_bucket"
# Make a service account in google cloud storage and give it access to the bucket
# Download the service account key and save it as "george_key.json"


#resource "google_storage_bucket" "geo_bucket" {
#  name          = "attractors-bucket"
#  location      = "us-central1"
#  project       = "playground-geo"
#  force_destroy = true
#  role          = "roles/storage.objectViewer"
#  member        = "allUsers"
#
#  uniform_bucket_level_access = true
#}

# resource "google_storage_bucket" "geo_bucket" {
#   location = "us-central1"
#   name     = "george_bucket_for_testing_only"
#   project  = "playground-geo"
#   uniform_bucket_level_access = false
#   force_destroy = true
# }
