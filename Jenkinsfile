pipeline {
    
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('swift-radar-399606')
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
                script {
                    sh 'terraform init'
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                script{
                    echo "Applying Terraform ...."
                    sh 'terraform apply -auto-approve'
                }
            }
        }

    }
}