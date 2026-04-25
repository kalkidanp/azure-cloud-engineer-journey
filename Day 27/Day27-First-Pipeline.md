# Day 27 — My First CI/CD Pipeline (YAML)

## Overview 🎯
Today I created my first CI/CD pipeline using YAML.

This is a major step in my journey as I moved from understanding pipelines to actually writing one.

---

## What I Built 🏗️

A simple pipeline that:

- Triggers on code push
- Runs automated steps
- Simulates validation and deployment

---

## Pipeline Structure 🧠

The pipeline includes:

- **Trigger** → Runs when code is pushed to main branch  
- **Pool** → Defines the environment (Ubuntu VM)  
- **Steps** → Executes tasks sequentially  

---

## Example Pipeline 🔄

yaml
trigger:
- main

pool:
  vmImage: 'ubuntu-latest'

steps:
- script: echo "Starting pipeline..."
- script: echo "Validating Bicep..."
- script: echo "Deploying infrastructure..."
- script: echo "Pipeline completed successfully"

---

## How It Works ⚙️
1. Developer pushes code
2. Pipeline is triggered
3. Steps execute in order
4. If any step fails → pipeline stops

---

## Key Learnings 💡
- Pipelines are defined as code using YAML
- Each step runs sequentially
- Failure in one step stops the entire process
- Automation removes manual deployment effort

---
## Screenshot 📸

<img width="667" height="265" alt="1" src="https://github.com/user-attachments/assets/c6233938-660d-4a6f-a943-fb64b7185000" />
<img width="669" height="283" alt="2" src="https://github.com/user-attachments/assets/630fa0e9-612f-4733-968f-8dd3489e15af" />

---

## Reflection 🚀

- This was my first hands-on experience writing a pipeline.

- Even though it was simple, it helped me understand how automation actually works behind the scenes.

- Now I can clearly see how infrastructure and deployment can be automated.

## Next Step 🔥
Connect pipeline to real deployment (Bicep / Azure)
