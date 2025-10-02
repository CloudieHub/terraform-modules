# GCP Compute Instance Group (Managed Instance Group)

This Terraform module provisions a **Managed Instance Group (MIG)** in Google Cloud Platform (GCP).  
It creates an instance template, instance group manager, and an autoscaler.

## Files
- `main.tf` → Defines GCP compute instance group and autoscaler
- `variables.tf` → Input variables
- `outputs.tf` → Outputs for reference
- `README.md` → Documentation

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
