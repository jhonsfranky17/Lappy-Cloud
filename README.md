# 🌩️ Cloud Infrastructure on Fedora — Virtualization, Containers & Load Balancing

![VMware Fusion](https://img.shields.io/badge/Virtualization-VMware%20Fusion-blue)
![Fedora](https://img.shields.io/badge/OS-Fedora-informational)
![Docker](https://img.shields.io/badge/Containerization-Docker-blue)
![Nginx](https://img.shields.io/badge/Load%20Balancer-Nginx-green)
![License](https://img.shields.io/badge/License-MIT-yellow)
![Project Status](https://img.shields.io/badge/Status-Complete-brightgreen)

---

## 🧾 Overview

This project demonstrates how to build a **complete mini cloud infrastructure** from scratch using **Fedora VMs on VMware Fusion**, combining the power of **virtualization**, **networking**, **containerization**, and **load balancing**.

You’ll deploy:
- 🖥️ **3 Application Servers** (Dockerized Node.js apps)
- 🌐 **1 Load Balancer Server** (Nginx reverse proxy using round-robin)
- 💻 **macOS host** (Access via SSH port forwarding)

---

## 🧱 Architecture

                  ┌─────────────────────────────────────
                  │      macOS Host Machine             │
                  │  (Access via http://localhost:8080)
                  └────────────┬───────────────┘
                               │ SSH Port Forwarding
                               ▼
                 ┌───────────────────────────┐
                 │     Load Balancer VM LB    │
                 │   IP: 172.16.137.132       │
                 │   Nginx (Reverse Proxy)    │
                 └────────────┬───────────────┘
      ┌────────────────────┬───────────────┬────────────────────┐
      ▼                    ▼               ▼
┌────────────┐     ┌────────────┐     ┌────────────┐
│ App Server 1│     │ App Server 2│     │ App Server 3│
│172.16.137.133│    │172.16.137.134│    │172.16.137.135│
│Docker + Node.js│  │Docker + Node.js│  │Docker + Node.js│
│“Hello from 1” │  │“Hello from 2” │  │“Hello from 3” │
└────────────┘     └────────────┘     └────────────┘

