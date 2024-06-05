provider "google" {
  project = var.project_id
  region  = var.region
}

# Enable the necessary APIs
resource "google_project_service" "artifact_registry" {
  project = var.project_id
  service = "artifactregistry.googleapis.com"
}

resource "google_project_service" "container" {
  project = var.project_id
  service = "container.googleapis.com"
  depends_on = [google_project_service.artifact_registry]
}

# Create Artifact Registry Repository
resource "google_artifact_registry_repository" "my_repo" {
  provider = google
  location = var.region
  repository_id = "my-repo"
  format = "DOCKER"
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
  depends_on = [google_project_service.container]
}