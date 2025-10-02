provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Instance Template
resource "google_compute_instance_template" "default" {
  name         = "${var.name}-template"
  machine_type = var.machine_type

  disk {
    source_image = var.source_image
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = var.network
    access_config {} # Ephemeral public IP
  }

  metadata = {
    ssh-keys = "user:${file(var.ssh_public_key_path)}"
  }
}

# Managed Instance Group
resource "google_compute_instance_group_manager" "default" {
  name               = "${var.name}-mig"
  base_instance_name = var.name
  region             = var.region
  version {
    instance_template = google_compute_instance_template.default.self_link
  }
  target_size = var.target_size
}

# Autoscaler
resource "google_compute_autoscaler" "default" {
  name   = "${var.name}-autoscaler"
  region = var.region
  target = google_compute_instance_group_manager.default.self_link

  autoscaling_policy {
    max_replicas    = var.max_replicas
    min_replicas    = var.min_replicas
    cpu_utilization {
      target = 0.6
    }
  }
}
