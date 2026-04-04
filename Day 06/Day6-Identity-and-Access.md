> This document captures my learning and practical understanding of Azure CLI as part of my cloud engineering journey.
# Day 6 – Identity & Access Management in Azure

## What I Did
- Completed labs on creating and managing users in Microsoft Entra ID
- Explored user properties and identity management
- Studied Azure Role-Based Access Control (RBAC)
- Learned about Azure AD Privileged Identity Management (PIM)
- Explored concepts of managed identities and service principals
- Reviewed cloud service models (IaaS, PaaS, SaaS)
- Watched demonstrations on RBAC and role assignments

## What I Learned 💡
- Microsoft Entra ID manages users and identities in Azure
- Authentication verifies identity, while authorization defines permissions
- RBAC allows assigning roles such as Owner, Contributor, and Reader
- Managed identities allow Azure services to securely access other resources without credentials
- Service principals are used for applications and automation
- Using role IDs instead of role names in scripts ensures stability and avoids errors

## Key Concepts
- **Identity**: User or service accessing resources
- **Authentication**: Verifying identity
- **Authorization**: Granting permissions
- **RBAC**: Role-based access control system
- **Managed Identity**: Secure identity for Azure services
- **Service Principal**: Identity for applications
- **PIM**: Just-in-time privileged access management

## Deeper Understanding 🔍
- Access control is essential for securing cloud environments
- Separating users, roles, and resources improves security and scalability
- Automation scripts should use stable identifiers (role IDs) instead of names

## Screenshots 🖼️
<img width="743" height="418" alt="2" src="https://github.com/user-attachments/assets/4b2ac7dd-b344-4784-9cfe-32aeb2a21dbd" />
<img width="739" height="420" alt="5" src="https://github.com/user-attachments/assets/6c59b7a6-154a-4ad5-bdeb-e36d2d72e0bf" />
<img width="554" height="304" alt="8" src="https://github.com/user-attachments/assets/e84b3462-2aaa-4eb0-9e89-54604d75d51d" />
<img width="553" height="311" alt="6" src="https://github.com/user-attachments/assets/f1c3d4ca-9a2f-4303-a569-a0a48dc58b33" />

## Challenges ⚠️
- Understanding advanced identity concepts like managed identities and service principals
- Confusion around role IDs vs role names in automation scripts

## Notes / Reflection 🚀
- Identity and access management is a critical part of cloud security
- Gained a deeper understanding of how users and services interact securely in Azure
- Feeling more confident in understanding real-world cloud security practices
