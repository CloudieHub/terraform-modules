terraform {
  required_version = ">= 1.2.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# VPC Network
resource "google_compute_network" "this" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

# Subnets
resource "google_compute_subnetwork" "subnets" {
  for_each       = { for idx, cidr in var.subnet_cidrs : idx => cidr }
  name           = "${var.vpc_name}-subnet-${each.key}"
  ip_cidr_range  = each.value
  region         = var.region
  network        = google_compute_network.this.id
  private_ip_google_access = true
}

# Firewall Rules
resource "google_compute_firewall" "allow_ssh_http" {
  name    = "${var.vpc_name}-fw"
  network = google_compute_network.this.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}
