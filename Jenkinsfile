// Jenkins Pipeline - GCP-Terraform
// This pipeline builds the infrastructure on Google Cloud Platform (GCP) and creates a private GKE cluster.

pipeline {
    
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('GOOGLE_APPLICATION_CREDENTIALS')
    }
    
    agent any    

    stages {
        stage('Checkout Code') {
            steps {
                // Clone the GitHub repository
                git branch: 'main',
                url: 'https://github.com/Mostafaa-Elkhouly/Full-CI-CD-Pipeline-on-GCP.git'
            }
        }

        stage('initialize Terraform') {
            steps {
                dir('./Terraform') {
                    script {
                        sh 'terraform init'
                    }
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                dir('./Terraform') {
                    script {
                        echo "Applying Terraform ...."
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

    }

    post{
        success{
            build propagate: false, job: 'GCP-Deploy-App'
        }
    }
}