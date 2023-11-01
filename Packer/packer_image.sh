#!/bin/bash

export PROJECT=$(gcloud info --format='value(config.project)')
cat > jenkins-agent.json <<EOF
{
  "builders": [
    {
      "type": "googlecompute",
      "project_id": "$PROJECT",
      "source_image_family": "ubuntu-2004-lts",
      "source_image_project_id": "ubuntu-os-cloud",
      "zone": "us-central1-b",
      "disk_size": "50",
      "image_name": "jenkins-agent-{{timestamp}}",
      "image_family": "jenkins-agent",
      "ssh_username": "ubuntu"
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections",
        "sudo apt-get update && sudo apt-get install -y -q default-jdk", 
        "sudo apt install -y -q docker.io",
        "sudo systemctl start docker",
        "sudo systemctl enable docker"
      ]
    }
  ]
}
EOF