#!/bin/bash

# Update system packages
sudo apt update -y
sudo apt install -y curl wget apt-transport-https conntrack

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Verify kubectl installation
kubectl version --client

# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
sudo apt install docker.io
# Verify Minikube installation
sudo usermod -aG docker $USER && newgrp docker

minikube version
kubectl version 
docker --version

# Start Minikube using Docker as the driver
minikube start --driver=docker

# Check Minikube status
minikube status

# Enable kubectl to interact with Minikube cluster
kubectl get nodes


docker build -t fastapi-app:v1 .
docker push fastapi-app:v1

# docker run -d -p 8000:8000 fastapi-app:v1
