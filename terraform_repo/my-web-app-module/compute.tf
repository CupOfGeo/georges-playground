#resource "google_compute_instance" "web-server" {
#  name         = "test-webserver"
#  machine_type = var.machine_type
#  zone         = var.zone
#
#  tags = ["http-server"]
#
#  boot_disk {
#    initialize_params {
##            image = "debian-cloud/debian-11"
#      image = var.web-image
#    }
#  }
#
#  network_interface {
#    network = "default"
#    access_config {
#
#    }
#  }
#
#  #  metadata_startup_script = "echo hi > /test.txt"
#  #  metadata_startup_script = file("./apache2.sh")
#
#  scheduling {
#    preemptible       = true
#    automatic_restart = false
#  }
#
#  #  from https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
#  #  service_account {
#  #    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
#  #    email  = google_service_account.default.email
#  #    scopes = ["cloud-platform"]
#  #  }
#}


resource "google_cloud_run_service" "hello-web-server" {
  name     = "my-flask-app"
  location = "us-central1"
  template {
    spec {
      containers {
        image = var.web-image
        ports {
          container_port = 8080
        }
      }
    }
  }
}
