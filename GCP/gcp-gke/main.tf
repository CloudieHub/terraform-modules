resource "google_container_cluster" "this" {
  name     = var.cluster_name
  location = var.location

  initial_node_count = var.initial_node_count

  node_config {
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    labels = var.node_labels
    tags   = var.node_tags
  }

  network    = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = false

  ip_allocation_policy {}
}

resource "google_container_node_pool" "primary" {
  name       = "${var.cluster_name}-node-pool"
  cluster    = google_container_cluster.this.name
  location   = var.location
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    labels = var.node_labels
    tags   = var.node_tags
  }
}
