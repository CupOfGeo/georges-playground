provider "google" {
  credentials = "${file("../secret/terraform_service_account.json")}"
  project = "playground-geo"
  region  = "us-central1"
  zone    = "us-central1-c"
}

#module "webserver" {
#  source = "./my-web-app-module"
#  web-image = var.web-image
#}
