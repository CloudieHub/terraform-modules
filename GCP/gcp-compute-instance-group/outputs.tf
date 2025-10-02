output "instance_template" {
  description = "Instance template self link"
  value       = google_compute_instance_template.default.self_link
}

output "instance_group_manager" {
  description = "Instance Group Manager self link"
  value       = google_compute_instance_group_manager.default.self_link
}

output "autoscaler" {
  description = "Autoscaler self link"
  value       = google_compute_autoscaler.default.self_link
}
