variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "location" {
  description = "The location (region or zone) of the cluster"
  type        = string
}

variable "network" {
  description = "The VPC network to use"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to use"
  type        = string
}

variable "initial_node_count" {
  description = "Initial number of nodes in the default pool"
  type        = number
  default     = 1
}

variable "node_count" {
  description = "Number of nodes in the custom node pool"
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
  default     = "e2-medium"
}

variable "node_labels" {
  description = "Labels for GKE nodes"
  type        = map(string)
  default     = {}
}

variable "node_tags" {
  description = "Network tags for GKE nodes"
  type        = list(string)
  default     = []
}
