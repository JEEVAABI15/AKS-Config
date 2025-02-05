# AKS Deployment using Terraform

## Overview
This project automates the deployment of an **Azure Kubernetes Service (AKS) cluster** using **Terraform**. The infrastructure follows a **modular approach**, ensuring scalability, maintainability, and reusability.

## **Architecture and Concepts**
The deployment includes:
- **Azure Kubernetes Service (AKS)**: Managed Kubernetes cluster.
- **Virtual Network (VNet)**: Defines network segmentation and security.
- **Load Balancer**: Distributes traffic efficiently across AKS nodes.
- **NAT Gateway**: Manages outbound connections.
- **Route Table**: Controls routing rules for network traffic.
- **Terraform Modules**: Modularizes the infrastructure to maintain separation of concerns.

## **Project Structure**
```
AKS_DEPLOY_TERRAFORM
├── .terraform/              # Terraform internal files
├── main.tf                 # Root Terraform configuration
├── modules/                # Modularized Terraform configurations
│   ├── aks/                # AKS Module
│   ├── load-balancer/      # Load Balancer Module
│   ├── nat-gateway/        # NAT Gateway Module
│   ├── route-table/        # Route Table Module
│   └── vnet/               # Virtual Network Module
├── outputs.tf              # Output definitions
├── providers.tf            # Provider configurations
├── terraform.tfvars        # Terraform variables file
└── variables.tf            # Variable definitions
```

## **Terraform Modules**
This project is structured into modules, ensuring **code reusability** and **scalability**.

### **1. AKS Module (`modules/aks/`):**
- Deploys an **Azure Kubernetes Service (AKS)** cluster.
- Uses a **Virtual Machine Scale Set (VMSS)** for node scaling.
- Auto-scales the cluster between **1-5 nodes**.
- Configures an **Azure CNI-based network**.

#### **Inputs:**
| Variable Name          | Description                           | Type   |
|------------------------|--------------------------------------|--------|
| aks_name              | Name of the AKS cluster              | string |
| location              | Azure region                         | string |
| resource_group_name   | Resource Group for AKS               | string |
| dns_prefix            | DNS prefix for AKS                   | string |
| node_count            | Initial number of nodes              | number |
| vm_size               | VM size for nodes                    | string |
| subnet_id             | Subnet ID for AKS                    | string |
| zones                 | Availability Zones                   | list(string) |

#### **Outputs:**
| Output Name           | Description                      |
|-----------------------|---------------------------------|
| aks_id               | AKS cluster ID                  |
| aks_name             | Name of the deployed AKS cluster |

---
### **2. Virtual Network Module (`modules/vnet/`):**
- Creates an **Azure Virtual Network**.
- Defines subnets for AKS and other components.

#### **Inputs:**
| Variable Name       | Description                     | Type   |
|---------------------|--------------------------------|--------|
| vnet_name          | Name of the Virtual Network    | string |
| vnet_address_space | Address space for VNet         | string |

#### **Outputs:**
| Output Name        | Description                     |
|--------------------|--------------------------------|
| vnet_id           | Virtual Network ID             |

---
### **3. Load Balancer Module (`modules/load-balancer/`):**
- Deploys an **Azure Load Balancer** to manage external traffic.

#### **Inputs:**
| Variable Name       | Description                  | Type   |
|---------------------|-----------------------------|--------|
| lb_name            | Load Balancer name          | string |
| public_ip          | Public IP address for LB    | string |

#### **Outputs:**
| Output Name       | Description                  |
|------------------|-----------------------------|
| lb_private_ip    | Load Balancer Private IP    |

---
### **4. NAT Gateway Module (`modules/nat-gateway/`):**
- Creates a **NAT Gateway** to manage outbound traffic.

#### **Inputs:**
| Variable Name      | Description                     | Type   |
|--------------------|--------------------------------|--------|
| nat_gateway_name  | Name of the NAT Gateway        | string |
| public_ip_id      | Public IP ID for NAT Gateway   | string |

#### **Outputs:**
| Output Name       | Description                |
|------------------|---------------------------|
| nat_gateway_id   | NAT Gateway ID            |

---
### **5. Route Table Module (`modules/route-table/`):**
- Defines **custom routes** for traffic management.

#### **Inputs:**
| Variable Name     | Description                   | Type   |
|-------------------|------------------------------|--------|
| route_table_name | Name of the Route Table       | string |
| routes           | List of route definitions     | list   |

#### **Outputs:**
| Output Name       | Description                   |
|------------------|------------------------------|
| route_table_id   | Route Table ID               |

---

## **Usage**
### **1. Install Prerequisites**
Ensure you have the following installed:
- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

### **2. Authenticate to Azure**
Run the following command to log in to Azure:
```sh
az login
```
If using **Service Principal Authentication**:
```sh
az login --service-principal -u <client_id> -p <client_secret> --tenant <tenant_id>
```

### **3. Initialize Terraform**
```sh
terraform init
```

### **4. Plan the Deployment**
```sh
terraform plan
```

### **5. Apply the Configuration**
```sh
terraform apply -auto-approve
```

### **6. Destroy Resources (if needed)**
To remove the infrastructure:
```sh
terraform destroy -auto-approve
```

## **Next Steps**
- Integrate **Azure Monitor** for observability.
- Set up **Azure DevOps or GitHub Actions** for CI/CD.
- Implement **RBAC** for Kubernetes access control.

## **Authors**
- **Jeeva Abishake**  
- **Contributors Welcome!** 🎉

---
This README provides a clear overview of the project, making it easy for new users to understand the infrastructure, inputs, outputs, and usage. 🚀

