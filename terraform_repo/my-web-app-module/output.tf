output "cloud_run_url" {
  value = google_cloud_run_service.hello-web-server.status[0].url
}
