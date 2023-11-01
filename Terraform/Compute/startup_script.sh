#!/bin/bash
sudo apt-get update

# Install OpenJdk for Jenkins
sudo apt-get install -y -q default-jdk

sudo apt-get install -y -q kubectl
sudo apt-get install -y -q google-cloud-sdk-gke-gcloud-auth-plugin

# Install Docker
sudo apt install -y -q docker.io

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

gcloud container clusters get-credentials privatecluster --region us-east1 --project swift-radar-399606