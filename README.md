GKE Web App Deployment
This repository contains a simple web application that is deployed on Google Kubernetes Engine (GKE) using Terraform and CI/CD pipeline. The purpose of this project is to demonstrate how to set up a full CI/CD pipeline for deploying a web application to a Kubernetes cluster on Google Cloud Platform.

Table of Contents
Overview
Features
Directory Structure
Prerequisites
Setup
Usage
CI/CD Pipeline
Contributing
License
Overview
This project deploys a simple Node.js web application to a GKE cluster. It includes the following:

Terraform scripts for infrastructure as code.
A Dockerfile for containerizing the Node.js application.
A GitHub Actions workflow for CI/CD pipeline.
Features
Automated infrastructure provisioning using Terraform.
Containerization of the application using Docker.
Continuous Integration and Continuous Deployment using GitHub Actions.
Deployment of the containerized application to GKE.
Directory Structure
go
Copy code
gke-web-app-deployment/
├── .github/
│   └── workflows/
│       └── terraform.yml
├── terraform/
│   ├── backend.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
├── .gitignore
├── Dockerfile
├── app.js
├── package-lock.json
├── package.json
└── README.md
Prerequisites
Google Cloud SDK
Terraform
Docker
Node.js
GitHub Actions
Setup
Clone the repository:

sh
Copy code
git clone https://github.com/your-username/gke-web-app-deployment.git
cd gke-web-app-deployment
Set up Google Cloud SDK:

sh
Copy code
gcloud auth login
gcloud config set project YOUR_PROJECT_ID
gcloud auth application-default login
Configure Terraform:

Update terraform/backend.tf with your Google Cloud Storage bucket for state management.
Update terraform/variables.tf with your GKE cluster and network configuration.
Initialize and apply Terraform configuration:

sh
Copy code
cd terraform
terraform init
terraform apply
Build and push Docker image:

sh
Copy code
docker build -t gcr.io/YOUR_PROJECT_ID/gke-web-app:latest .
docker push gcr.io/YOUR_PROJECT_ID/gke-web-app:latest
Deploy the application:
Terraform script will handle deploying the application to GKE.

Usage
Access the deployed application via the external IP of the GKE service:
sh
Copy code
kubectl get services
Navigate to the external IP in your browser to see the "Hello World!" message.
CI/CD Pipeline
The CI/CD pipeline is implemented using GitHub Actions. The workflow file .github/workflows/terraform.yml automates the following tasks:

Check out the code.
Set up Terraform.
Configure Google Cloud credentials.
Initialize and apply Terraform configuration.
Build and push Docker image to Google Container Registry.
Deploy the application to GKE.
Contributing
Contributions are welcome! Please open an issue or submit a pull request for any bugs, feature requests, or improvements.
