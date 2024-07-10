# GKE Web App Deployment

This repository contains a simple web application that is deployed on Google Kubernetes Engine (GKE) using Terraform and CI/CD pipeline. The purpose of this project is to demonstrate how to set up a full CI/CD pipeline for deploying a web application to a Kubernetes cluster on Google Cloud Platform.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Directory Structure](#directory-structure)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [CI/CD Pipeline](#cicd-pipeline)
- [Contributing](#contributing)
- [License](#license)

## Overview
This project deploys a simple Node.js web application to a GKE cluster. It includes the following:
- Terraform scripts for infrastructure as code.
- A Dockerfile for containerizing the Node.js application.
- A GitHub Actions workflow for CI/CD pipeline.

## Features
- Automated infrastructure provisioning using Terraform.
- Containerization of the application using Docker.
- Continuous Integration and Continuous Deployment using GitHub Actions.
- Deployment of the containerized application to GKE.

## Directory Structure

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


## Prerequisites
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- [Terraform](https://www.terraform.io/downloads.html)
- [Docker](https://www.docker.com/get-started)
- [Node.js](https://nodejs.org/en/download/)
- [GitHub Actions](https://github.com/features/actions)

## Setup
1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-username/gke-web-app-deployment.git
   cd gke-web-app-deployment

## Set up Google Cloud SDK:

```sh
gcloud auth login
gcloud config set project YOUR_PROJECT_ID
gcloud auth application-default login
```

## Configure Terraform:

Update terraform/backend.tf with your Google Cloud Storage bucket for state management.
Update terraform/variables.tf with your GKE cluster and network configuration.

Initialize and apply Terraform configuration:
```
cd terraform
terraform init
terraform apply
```

Build and push Docker image:
```
docker build -t gcr.io/YOUR_PROJECT_ID/gke-web-app:latest .
docker push gcr.io/YOUR_PROJECT_ID/gke-web-app:latest
```

Deploy the application:
Terraform script will handle deploying the application to GKE.

Usage
Access the deployed application via the external IP of the GKE service:

`kubectl get services`


Contributing
Contributions are welcome! Please open an issue or submit a pull request for any bugs, feature requests, or improvements.
