# Day 20 — Azure Application Gateway (Layer 7 Routing)

## Overview 🎯
Today I explored Azure Application Gateway and how it enables intelligent traffic routing at the application level (Layer 7).

This builds on Day 19 (Load Balancer) by introducing content-based routing instead of simple traffic distribution.

---

## What I Did 🛠️
- Studied Azure Application Gateway and its purpose
- Understood Layer 7 (application layer) routing
- Learned the difference between Load Balancer and Application Gateway
- Explored features like path-based routing and listeners
- Identified the requirement of a **dedicated subnet**
- Practiced writing a more complete Bicep configuration in VS Code
- Tried to understand the internal structure (frontend, listener, gateway IP config)

---

## Key Concepts 💡

### 🌐 Application Gateway
A web traffic load balancer that enables routing based on URL paths, hostnames, and HTTP/HTTPS properties.

---

### 🧠 Layer 7 Routing
Unlike Load Balancer (Layer 4), Application Gateway:
- Understands HTTP/HTTPS traffic
- Routes requests based on content (URL, path)

---

### 🆚 Load Balancer vs Application Gateway

| Feature | Load Balancer | Application Gateway |
|--------|--------------|--------------------|
| Layer | 4 | 7 |
| Routing | IP/Port | URL/Path |
| Use Case | Traffic distribution | Smart routing |

---

### 🧩 Key Components

- **Gateway IP Configuration** → Connects App Gateway to subnet  
- **Frontend IP** → Entry point  
- **Frontend Port** → Defines port (80/443)  
- **Listener** → Waits for incoming requests  

---

### 🚨 Dedicated Subnet Requirement

- Application Gateway must be deployed in its own subnet  
- Cannot share subnet with other resources  

👉 Reason:
- Ensures performance, isolation, and proper traffic control  

---

## Key Learnings 💡
- Application Gateway adds intelligence to traffic routing
- It works at application level, not just network level
- Dedicated subnet requirement is critical for proper deployment
- Structure is more complex compared to Load Balancer

---
## Screenshots 
<img width="290" height="293" alt="1" src="https://github.com/user-attachments/assets/c7dc7db1-c9cf-42fe-9953-036d76320bff" />
<img width="317" height="292" alt="4" src="https://github.com/user-attachments/assets/04b21fc5-6e26-4178-a369-a84bc7931b85" />
<img width="258" height="299" alt="5" src="https://github.com/user-attachments/assets/4c2c914d-2115-415b-b05a-c12f0a97ca54" />

---
## Challenges ⚠️
- Understanding internal structure (listener, frontend config, gateway config)
- Realizing why a dedicated subnet is required
- Moving from basic routing (LB) to intelligent routing (App Gateway)

---

## Notes / Reflection 🚀
- This felt like a major step into real-world architecture design
- Understanding the “why” behind subnet isolation made the concept clearer
- Writing a more complete Bicep file improved my confidence in IaC

---

## Brainstorming Questions 💭
- When should we use Load Balancer vs Application Gateway?
- Why does Application Gateway require deeper configuration?
- How does path-based routing improve system design?
- What could go wrong if App Gateway shares a subnet?
