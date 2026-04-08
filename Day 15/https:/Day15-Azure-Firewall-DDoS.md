# Day 15 – Azure Firewall & DDoS Protection

## Overview 🎯
Focused on understanding advanced network security in Azure by exploring Azure Firewall, Firewall Policies, and DDoS Protection.

This builds on previous knowledge of NSGs by introducing centralized and layered security.

---

## What I Did 🛠️
- Studied Azure Firewall and its role in network-wide security
- Learned about Firewall Policies and how they manage rules
- Compared Azure Firewall with Network Security Groups (NSG)
- Explored Azure Firewall SKUs (basic understanding)
- Learned about DDoS attacks and Azure DDoS Protection
- Explored Azure Firewall Manager (high-level understanding)
- Practiced writing Bicep code to simulate secure architecture
- Understood Firewall subnet requirements and naming conventions

---

## Key Concepts 💡

### 🔥 Azure Firewall
A centralized network security service that controls and monitors traffic across the entire network.

---

### 📜 Firewall Policy
- Acts as the "brain" of the firewall
- Defines rules for traffic filtering
- Can be reused across multiple firewalls

---

### 🆚 NSG vs Firewall

| Feature | NSG | Firewall |
|--------|-----|---------|
| Scope | Subnet / VM | Entire network |
| Complexity | Basic | Advanced |
| Control | Port-based | Application + network level |

---

### 🛡️ DDoS Protection
Protects systems from large-scale traffic attacks that aim to overwhelm and disrupt services.

---

### 🌐 Firewall Subnet
- Must be named: AzureFirewallSubnet
- Required for deploying Azure Firewall

---

## Infrastructure as Code 💻

Implemented using Bicep in VS Code:

- Created Virtual Network (VNet)
- Created Azure Firewall Subnet
- Created Firewall Policy
- Deployed Azure Firewall and attached policy
- Added DDoS Protection Plan and linked it to VNet

---

## Screenshots 🖼️
<img width="535" height="352" alt="1" src="https://github.com/user-attachments/assets/ad13a424-24da-42c3-9b87-c30d05725f0d" />
 <img width="881" height="456" alt="3" src="https://github.com/user-attachments/assets/ea63af36-a9e9-4d9d-b440-719188af83fa" />
<img width="951" height="442" alt="2" src="https://github.com/user-attachments/assets/00983e9e-34b7-408a-8acb-d755eaa753a7" />
<img width="1361" height="721" alt="4" src="https://github.com/user-attachments/assets/9612ce25-68c0-4ca7-a7eb-5d5008df344d" />
<img width="1366" height="681" alt="5" src="https://github.com/user-attachments/assets/a08a16c7-6d2d-48ac-ab0d-e052ae900926" />

---

## Key Learnings 💡
- Security in cloud is layered (NSG + Firewall + DDoS)
- Azure Firewall provides centralized control
- Firewall policies separate logic from infrastructure
- DDoS protection ensures availability under attack

---

## Challenges ⚠️
- Understanding how Firewall differs from NSG required deeper thinking
- Grasping policy structure and its role took time
- Visualizing full architecture needed practice

---

## Notes / Reflection 🚀
- Started thinking in terms of system-wide security
- Realized the importance of layered protection
- This felt closer to real-world cloud architecture design
