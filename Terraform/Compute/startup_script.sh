#!/bin/bash
sudo apt-get update

sudo apt-get install kubectl
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin

# Install Docker
sudo apt install -y docker.io

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# gcloud container clusters get-credentials privatecluster --region us-east1 --project swift-radar-399606

# git clone https://github.com/Mostafaa-Elkhouly/Google-Cloud-ITI-Project.git
# docker build -t node-app .
# docker tag node-app us-central1-docker.pkg.dev/swift-radar-399606/my-repo/node-app
# gcloud auth configure-docker us-central1-docker.pkg.dev
# docker push us-central1-docker.pkg.dev/swift-radar-399606/my-repo/node-app

# sudo docker pull mongo:5.0.15
# docker tag mongo:5.0.15 us-central1-docker.pkg.dev/swift-radar-399606/my-repo/mongo:5.0.15
# docker push us-central1-docker.pkg.dev/swift-radar-399606/my-repo/mongo:5.0.15

# docker pull cvallance/mongo-k8s-sidecar
# docker tag cvallance/mongo-k8s-sidecar us-central1-docker.pkg.dev/swift-radar-399606/my-repo/cvallance/mongo-k8s-sidecar
# docker push us-central1-docker.pkg.dev/swift-radar-399606/my-repo/cvallance/mongo-k8s-sidecar

# openssl rand -base64 768 > keyfile.txt
# docker build -t mongodb .
# docker tag mongodb us-central1-docker.pkg.dev/swift-radar-399606/my-repo/mongodb
# gcloud auth configure-docker us-central1-docker.pkg.dev
# docker push us-central1-docker.pkg.dev/swift-radar-399606/my-repo/mongodb