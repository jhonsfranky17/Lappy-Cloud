# 🌩️ Cloud Infrastructure on Fedora : Virtualization, Containers & Load Balancing

![VMware Fusion](https://img.shields.io/badge/Virtualization-VMware%20Fusion-blue)
![Fedora](https://img.shields.io/badge/OS-Fedora-informational)
![Docker](https://img.shields.io/badge/Containerization-Docker-blue)
![Nginx](https://img.shields.io/badge/Load%20Balancer-Nginx-green)
![License](https://img.shields.io/badge/License-MIT-yellow)
![Project Status](https://img.shields.io/badge/Status-Complete-brightgreen)


## 🧾 Overview

This project simulates a mini cloud environment entirely on your local system.
It demonstrates how core cloud computing components — **virtualization, networking, containerization, and load balancing**, work together to deliver scalable web applications.

Using VMware Fusion and Fedora VMs, this setup builds:

- 🖥️ **3 Application Servers** (Dockerized Node.js apps)
- 🌐 **1 Load Balancer Server** (Nginx reverse proxy using round-robin)
- 💻 **Host** (Access via SSH port forwarding)


## 💡 Why This Project

This repository is perfect for:

- Students & developers learning Cloud Computing fundamentals
- Demonstrating virtualized multi-tier architectures
- Practicing Docker, Nginx, and Linux server management
- Creating a local cloud simulation without any cloud provider account


## 📜 License

MIT License — free to use and modify for educational and professional purposes.


## 🧱 Architecture

![Architecture](./assets/architecture.png)


## 🧱 Technologies Used

| Layer                 | Technology          | Purpose                                   |
| --------------------- | ------------------- | ----------------------------------------- |
| **Virtualization**    | VMware Fusion       | Creates isolated Fedora VMs               |
| **Operating System**  | Fedora              | Lightweight, stable Linux base            |
| **Networking**        | NAT (VMware)        | Private subnet for inter-VM communication |
| **Application Layer** | Node.js + Express   | Simple web server in Docker               |
| **Containerization**  | Docker              | Isolates app environments                 |
| **Load Balancing**    | Nginx               | Distributes traffic across app containers |
| **Access**            | SSH Port Forwarding | Exposes internal LB to host browser       |


## 🚀 Features

- Fully automated setup scripts (setup_app.sh, setup_lb.sh)
- Minimal configuration — works out-of-the-box
- Each app server runs a Dockerized Node.js container
- Nginx load balancer automatically routes traffic round-robin
- Tested on Fedora 43 with VMware Fusion NAT networking
- Works seamlessly with macOS terminal + browser access


## 🧾 Learning Outcomes

By the end of this project, you’ll understand:

- How VMs communicate inside a NAT network
- How to deploy and isolate web apps in Docker containers
- How a reverse proxy load balancer distributes incoming traffic
- How to connect a local machine to internal cloud networks securely via SSH tunneling


## 🧰 Prerequisites

- VMware Fusion installed on host

- 4 Fedora VMs (1 LB + 3 App Servers)

- Each VM connected via NAT Network (so they can reach each other)

- SSH access between VMs enabled


## ⚙️ Step 1 — App Server Setup

Each App VM runs Docker and Node.js inside a container.
You can automate everything using this script.

***Refer setup_app.sh***


## 🧩 Usage

chmod +x setup_app.sh
./setup_app.sh "Hello from App Server 1"

## Run similar on App Server 2 and 3 with custom messages.


## ⚙️ Step 2 — Load Balancer Setup

Refer setup_lb.sh


## 🧠 Step 3 — Testing from macOS

Forward your Mac port 8080 to LB’s port 80:

ssh -L 8080:localhost:80 (vm-name)@172.16.137.132

Then open your browser at:
http://localhost:8080

Keep refreshing — you’ll see:

Hello from App Server 1
Hello from App Server 2
Hello from App Server 3

