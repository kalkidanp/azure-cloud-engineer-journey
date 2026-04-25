# Day 29 — Alerts & Observability

## Overview 🎯
Today I learned how systems notify engineers automatically when something goes wrong using alerts.

This builds on monitoring and logging by enabling real-time response to issues.

---

## What is an Alert? 🚨

An alert is a notification triggered when a system metric or condition exceeds a defined threshold.

---

## What Should We Monitor? 👀

### 🔹 System Health
- CPU usage
- Memory
- Disk
- Network

### 🔹 Application Behavior
- Error rates
- Response time
- Request volume

### 🔹 Business Metrics
- Orders
- Logins
- Payments

---

## What is “Too Much”? ⚠️

Thresholds define when something becomes a problem.

Examples:
- CPU > 80% for a sustained time
- Error rate > 5%
- Response time > 2 seconds

💡 Thresholds depend on system capacity and user experience impact.

---

## Who Gets Notified? 📢

- Dev/Ops teams (first responders)
- On-call engineers
- In critical cases: managers or stakeholders

---

## How Alerts Work 🔄

Metric → Threshold → Trigger → Notification

---

## Why Alerts Matter 💡

- Detect issues early
- Reduce downtime
- Enable fast response
- Improve system reliability

---

## Key Learnings 💡

- Monitoring shows system behavior
- Alerts notify when something is wrong
- Thresholds must be carefully defined
- Observability helps maintain system health

---
## Screenshots

<img width="633" height="314" alt="1" src="https://github.com/user-attachments/assets/e1a561cc-f32a-470a-bcdf-94ac2d160a28" />
<img width="562" height="311" alt="2" src="https://github.com/user-attachments/assets/471f67c6-2440-494a-8af1-45fdd7a07d5f" />
<img width="549" height="309" alt="3" src="https://github.com/user-attachments/assets/ef9bdbc1-e61f-424f-a74d-6dd2cbecbabd" />

---

## Reflection 🚀

Today I understood that systems should not be passively observed.

They should actively notify engineers when intervention is needed.

---

## Next Step 🔥

- Combine CI/CD + Monitoring + Alerts into a full workflow
