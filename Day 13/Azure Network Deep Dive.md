# 🌐 Day 13 – Azure Network Deep Dive

## 🎯 Objective
To understand how a Virtual Machine (VM) connects to the internet in Microsoft Azure, including IP addressing, Virtual Networks, and Subnets.

---

## 🧠 Key Concepts

### 🌍 Public vs Private IP Address

#### 🔹 Private IP
- Assigned to resources داخل Virtual Network (VNet)
- Used for **internal communication**
- Example: `10.0.1.4`
- Not accessible from the internet

#### 🔹 Public IP
- Used for **external communication**
- Required to access VM from internet (SSH/RDP)
- Mapped to the VM’s private IP

---

### 🧩 Virtual Network (VNet)

A **Virtual Network (VNet)** is the foundation of networking in Azure.

- It is a logically isolated network
- Similar to a traditional network in a data center
- Contains subnets and resources (VMs, storage, etc.)

Example:
VNet Address Space: 10.0.0.0/16

---

### 🧱 Subnet

A **Subnet** is a smaller network inside a VNet.

#### 📌 Purpose:
- Organize resources
- Isolate workloads
- Apply security controls (NSG later)

Example:
Subnet Address Range: 10.0.1.0/24


---

## 🔄 Traffic Flow (VERY IMPORTANT)

### 📥 Inbound Traffic (Internet → VM)
Internet
↓
Public IP
↓
Azure Virtual Network (VNet)
↓
Subnet
↓
Virtual Machine (Private IP)

### 📤 Outbound Traffic (VM → Internet)
Virtual Machine (Private IP)
↓
Subnet
↓
Virtual Network (VNet)
↓
Public IP / NAT
↓
Internet

---

## 🔍 Key Observations

- VM always operates using a **Private IP internally**
- Public IP acts as an **entry point from the internet**
- Without Public IP:
  - VM cannot be accessed directly from internet
  - But it can still communicate internally

---

## 🧪 Practical Exercise

### ✔ What I Did:

- Created a Virtual Network:
  - Address Space: `10.0.0.0/16`
- Created a Subnet:
  - Address Range: `10.0.1.0/24`
- Deployed a Virtual Machine inside the subnet
- Enabled Public IP

### ✔ What I Observed:

- VM received a Private IP automatically
- Public IP allowed external access
- Removing Public IP blocks external connectivity

---

## 📸 Screenshots
<img width="658" height="464" alt="2" src="https://github.com/user-attachments/assets/09d4803b-bb9a-488a-9e0a-f11e979f4150" />
<img width="576" height="375" alt="3" src="https://github.com/user-attachments/assets/413adb84-1069-401f-8e8d-f6a2cb454440" />
![Uploading vs.png…]()

---

## ❓ Self-Assessment

- Can a VM work without Public IP?  
  👉 Yes, but only for internal communication

- Where is the VM actually located?  
  👉 Inside a Subnet within a VNet

---

## 💡 Reflection

Today I learned that cloud networking is not just about creating resources,  
but understanding how communication flows securely between them.

This is the foundation for designing secure and scalable cloud architectures.
