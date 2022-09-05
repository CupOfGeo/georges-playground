# GCP Settings
gcp_project   = "playground-geo"
gcp_region    = "us-central1"
gcp_auth_file = "../secret/terraform_service_account.json"
# Bucket
tf-bucket-name = "terraform-state-geo"
storage-class  = "REGIONAL"
web-image = "us-central1-docker.pkg.dev/playground-geo/test-flask-app-images/sample-flask-app:latest"
