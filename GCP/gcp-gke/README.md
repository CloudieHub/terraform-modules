# GCP Kubernetes Engine (GKE) Module (CloudieHub)

This Terraform module provisions a **Google Kubernetes Engine (GKE)** cluster with a configurable node pool.  
It is designed to run containerized workloads in a managed Kubernetes environment on GCP.

---

## Features

- Creates a GKE cluster with configurable name, location, and node pool  
- Supports custom machine types, labels, and tags  
- Integrates with existing VPC and subnets  
- Outputs cluster name and endpoint  

---

## Resources Created

- `google_container_cluster` – GKE cluster  
- `google_container_node_pool` – Node pool for worker nodes  

---

## Outputs

- `cluster_name` – Name of the GKE cluster  
- `endpoint` – API server endpoint of the cluster  
- `node_pool_name` – Name of the node pool  

---

## Usage

See [examples/simple](./examples/simple/main.tf) for a root module that calls this module.
