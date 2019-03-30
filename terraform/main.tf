variable "project" {}
variable "region" {}

provider "google" {
  credentials = "${file("./k8s-gcp-account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}
