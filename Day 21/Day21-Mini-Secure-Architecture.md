# Day 21 — Mini Secure Architecture in Azure

## Overview 🎯
Today I combined multiple Azure services into a single architecture to understand how real-world cloud systems are designed.

This marks a transition from learning individual components to building a complete, secure, and structured system.

---

## What I Built 🏗️
A mini secure architecture including:

- Virtual Network (VNet)
- Multiple Subnets:
  - Application Gateway Subnet
  - Backend Subnet
  - Azure Bastion Subnet
  - Private Endpoint Subnet
- Application Gateway (entry point)
- Network Security Group (backend protection)
- Azure Bastion (secure admin access)
- Storage Account with Private Endpoint
- Private DNS Zone for internal resolution

---

## Architecture Flow 🔄

User → Application Gateway → Backend (VM) → Storage (Private Endpoint)

- External traffic is controlled via Application Gateway  
- Backend is protected using NSG  
- Storage is accessed privately using Private Endpoint  
- DNS ensures correct internal routing  
- Admin access is secured through Bastion  

---

## Key Design Decisions 💡

### 🌐 Application Gateway in Dedicated Subnet
- Ensures isolation and proper traffic control  
- Avoids conflicts with other resources  

---

### 🔐 NSG on Backend Subnet
- Restricts access to only trusted sources (e.g., App Gateway)  
- Blocks direct internet access  

---

### 🔒 Private Endpoint for Storage
- Eliminates public exposure  
- Keeps traffic within Azure network  

---

### 🔑 Bastion Instead of Public IP
- Secure VM access over HTTPS (port 443)  
- No need to expose RDP/SSH ports  

---

### 🌐 Private DNS Integration
- Ensures services resolve to private IPs  
- Enables Private Endpoint to function correctly  

---

## Key Learnings 💡
- Real cloud architecture is about combining services, not using them in isolation
- Security, availability, and routing must work together
- Small design decisions (like subnet separation) have major impact
- DNS plays a critical role in private connectivity

---
## Screenshots
<img width="671" height="230" alt="1" src="https://github.com/user-attachments/assets/415524c5-8a1f-48a0-96cf-e1d50c6d6b89" />
<img width="332" height="295" alt="2" src="https://github.com/user-attachments/assets/0ca97cf4-9ada-48f4-8c9b-4737c067c6c5" />

---
## Challenges ⚠️
- Connecting all services logically
- Understanding dependencies between components
- Visualizing traffic flow across the architecture

---

## Notes / Reflection 🚀
- This felt like a major milestone in my learning journey
- Helped me move from “what is this service?” to “how do they work together?”
- Writing connected Bicep improved my understanding of real deployments

---

## Brainstorming Questions 💭
- How would this architecture scale for production?
- Where would Azure Firewall fit in this design?
- How can monitoring and logging be integrated?
- What changes are needed for high availability?
