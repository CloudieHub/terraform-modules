# Azure VM Scale Set Module (CloudieHub)

This Terraform module provisions a **Linux Virtual Machine Scale Set (VMSS)** in Azure with a Load Balancer, Subnet, and Network Security Group. It enables **auto-scaling** and **high availability**.

## Features
- Virtual Machine Scale Set (Ubuntu)
- Public Load Balancer with backend pool
- NSG allowing SSH (22) & HTTP (80)
- Configurable instance size & count
- SSH key-based authentication
- Automatic VM upgrades
- Resource Group + VNet + Subnet creation
- Tagging support

## Outputs
- `scale_set_id` – ID of the VM Scale Set  
- `load_balancer_ip` – Public IP of the Load Balancer  

## Usage
See `examples/simple` for a root module that calls this module.
