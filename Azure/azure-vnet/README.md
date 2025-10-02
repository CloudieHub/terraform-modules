# Azure VNet Module (CloudieHub)

This Terraform module creates a Virtual Network in Azure with public and private subnets.

## Features
- Virtual Network with custom address space  
- Public and private subnets  
- Resource Group creation  
- Tagging support  

## Outputs
- `vnet_id` – ID of the VNet  
- `subnet_ids_public` – IDs of public subnets  
- `subnet_ids_private` – IDs of private subnets  

## Usage
See `examples/simple` for a root module that calls this module.
