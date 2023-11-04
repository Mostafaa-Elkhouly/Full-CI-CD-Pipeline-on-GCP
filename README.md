# Full CI/CD Pipeline on GCP - Mostafa Elkhouly

## Overview

This project showcases the creation of a comprehensive CI/CD (Continuous Integration/Continuous Deployment) pipeline on Google Cloud Platform (GCP). The project evaluates expertise in various domains, including GCP, Networking, Development, Terraform, Docker, Kubernetes, and Jenkins as the CI/CD tool.

In this project, we deploy a simple Python Flask web application (stateless) using two primary Jenkins CI/CD pipelines. The first pipeline is responsible for building the project's infrastructure in GCP, and the second pipeline deploys the Python application.

## Key Features

The CI/CD pipeline consists of the following key components:

1. **Jenkins CI/CD Pipeline for Infrastructure Setup:**
   - This pipeline is connected to the project on GitHub.
   - Utilizes Terraform modules to build the required infrastructure on GCP.
   - Infrastructure components:
     - IAM: Sets up 2 service accounts with N roles.
     - Network: Creates 1 VPC, 2 subnets, N firewall rules, and 1 NAT gateway.
     - Compute: Deploys 1 public VM and 1 private GKE standard cluster across 3 zones.
     - Storage: Establishes an Artifact Registry repository to store container images.

2. **Jenkins CI/CD Pipeline for Application Deployment:**
   - This pipeline runs on the public VM created in GCP.
   - It is automatically triggered by the first pipeline upon successful completion.
   - The second pipeline performs the following tasks:
     - Dockerizes the Python Flask web application and pushes the app image to the Artifact Registry on GCP.
     - Deploys the Python Flask web application to the private GKE Cluster.
     - Exposes the web application using an ingress/load balancer.

## Security Considerations

- The management VM (public) is accessible only from the Jenkins server, enhancing security.
- The GKE cluster (private) has no direct access to the internet, improving network security.
- The VM is used for cluster management and building/pushing container images to the Artifact Registry.
- All deployed images must be stored in the Artifact Registry, ensuring image versioning and traceability.

## Prerequisites

Before setting up this CI/CD pipeline, ensure you have the following prerequisites in place:

1. A GCP account with appropriate permissions.
2. Jenkins installed and configured on your server.
3. A GitHub repository for the project.
4. Terraform, Docker, and Kubernetes tools installed on your Jenkins server.

## Usage

1. **Setting up the Infrastructure:**

    - Clone this GitHub repository.
    - Configure Jenkins to run the first CI/CD pipeline, linked to the GitHub repository.
    - Trigger the pipeline to build the GCP infrastructure.

2. **Deploying the Application:**

    - Once the infrastructure setup is complete, the second CI/CD pipeline will automatically trigger.
    - This pipeline will dockerize the web application, push the image to the Artifact Registry, and deploy it to the GKE cluster.

## Contact

For any questions or feedback regarding this project, please feel free to reach out to mostafa.elkhouly97@gmail.com.
