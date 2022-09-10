output "gcp_bucket" {
  value = google_storage_bucket.tf-bucket
}

output "module-cloud-run-url" {
  value = module.webserver.cloud_run_url
}
