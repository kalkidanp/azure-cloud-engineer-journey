# Day 22 — Azure Storage Deep Dive (Blob Storage)

## Overview 🎯
Today I explored Azure Storage with a focus on Blob Storage and how data is securely stored and accessed in cloud environments.

This builds on previous days by connecting storage with Private Endpoint and DNS for secure architecture design.

---

## What I Did 🛠️
- Studied Azure Storage Account and Blob Storage
- Differentiated types of blobs and their use cases
- Understood storage structure (Account → Container → Blob)
- Explored access levels and security configurations
- Practiced Bicep code in VS Code (stored separately)
- Connected storage with Private Endpoint and DNS
- Used analogies to better understand data access flow

---

## Key Concepts 💡

### 📦 Blob Storage
Used to store unstructured data such as:
- Images
- Videos
- Documents
- Backups

---

### 🧱 Storage Structure

Storage Account  
→ Container  
→ Blob (file)

---

### 🔓 Access Levels

- Private → secure, no public access  
- Blob → public read access for blobs  
- Container → full public access  

👉 Best practice: **Keep storage private**

---

## Security 🔐

### ❌ Public Access
- Data exposed to internet  
- Not recommended for sensitive systems  

---

### ✔ Private Endpoint
- Storage accessed through private IP  
- Traffic stays inside Azure network  

---

### 🌐 DNS Integration
- Ensures storage resolves to private IP  
- Critical for Private Endpoint functionality  

---

## Key Learnings 💡
- Storage is not just about saving data, but securing it
- Private Endpoint + DNS ensures private communication
- Public access can expose sensitive data if not controlled
- Storage plays a central role in architecture design

---
## Screenshots
<img width="612" height="293" alt="1" src="https://github.com/user-attachments/assets/ca097066-fd00-44e9-bc8e-fd7ba166f764" />
<img width="569" height="296" alt="2" src="https://github.com/user-attachments/assets/d086bfa1-79c6-4b3c-b6c1-fb8eff8ea9d2" />

---
## Challenges ⚠️
- Understanding different blob types and use cases
- Connecting storage with networking concepts
- Visualizing secure data flow

---

## Notes / Reflection 🚀
- This deepened my understanding of how data is handled in cloud systems
- Thinking in analogies helped me understand access and security better
- Helped me connect storage with overall architecture design

---

## Brainstorming Questions 💭
- What happens if storage is public in a production system?
- How does DNS affect storage access in private architecture?
- When should we allow public access to storage?
- How can storage security be strengthened further?
