# Day 23 — Advanced Architecture Design (Multi-Backend System)

## Overview 🎯
Today I extended my architecture design by introducing multiple backend services and implementing a more realistic traffic flow using Azure Application Gateway.

This marks a shift from basic architecture to multi-service system design.

---

## What I Built 🏗️

A secure and structured architecture including:

- Application Gateway (Layer 7 routing)
- Two backend subnets:
  - API Subnet
  - Image Subnet
- Separate Network Security Groups for each backend
- Backend NICs simulating compute resources
- Azure Bastion for secure VM access
- Storage Account with Private Endpoint
- Private DNS for internal resolution

---

## Architecture Flow 🔄

User → Application Gateway  
        → API Backend  
        → Image Backend  
              ↓  
           Storage (Private Endpoint)

---

## Key Design Improvements 💡

### 🔀 Backend Separation
- API and Image services separated into different subnets
- Enables scalability and independent control

---

### 🌐 Application Gateway Design
- Introduced backend pools for different services
- Learned that each routing rule must map to a single backend pool
- Understood limitation of Basic routing vs Path-based routing

---

### 🔐 Security Layers
- NSG applied separately for API and Image subnets
- Prevents unauthorized access

---

### 🔒 Private Data Access
- Storage secured via Private Endpoint
- DNS ensures internal resolution

---

### 🔑 Secure Administration
- Azure Bastion used instead of exposing VMs publicly

---

## Key Learnings 💡
- Real architectures use multiple backend services
- Application Gateway routing rules have strict structure
- Each backend pool must be handled independently
- Small syntax mistakes can break deployments

---
## Screenshots
<img width="671" height="269" alt="1" src="https://github.com/user-attachments/assets/203f6cb0-069e-45b1-9c69-f30cacb2b9a1" />
<img width="364" height="308" alt="2" src="https://github.com/user-attachments/assets/5c09921d-d027-4467-a541-6c9078225b15" />

---
## Challenges ⚠️
- Handling multiple backend pools and routing rules
- Understanding Application Gateway constraints
- Debugging Bicep structural errors

---

## Notes / Reflection 🚀
- This was my most complex architecture so far
- Helped me think like a system designer
- I learned more from fixing errors than writing the code itself

---

## Brainstorming Questions 💭
- How can path-based routing be fully implemented?
- Should API and image services scale independently?
- Where would monitoring and logging fit in this system?

