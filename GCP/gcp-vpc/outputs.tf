output "vpc_name" {
  value = google_compute_network.this.name
}

output "subnet_names" {
  value = [for s in google_compute_subnetwork.subnets : s.name]
}

output "firewall_name" {
  value = google_compute_firewall.allow_ssh_http.name
}
