
# Day 19 — Azure Load Balancer

## Overview 🎯
Today I explored how Azure handles traffic distribution using Load Balancers to ensure high availability and scalability.

This marks a shift from just securing systems to making them reliable and able to handle real-world traffic.

---

## What I Did 🛠️
- Studied Azure Load Balancer and its purpose
- Understood how traffic is distributed across multiple VMs
- Learned the difference between Public and Internal Load Balancer
- Explored key components like frontend IP, backend pool, health probe, and rules
- Practiced Bicep code in VS Code (stored separately in repository)
- Used analogies to visualize traffic distribution

---

## Screenshots
<img width="580" height="301" alt="4" src="https://github.com/user-attachments/assets/1aa76455-de22-4452-ac3b-044551ea680f" />
<img width="293" height="304" alt="5" src="https://github.com/user-attachments/assets/67e1b564-7b03-49fa-bd20-8fd7385959e9" />

---

## Key Concepts 💡

### ⚖️ Load Balancer
A service that distributes incoming traffic across multiple backend resources to ensure no single resource is overwhelmed.

---

### 🌍 Public vs 🔒 Internal Load Balancer

| Type | Purpose |
|------|--------|
| Public | Handles internet traffic |
| Internal | Handles internal VNet traffic |

---

### 🧩 Key Components

- **Frontend IP** → Entry point for incoming traffic  
- **Backend Pool** → Set of VMs handling requests  
- **Health Probe** → Checks if a VM is healthy  
- **Rules** → Define how traffic is distributed  

---

## Key Learnings 💡
- Load Balancer improves availability and performance
- It prevents single points of failure
- It is not a security tool, but a reliability tool
- Health probes are critical to ensure traffic is sent only to healthy resources

---

## Challenges ⚠️
- Understanding how traffic is actually distributed behind the scenes
- Visualizing backend pools and health checks
- Differentiating clearly between availability vs security services

---

## Notes / Reflection 🚀
- This felt like a shift from “learning services” to “designing systems”
- Helped me understand how real-world applications handle large traffic
- Made me think about scalability and fault tolerance more deeply

---

## Brainstorming Questions 💭
- What happens if one VM in the backend pool fails?
- How does Azure decide which VM gets the next request?
- Why is a health probe important in load balancing?
- Can a system be secure but still fail without a load balancer?
