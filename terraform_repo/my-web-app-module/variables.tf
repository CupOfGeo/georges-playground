# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "GCP zone"
  default     = "us-central1-a"
}
## define GCP project name
#variable "gcp_project" {
#  type        = string
#  description = "GCP project name"
#}
## GCP authentication file
#variable "gcp_auth_file" {
#  type        = string
#  description = "GCP authentication file"
#}
variable "machine_type" {
  type        = string
  description = "The name of the Google Storage Bucket to create"
  default     = "e2-small"
}
variable "web-image" {
  type        = string
  description = "image in GAR"
}
