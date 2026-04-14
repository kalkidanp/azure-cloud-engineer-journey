# Day 18 — DNS & Name Resolution in Azure

## Overview 🎯
Today I explored one of the most fundamental concepts in cloud networking: **DNS (Domain Name System)** and how it plays a critical role in Azure architectures, especially when working with Private Endpoints.

---

## What I Did 🛠️
- Studied how DNS translates domain names into IP addresses
- Understood the role of DNS in Azure networking
- Explored **Private DNS Zones** and how they integrate with VNets
- Connected DNS concepts with **Private Endpoint (Day 17)**
- Practiced Bicep code in VS Code (stored separately in repository)
- Visualized traffic flow using real-world analogies
- Understood how incorrect DNS setup can break private connectivity

---
## Screenshots
<img width="808" height="627" alt="1" src="https://github.com/user-attachments/assets/1d4aeb2e-8965-4793-882c-8a9907ce0bcc" />
<img width="1366" height="712" alt="2" src="https://github.com/user-attachments/assets/32b15cbf-d97a-414c-b7c0-fbc91b685920" />

---

## Key Concepts 💡

### 🌐 DNS (Domain Name System)
DNS converts human-readable names into machine-readable IP addresses.

👉 Example:
`storageaccount.blob.core.windows.net` → IP address

---

### 🔒 Private DNS Zone
- Used for internal name resolution inside a Virtual Network
- Ensures traffic is routed privately instead of going to the internet

---

### 🔗 DNS + Private Endpoint (Critical Connection)

- Private Endpoint gives a **private IP**
- DNS ensures the service name resolves to that **private IP**

👉 Without DNS:
Traffic may still go to public IP ❌

---

### 🌍 Public vs Private Resolution

| Type | Result |
|------|--------|
| Public DNS | Resolves to public IP |
| Private DNS | Resolves to private IP |

---

## Key Learnings 💡
- DNS is not just a basic concept — it controls **where traffic goes**
- Private Endpoint depends heavily on proper DNS configuration
- Azure manages internal routing through its backbone network
- Misconfigured DNS can completely break a secure architecture

---

## Challenges ⚠️
- Understanding why Private Endpoint alone is not enough
- Visualizing how DNS redirects traffic internally
- Connecting naming resolution with actual network flow

---

## Notes / Reflection 🚀
- This felt like a “missing puzzle piece” in cloud networking
- Helped connect networking, security, and architecture together
- Taking a short break before this helped me come back with a clearer understanding

---

## Brainstorming Questions 💭
- What happens if Private Endpoint exists but DNS is not configured?
- How does Azure decide whether to use public or private resolution?
- Why is DNS considered critical in secure cloud architectures?
