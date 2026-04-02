# Day 10 – Infrastructure as Code (IaC) with ARM & Bicep

## What I Did
- Studied Infrastructure as Code (IaC) concepts and use cases
- Explored ARM Templates and Bicep language
- Compared ARM (JSON) and Bicep (simplified syntax)
- Watched a demo of deploying a web app using an ARM template
- Installed VS Code and ARM extension to follow along
- Practiced writing ARM template code (simulation)
- Learned Bicep by creating multiple storage accounts using loops
- Wrote Bicep code in VS Code and followed deployment logic
- Reviewed cloud service models (IaaS, PaaS)

---

## Key Takeaways 💡
- IaC allows cloud infrastructure to be deployed using code
- ARM templates use JSON format for defining resources
- Bicep simplifies ARM with cleaner and more readable syntax
- IaC is essential for deploying resources at scale (bulk deployment)
- Automation reduces manual errors and improves consistency

---

## ARM vs Bicep ⚖️

| Feature | ARM Template | Bicep |
|--------|-------------|-------|
| Format | JSON | Cleaner syntax |
| Readability | Complex | Easy to read |
| Use Case | Native Azure IaC | Preferred modern approach |

---

## Example ARM Template 💻

```json
{
  "resources": [
    {
      "type": "Microsoft.Web/sites",
      "name": "myWebApp",
      "apiVersion": "2021-02-01",
      "location": "East US"
    }
  ]
}
## Deeper Understanding 🔍
- IaC connects with Azure CLI and ARM for automated deployments  
- Developers use IaC in CI/CD pipelines for consistent infrastructure  
- Bicep improves productivity by reducing complexity of ARM templates  

---

## Challenges ⚠️
- No actual deployment due to lack of Azure subscription  
- Understanding ARM JSON structure required attention  
- Translating concepts into code was initially challenging  

---

## Notes / Reflection 🚀
- First time writing infrastructure code using VS Code  
- Transitioned from manual setup → command → code  
- This feels like a major step toward real cloud engineering  
