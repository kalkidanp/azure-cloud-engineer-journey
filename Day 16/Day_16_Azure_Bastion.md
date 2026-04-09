# Day 16 — Azure Bastion: Secure VM Access

## Overview

Today I explored **Azure Bastion**, which allows us to securely access VMs without exposing them to the internet. I focused on:

- How Bastion works
- Why a dedicated subnet is required
- Public IP usage and why it remains secure
- Comparing Bastion access with traditional RDP/SSH
- Hands-on Bicep coding for deployment (without an Azure subscription)

---

## Concepts & Key Learnings

### 🔹 Why Bastion?

- Standard RDP/SSH requires public IP → exposed to attacks
- Bastion provides **secure access via HTTPS (443)**, no other ports exposed
- Analogy: Bastion is like a **guarded gate**, your VM is the house. The house itself is never open to the street.

### 🔹 Dedicated Subnet

- Must be named **`AzureBastionSubnet`**  
- Ensures Azure services know where to deploy Bastion in your VNet  
- Helps isolate Bastion from other workloads

### 🔹 Public IP Allocation

- Public IP is needed to reach Bastion via portal  
- Using **Static allocation** ensures consistent connectivity  
- Secure because **VM itself does not have a public IP**

### 🔹 Security Comparison

| Feature | Bastion | RDP/SSH |
|---------|---------|---------|
| VM Public IP | ❌ No | ✅ Yes |
| Port Exposure | ✅ Only 443 | ✅ Multiple ports |
| Internet Threat | ❌ Minimal | ✅ High |

---

Challenges ⚠️

- Understanding why Bastion needs a dedicated subnet
- Public IP for Bastion seems contradictory to “no public exposure”
- Visualizing network flow from VM → Bastion → Portal
---
Reflections 🚀

First hands-on with Bastion via Bicep
Using analogies helped solidify why Bastion is safer than direct RDP/SSH
Even without deployment, VS Code + Bicep practice is valuable
---
Screenshots

<img width="699" height="468" alt="1" src="https://github.com/user-attachments/assets/e4da62b6-89ac-4a14-94f2-4e3787c82b5a" />
<img width="381" height="463" alt="2" src="https://github.com/user-attachments/assets/acb25aae-bd1a-43d6-acaf-f0fa64fe6f85" /><img width="840" height="466" alt="3" src="https://github.com/user-attachments/assets/91eeb9ff-d779-4c67-92b4-5ced7f7fa0e3" />
<img width="524" height="465" alt="4" src="https://github.com/user-attachments/assets/9eee4d04-98cc-4f59-b43a-ebcdaf8a66d4" />
<img width="1366" height="734" alt="5" src="https://github.com/user-attachments/assets/1088ca50-7ecf-478f-be4c-a24fa3fbc332" />
<img width="1366" height="709" alt="6" src="https://github.com/user-attachments/assets/a3306eb6-8100-48a9-b33c-801739f88dda" />


Brainstorming Questions 💡
- **If a VM has no public IP and no Bastion, how could you access it?**
- **Why do you think Azure forces the subnet name to AzureBastionSubnet?**
- **What would happen if we assign the Bastion IP dynamically instead of static?**
- **Can Bastion scale for multiple VMs in large VNets?**
- **How could you combine NSGs and Bastion for even better security?**
