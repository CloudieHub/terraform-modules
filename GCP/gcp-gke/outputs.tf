output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = google_container_cluster.this.name
}

output "endpoint" {
  description = "The endpoint for the GKE cluster"
  value       = google_container_cluster.this.endpoint
}

output "node_pool_name" {
  description = "The name of the node pool"
  value       = google_container_node_pool.primary.name
}
