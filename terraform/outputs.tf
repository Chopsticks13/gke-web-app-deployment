output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "kubeconfig" {
  value = google_container_cluster.primary.endpoint
}