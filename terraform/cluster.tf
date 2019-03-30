variable "username" {}
variable "password" {}

resource "google_container_cluster" "primary" {
  name                     = "k8s"
  location                 = "us-central1-a"
  remove_default_node_pool = true
  initial_node_count       = 3

  master_auth {
    username = "${var.username}"
    password = "${var.password}"
  }

  addons_config {
    kubernetes_dashboard {
      disabled = true
    }
  }

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
