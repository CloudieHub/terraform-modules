# GCP Compute Instance Group (Managed Instance Group)

This Terraform module provisions a **Google Cloud Managed Instance Group (MIG)** with an Instance Template and autoscaling policies.  
It is designed to deploy scalable and highly available workloads in GCP.

---

## Features

- Instance Template for VM configuration  
- Managed Instance Group (MIG) creation  
- Configurable machine type, image, and network  
- SSH access via public key  
- Autoscaling policies based on CPU utilization  
- Tagging support for resources  

---

## Resources Created

- `google_compute_instance_template` – Instance configuration  
- `google_compute_instance_group_manager` – Managed Instance Group  
- `google_compute_autoscaler` – Autoscaling policy  

---

## Outputs

- `instance_group_manager` – The Managed Instance Group resource  

---

## Usage

```hcl
module "gcp_compute_instance_group" {
  source = "../gcp-compute-instance-group"

  project_id          = "your-project-id"
  region              = "us-central1"
  zone                = "us-central1-a"
  name                = "app"
  machine_type        = "e2-medium"
  source_image        = "debian-cloud/debian-11"
  network             = "default"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
  target_size         = 2
  min_replicas        = 1
  max_replicas        = 5
}
# GCP Compute Instance Group (CloudieHub)

See [examples/simple](./examples/simple/main.tf) for a root module that calls this module.

