# Day 14 – Network Security Groups (NSG)

## Overview 🎯
Focused on understanding how to secure Azure network traffic using Network Security Groups (NSGs).

This includes controlling inbound and outbound traffic, understanding rule evaluation, and applying security concepts in real-world scenarios.

---

## What I Did 🛠️
- Studied Network Security Groups (NSG) in a scenario-based approach
- Learned how NSGs control inbound and outbound traffic
- Understood rule priority and how rules are evaluated
- Explored the concept of the 5-tuple in traffic filtering
- Learned the difference between TCP and UDP using analogies
- Understood where NSGs can be applied (Subnet vs NIC level)
- Practiced writing NSG rules using Bicep in VS Code
- Took screenshots of implementation

---

## Key Concepts 💡

### 🔐 Network Security Group (NSG)
Controls network traffic by allowing or denying traffic based on defined rules.

---

### 🔄 Inbound vs Outbound
- Inbound → Incoming traffic to a resource
- Outbound → Traffic leaving a resource

---

### 🔢 Priority
- Lower number = higher priority
- Rules are evaluated from lowest to highest number

---

### 🔍 5-Tuple
Traffic is evaluated based on:
- Source IP
- Source Port
- Destination IP
- Destination Port
- Protocol (TCP/UDP)

---

### 🌐 TCP vs UDP (Analogy 😄)

- **TCP** → Respectful, waits, confirms delivery  
- **UDP** → Fast and emotional… like a firecracker 💥 (sends without waiting)

---

### 📍 NSG Attachment

#### Subnet Level
- Applies to all resources in the subnet
- Centralized control

#### NIC Level
- Applies to a specific VM
- More granular control

👉 If both are applied:
Both must allow traffic, otherwise it is denied

---

## Infrastructure as Code 💻

Implemented NSG using Bicep:

- Created NSG resource
- Defined inbound rules (Allow + Deny)
- Controlled traffic using ports and priorities

---

## Screenshots 🖼️

<img width="955" height="506" alt="5" src="https://github.com/user-attachments/assets/b5d8dbf4-cee4-4920-8654-e64cf14284c6" />
<img width="481" height="385" alt="1" src="https://github.com/user-attachments/assets/1720a5c0-7e32-44dd-95e0-d89c9cd7626a" />
<img width="488" height="416" alt="2" src="https://github.com/user-attachments/assets/8fc0a4df-ee88-455d-bf4d-616696a7bfa9" />   <img width="737" height="205" alt="3" src="https://github.com/user-attachments/assets/0b9550ea-b790-495b-8c4e-a88ea6c9e584" />
<img width="729" height="286" alt="4" src="https://github.com/user-attachments/assets/fffc87e9-cc28-475c-b4c4-eafb148d8e3e" />

---

## Key Learnings 💡
- Security is a critical part of cloud architecture
- NSGs act as a traffic filter for resources
- Rule priority and evaluation are essential to understand
- TCP and UDP behave differently in communication

---

## Challenges ⚠️
- Understanding rule evaluation order required focus
- Translating scenarios into rules took practice

---

## Notes / Reflection 🚀
- Learned how to think about security, not just create resources
- Realized how important traffic control is in cloud systems
- This day strengthened my understanding of networking deeply
