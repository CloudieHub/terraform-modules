provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"
}

module "gke" {
  source         = "../../"
  cluster_name   = "cloudiehub-gke"
  location       = "us-central1"
  network        = "default"
  subnetwork     = "default"
  node_count     = 2
  machine_type   = "e2-medium"
  node_labels    = { env = "demo" }
  node_tags      = ["cloudiehub", "gke"]
}

output "gke_cluster_name" {
  value = module.gke.cluster_name
}

output "gke_endpoint" {
  value = module.gke.endpoint
}
