# Day 11 – Azure Mini Project (End-to-End System with Bicep)

## Project Overview 🎯
Designed and structured a complete cloud system using Infrastructure as Code (IaC).

This project simulates a real-world web application architecture by combining compute, networking, and storage components using Bicep and Azure CLI.

---

## Architecture Components 🧩
- Virtual Machine (Compute)
- Virtual Network (Networking)
- Subnet
- Storage Account (Data storage)
- Resource Group

---

## Architecture Flow 🔗

User → Internet → Virtual Network → Virtual Machine → Storage Account

---

## Deployment Plan 🛠️

1. Create Resource Group
2. Create Virtual Network
3. Create Subnet
4. Create Storage Account
5. Deploy Virtual Machine inside the VNet

---

## Resource Dependencies 🔗

- Virtual Machine depends on Virtual Network and Subnet
- Virtual Machine depends on Storage Account (OS disk / data)
- All resources are grouped inside a Resource Group

---

## Infrastructure as Code 💻

This system was implemented using a Bicep file (`main.bicep`):

- Defined Virtual Network and Subnet
- Created Storage Account
- Created Virtual Machine
- Used `dependsOn` to ensure correct deployment order

---

## Deployment Script 🚀

A PowerShell deployment script (`deploy.ps1`) was created to simulate real-world deployment.

This script performs:
- Authentication (`az login`)
- Resource Group creation
- Deployment of the Bicep template

---

## Screenshots 🖼️

### 🖥️ VS Code – Bicep Implementation
<img width="1366" height="718" alt="1" src="https://github.com/user-attachments/assets/5ffe9982-774e-4779-a8f0-15c5b1f0236a" />
<img width="1366" height="650" alt="2" src="https://github.com/user-attachments/assets/9e9727f7-5093-4ee5-a06f-23a341500a67" />


### ⚙️ Deployment Script
<img width="1366" height="679" alt="3" src="https://github.com/user-attachments/assets/49453828-bcb1-48af-a698-6aedbcce8d40" />

## Key Learnings 💡
- Cloud systems are built by combining multiple services into one architecture
- Infrastructure as Code enables automated and repeatable deployments
- Dependencies must be clearly defined for successful deployment
- Bicep simplifies ARM templates and improves readability
- Azure CLI enables automation of deployments

---

## Deeper Understanding 🔍
- Bicep and Azure CLI work together to enable full infrastructure automation
- Real-world deployments rely on scripts and templates instead of manual configuration
- Designing architecture before deployment is critical for scalability and reliability

---

## Challenges ⚠️
- Could not deploy resources due to lack of Azure subscription
- Writing infrastructure code required careful understanding of dependencies
- Translating architecture design into code was initially challenging

---

## Notes / Reflection 🚀
- This is my first complete cloud system implemented using code
- Successfully transitioned from portal → CLI → Infrastructure as Code
- Even without deployment, writing and structuring the system improved my confidence
- This project marks a major step toward real-world cloud engineering

---

## Project Files 📁
- `main.bicep` → Infrastructure definition
- `deploy.ps1` → Deployment script using Azure CLI

---

## Example Code 💻

### Bicep (Dependency Example)

```bicep
resource vm 'Microsoft.Compute/virtualMachines@2021-07-01' = {
  name: 'myVM'
  dependsOn: [
    vnet
    storage
  ]
}
