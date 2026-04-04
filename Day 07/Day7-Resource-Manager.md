> This document captures my learning and practical understanding of Azure CLI as part of my cloud engineering journey.
# Day 7 – Azure Resource Manager & Resource Groups

## What I Did
- Studied Azure Resource Manager (ARM) and Resource Groups
- Learned the basic idea of ARM templates and deployment modes
- Watched demonstrations on creating Resource Groups in Azure
- Explored how resources are organized and managed in real-world scenarios

## What I Learned 💡
- Azure Resource Manager (ARM) is the management layer used to deploy and manage resources
- Resource Groups act as containers that organize related resources
- Deleting a Resource Group removes all resources inside it
- ARM templates allow automated deployment of resources
- Deployment modes (Incremental and Complete) control how resources are updated

## Key Concepts
- **ARM**: Central management system in Azure
- **Resource Group**: Logical container for resources
- **ARM Template**: JSON-based file used to automate resource deployment
- **Incremental Mode**: Adds/updates resources without deleting existing ones
- **Complete Mode**: Deletes resources not defined in the template

## Deeper Understanding 🔍
- Grouping resources helps manage lifecycle, cost, and organization
- Resource Groups can represent environments like Dev, Test, and Production
- ARM enables consistent and repeatable deployments
## Screenshots
<img width="858" height="375" alt="1" src="https://github.com/user-attachments/assets/89a57e91-6e1d-47fa-a972-3b0d8bce3ada" />
<img width="763" height="435" alt="2" src="https://github.com/user-attachments/assets/1a17b8f1-7b64-4e95-8ab2-de6ee0d3b254" />
<img width="705" height="429" alt="3" src="https://github.com/user-attachments/assets/185ede7d-bfe3-4810-8be4-86f7d4766257" />

## Challenges ⚠️
- No direct hands-on lab for Resource Groups
- Needed to rely on videos and conceptual understanding

## Notes / Reflection 🚀
- Understanding how resources are structured helped me connect all previous topics (VM, Storage, Networking)
- Moving from learning individual services to understanding system organization
