# Day 8 – Deploying Resources Together in Azure

## What I Did
- Studied how multiple Azure resources work together as a system
- Simulated deploying a Virtual Machine, Virtual Network, and Storage Account
- Reviewed concepts of resource dependencies and architecture design
- Explored private endpoints and service endpoints
- Visualized how resources connect and communicate in a real-world scenario

## Architecture Scenario 🏗️
A simple cloud system includes:
- Virtual Machine (compute)
- Virtual Network (networking)
- Storage Account (data storage)

### Deployment Order
1. Virtual Network (VNet)
2. Subnet
3. Storage Account
4. Virtual Machine (inside the VNet)

## What I Learned 💡
- Cloud resources are interconnected and depend on each other
- A Virtual Machine requires both networking and storage to function
- VNets provide secure communication between resources
- Storage should be separated from compute for scalability and cost efficiency
- Private endpoints and service endpoints improve secure access to services

## Key Concepts
- **Resource Dependency**: Resources rely on others (e.g., VM depends on VNet)
- **System Design**: Combining services into a complete solution
- **Private Endpoint**: Secure private connection to services
- **Service Endpoint**: Extends VNet to Azure services securely

## Dependency Flow 🔗

VNet → Subnet → VM  
Storage → Connected to VM  

If the VNet is missing:
- VM cannot communicate
- System fails

## Example ARM Template (Simplified) 💻

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "resources": [
    {
      "type": "Microsoft.Network/virtualNetworks",
      "name": "myVNet",
      "apiVersion": "2021-05-01",
      "location": "East US",
      "properties": {
        "addressSpace": {
          "addressPrefixes": ["10.0.0.0/16"]
        }
      }
    },
    {
      "type": "Microsoft.Compute/virtualMachines",
      "name": "myVM",
      "apiVersion": "2021-07-01",
      "location": "East US",
      "dependsOn": [
        "Microsoft.Network/virtualNetworks/myVNet"
      ],
      "properties": {}
    }
  ]
}
👉 The "dependsOn" section shows that:
VM will only be created AFTER the VNet

## Challenges ⚠️
- No direct hands-on lab for full deployment
- Needed to visualize dependencies and architecture manually
- Understanding endpoints required additional research
## Notes / Reflection 🚀
- Shifted from learning individual services to designing connected systems
- Understanding dependencies made cloud architecture clearer
- Beginning to think in terms of real-world deployment scenarios
## Screenshots
<img width="1319" height="621" alt="1g" src="https://github.com/user-attachments/assets/84b44359-3023-4318-95cb-52d1a60a7aeb" />
<img width="467" height="634" alt="2g" src="https://github.com/user-attachments/assets/158ead01-966e-4d9d-8a62-569c8f4f57e6" />
<img width="838" height="465" alt="3g" src="https://github.com/user-attachments/assets/ce4eeb93-9a59-4bca-9b3f-7564bd7670a8" />
<img width="786" height="629" alt="4g" src="https://github.com/user-attachments/assets/108e7859-4bb9-4dd4-a49b-bcd86c351ec7" />
<img width="919" height="428" alt="5g" src="https://github.com/user-attachments/assets/eee278eb-f8da-457b-a31a-d9d3cd82aea2" />





