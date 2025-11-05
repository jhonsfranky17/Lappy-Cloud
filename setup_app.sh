#!/bin/bash
# ---------------------------------------------------------------------
# App Server Setup Script for Fedora
# Installs Docker, builds a Node.js container, and runs it on port 80
# ---------------------------------------------------------------------

APP_NAME="myapp"
APP_MESSAGE=${1:-"Hello from App Server"}

echo "Starting App Server setup..."

# 1️⃣ Update system
sudo dnf -y update

# 2️⃣ Install dependencies & Docker repo
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repos https://download.docker.com/linux/fedora/docker-ce.repo

# 3️⃣ Install Docker and start service
sudo dnf -y install docker-ce docker-ce-cli containerd.io
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

# 4️⃣ Create app directory
mkdir -p ~/myapp
cd ~/myapp || exit

# 5️⃣ Create package.json and server.js
cat > package.json <<EOF
{
  "name": "myapp",
  "version": "1.0.0",
  "main": "server.js",
  "dependencies": {
    "express": "^4.18.2"
  }
}
EOF

cat > server.js <<EOF
const express = require('express');
const app = express();
const PORT = 80;
app.get('/', (req, res) => res.send('${APP_MESSAGE}'));
app.listen(PORT, '0.0.0.0', () => console.log('Running on port ' + PORT));
EOF

# 6️⃣ Create Dockerfile
cat > Dockerfile <<EOF
FROM node:18
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY server.js ./
EXPOSE 80
CMD ["node", "server.js"]
EOF

# 7️⃣ Build & run Docker container
sudo docker build -t ${APP_NAME}:latest .
sudo docker rm -f ${APP_NAME} 2>/dev/null
sudo docker run -d -p 80:80 --name ${APP_NAME} ${APP_NAME}:latest

# 8️⃣ Enable auto-restart policy
sudo docker update --restart always ${APP_NAME}

echo "App Server setup complete! Check with : curl http://localhost"
