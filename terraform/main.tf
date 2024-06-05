provider "google" {
  project = var.project_id
  region  = var.region
}

# Enable the necessary APIs
resource "google_project_service" "container" {
  project = var.project_id
  service = "container.googleapis.com"
}

resource "google_project_service" "container_registry" {
  project = var.project_id
  service = "containerregistry.googleapis.com"
}

# Create GKE Cluster
resource "google_container_cluster" "primary" {
  name     = "primary-cluster"
  location = var.region

  node_config {
    machine_type = "e2-small"
    disk_size_gb = 10

  }

  initial_node_count = 1
}

