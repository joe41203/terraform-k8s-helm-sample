variable "username" {}
variable "password" {}

# reference
# https://www.terraform.io/docs/providers/google/r/container_cluster.html

resource "google_container_cluster" "primary" {
  name                     = "k8s"
  location                 = "asia-northeast1-a"
  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = "${var.username}"
    password = "${var.password}"
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "k8s-node-pool"
  location   = "asia-northeast1-a"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 3

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
