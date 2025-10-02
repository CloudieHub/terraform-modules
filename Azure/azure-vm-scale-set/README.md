# Azure VM Scale Set Module (CloudieHub)

This Terraform module provisions an **Azure Virtual Machine Scale Set (VMSS)** with a Virtual Network, Subnet, and Network Security Group.  
It enables scalable, highly available workloads on Azure.

---

## Features
- Creates a **VM Scale Set** with configurable instance count.  
- Supports **custom VM size** selection.  
- Deploys into a **Virtual Network + Subnet**.  
- Creates a **Network Security Group** with SSH (22) access.  
- Supports **tags** for all resources.  
- Easy to extend with load balancers or autoscaling policies.

---

## Resources Created
- `azurerm_resource_group` – Resource Group  
- `azurerm_virtual_network` – Virtual Network  
- `azurerm_subnet` – Subnet for VMSS  
- `azurerm_network_security_group` – Security Group for VMs  
- `azurerm_linux_virtual_machine_scale_set` – The VM Scale Set  

---

## Inputs
| Name             | Description                          | Type   | Default              |
|------------------|--------------------------------------|--------|----------------------|
| `prefix`         | Name prefix for resources            | string | n/a                  |
| `location`       | Azure region                         | string | `"East US"`          |
| `rg_name`        | Resource Group name                  | string | n/a                  |
| `vm_size`        | VM instance size                     | string | `"Standard_B2s"`     |
| `instance_count` | Number of VM instances               | number | `2`                  |
| `admin_username` | Admin username for VMs               | string | `"azureuser"`        |
| `admin_password` | Admin password for VMs (sensitive)   | string | n/a                  |

---

## Outputs
| Name          | Description                   |
|---------------|-------------------------------|
| `vmss_id`     | ID of the VM Scale Set        |
| `vmss_name`   | Name of the VM Scale Set      |
| `subnet_id`   | ID of the created Subnet      |
| `nsg_id`      | ID of the Network Security Group |

---

## Usage
See [examples/simple](./examples/simple) for a root module that calls this module.

```hcl
module "vmss" {
  source         = "CloudieHub/terraform-modules/Azure/azure-vm-scale-set"
  prefix         = "demo"
  location       = "East US"
  rg_name        = "demo-rg"
  vm_size        = "Standard_B2s"
  instance_count = 2
  admin_username = "azureuser"
  admin_password = "StrongPassword123!"
}
