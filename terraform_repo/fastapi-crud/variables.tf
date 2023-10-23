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

variable "web_image" {
  type        = string
  description = "image in GAR"
}

variable "app_name" {
  type        = string
  description = "Should be the same name as the repo"
  default     = "fastapi-crud"
}
