# 🚀 Sample App: Docker-Based Deployment on AWS EC2

This project demonstrates a **Professional DevOps practice workflow**: deploying a simple static web app (`index.html`) inside a **Dockerized Nginx Container** on an **AWS EC2 Ubuntu Server**.  
It includes a `deploy.sh` script for smooth redeployment.  

---

## 🛠️ Tech Stack
- **AWS EC2** (Ubuntu)
- **Git + GitHub**
- **Docker + Nginx**
- **Bash Script for Deployment**

---

## 📂 Project Structure
```plaintext
sample-app/
├── Dockerfile
├── index.html
├── deploy.sh
└── README.md

⚙️ Setup Instructions
1. Connect to AWS EC2
	ssh -i your-key.pem ubuntu@<EC2-PUBLIC-IP>

2. Install Docker
	sudo apt update
	sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
	sudo apt update
	sudo apt install docker-ce -y
	sudo systemctl enable docker
	sudo systemctl start docker

3. Clone the Repository
	cd /home/ubuntu
	git clone git@github.com:<username>/sample-app.git
	cd sample-app

4. Create index.html
	echo '<h1>Hello from AWS EC2 Docker Deployment!</h1>' > index.html

5. Create Dockerfile
	FROM nginx:latest
	COPY index.html /usr/share/nginx/html/index.html

6. Build & Run the Container
	docker build -t sample-app:latest .
	docker run -d -p 80:80 --name sample-app sample-app:latest

Visit: http://<EC2-PUBLIC-IP>

7. Automate with deploy.sh
	#!/bin/bash
	cd /home/ubuntu/sample-app
	git pull origin main

	# Stop and remove old container
	docker stop sample-app || true
	docker rm sample-app || true

	# Build and run new container
	docker build -t sample-app:latest .
	docker run -d -p 80:80 --name sample-app sample-app:latest

Make it executable:
	chmod +x deploy.sh

Run deployment:
	./deploy.sh


