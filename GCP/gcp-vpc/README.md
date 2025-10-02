# GCP VPC Network Module (CloudieHub)

This Terraform module provisions a **custom GCP VPC Network** with subnets and basic firewall rules.

---

## Features
- Creates a **VPC Network**  
- Configurable **subnets** with custom CIDR ranges  
- Firewall rules allowing **SSH (22), HTTP (80), and ICMP**  
- Outputs VPC and subnet names  

---

## Resources Created
- `google_compute_network` – VPC Network  
- `google_compute_subnetwork` – Subnets  
- `google_compute_firewall` – Firewall rules  

---

## Inputs
| Name          | Description                | Type   | Default             |
|---------------|----------------------------|--------|---------------------|
| `project_id`  | GCP Project ID             | string | n/a                 |
| `region`      | Region for resources       | string | us-central1         |
| `vpc_name`    | Name of the VPC network    | string | cloudiehub-vpc      |
| `subnet_cidrs`| List of subnet CIDR ranges | list   | ["10.0.1.0/24", "10.0.2.0/24"] |

---

## Outputs
| Name          | Description                    |
|---------------|--------------------------------|
| `vpc_name`    | Name of the VPC                |
| `subnet_names`| Names of the created subnets   |
| `firewall_name` | Name of the firewall rule    |

---

## Usage
See [examples/simple](./examples/simple).

```hcl
module "vpc" {
  source       = "CloudieHub/terraform-modules/GCP/gcp-vpc"
  project_id   = "your-gcp-project-id"
  region       = "us-central1"
  vpc_name     = "demo-cloudiehub-vpc"
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
}
