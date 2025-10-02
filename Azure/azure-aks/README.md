# Azure Kubernetes Service (AKS) Module (CloudieHub)

This Terraform module provisions an **Azure Kubernetes Service (AKS)** cluster.

---

## Features
- Creates a fully managed **Kubernetes cluster** in Azure  
- System-assigned identity by default  
- Configurable **node count** and **VM size**  
- Outputs **kubeconfig** for cluster access  

---

## Resources Created
- `azurerm_resource_group` – Resource Group  
- `azurerm_kubernetes_cluster` – AKS Cluster  

---

## Inputs
| Name         | Description                          | Type   | Default             |
|--------------|--------------------------------------|--------|---------------------|
| `rg_name`    | Resource group name                  | string | n/a                 |
| `location`   | Azure region                         | string | `"East US"`         |
| `aks_name`   | AKS cluster name                     | string | n/a                 |
| `node_count` | Number of nodes in the default pool  | number | `2`                 |
| `vm_size`    | VM size for worker nodes             | string | `"Standard_DS2_v2"` |
| `tags`       | Tags to apply                        | map    | `{}`                |

---

## Outputs
| Name            | Description                          |
|-----------------|--------------------------------------|
| `aks_name`      | AKS Cluster name                     |
| `aks_kube_config` | Raw kubeconfig (sensitive)          |
| `aks_fqdn`      | AKS Cluster FQDN                     |

---

## Usage
See [examples/simple](./examples/simple).

```hcl
module "aks" {
  source    = "CloudieHub/terraform-modules/Azure/azure-aks"
  rg_name   = "demo-aks-rg"
  location  = "East US"
  aks_name  = "cloudiehub-aks"
  node_count = 2
  vm_size   = "Standard_DS2_v2"
}
