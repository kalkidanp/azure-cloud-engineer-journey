# Day 26 — Azure DevOps & Pipelines Basics

## Overview 🎯
Today I explored Azure DevOps and understood how CI/CD pipelines are structured and executed.

This builds on Day 25 by moving from CI/CD concepts to practical workflow understanding.

---

## What is Azure DevOps? ⚙️

Azure DevOps is a Microsoft platform used for:
- Planning (Boards)
- Code management (Repos)
- Building and deploying applications (Pipelines)

---

## What is a Pipeline? 🔄

A pipeline is a series of automated steps that take code from development to deployment.

It ensures that every change is:
- Built
- Tested
- Deployed

---

## Pipeline Flow 🧠

Trigger → Build → Test → Deploy → Monitor

---

## Pipeline Triggers 🚀

Pipelines can start in multiple ways:

- Code push (e.g., GitHub)
- Manual trigger
- Scheduled trigger

---

## What Happens If Pipeline Fails? ⚠️

- Execution stops at the failed stage
- Logs are generated for debugging
- Developer reviews and fixes the issue
- Pipeline is re-run

---

## YAML in Pipelines 📄

Pipelines are written using YAML.

### Why YAML?

- Human-readable
- Version control friendly
- Easy to track changes
- Enables Infrastructure as Code approach

---

## Key Learnings 💡

- Pipelines automate the full lifecycle of code
- Failures are controlled and traceable
- YAML allows pipelines to be defined as code
- CI/CD ensures consistency and reliability

---
## Screenshots 
<img width="669" height="313" alt="1" src="https://github.com/user-attachments/assets/f2f89cbd-d593-4c72-ab2c-b3ff64e380b2" />
<img width="641" height="310" alt="2" src="https://github.com/user-attachments/assets/340a1a86-36a6-47f3-aeac-755ddf943757" />
<img width="461" height="303" alt="3" src="https://github.com/user-attachments/assets/2fdb0f5f-046a-4ae5-832f-0e0ff6979c75" />
<img width="447" height="308" alt="4" src="https://github.com/user-attachments/assets/cf45a954-8ad1-4cb2-9613-c883aea502d7" />

---

## Reflection 🚀

Today I understood how modern systems are built and deployed using automated workflows.

Instead of manual processes, pipelines ensure everything runs in a structured and repeatable way.

---

## Next Step 🔥

- Build a simple pipeline (YAML)
