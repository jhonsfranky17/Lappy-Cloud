#!/bin/bash
# ---------------------------------------------------------------------
# Load Balancer Setup Script for Fedora
# Installs Nginx and configures round-robin proxy for the App Servers
# ---------------------------------------------------------------------

echo "Starting Load Balancer setup..."

# 1️⃣ Update system & install Nginx
sudo dnf -y update
sudo dnf -y install nginx
sudo systemctl enable --now nginx

# 2️⃣ Create load-balancer config
sudo tee /etc/nginx/conf.d/loadbalancer.conf > /dev/null <<EOF
upstream app_servers {
    server 172.16.137.133;
    server 172.16.137.134;
    server 172.16.137.135;
}

server {
    listen 80;
    location / {
        proxy_pass http://app_servers;
    }
}
EOF

# 3️⃣ Restart Nginx
sudo nginx -t && sudo systemctl restart nginx

echo "Nginx Load Balancer setup complete!"
echo "Access via: http://localhost:8080 (from your host)"
