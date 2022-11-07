# Base cluster
resource "google_container_cluster" "primary" {
  name       = var.cluster_name
  location   = var.google_zone
  network    = var.network_id
  subnetwork = var.subnet_id

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

# Custom main workload nodepool
# Node count and machine type chosen to not go over basic account vCPU quota
resource "google_container_node_pool" "primary_preemptible_nodes" {
  name     = "main-nodepool-${var.cluster_name}"
  location = var.google_zone
  cluster  = google_container_cluster.primary.name
  initial_node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = var.max_node_count
  }

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    service_account = google_service_account.gke_service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}