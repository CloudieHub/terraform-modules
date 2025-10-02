provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"
  zone    = "us-central1-a"
}

module "gcp_compute_instance_group" {
  source = "../../" # path to the module root

  project_id          = "your-gcp-project-id"
  region              = "us-central1"
  zone                = "us-central1-a"
  name                = "demo-instance-group"
  machine_type        = "e2-medium"
  source_image        = "debian-cloud/debian-11"
  network             = "default"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
  target_size         = 2
  min_replicas        = 1
  max_replicas        = 3
}

output "instance_group_manager" {
  value = module.gcp_compute_instance_group.instance_group_manager
}
