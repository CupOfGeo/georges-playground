# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
  default = "us-central1"
}

variable "zone" {
  type        = string
  description = "GCP zone"
  default = "us-central1-a"
}
# define GCP project name
variable "gcp_project" {
  type        = string
  description = "GCP project name"
}
# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
}
variable "machine_type" {
  type        = string
  description = "The name of the Google Storage Bucket to create"
  deafult = 'e2-small'
}

variable "postgress_name" {
  type = string
  description = "The name of the Cloud SQL resources"
}
