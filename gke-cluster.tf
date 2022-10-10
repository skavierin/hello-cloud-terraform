
# Service account
resource "google_service_account" "gke_service_account" {
  account_id   = "service-account-id"
  display_name = "GKE Service Account"
}

# Artifact permissions
resource "google_project_iam_member" "allow_image_pull" {
  project = var.project_id
  role   = "roles/artifactregistry.reader"
  member = "serviceAccount:${google_service_account.gke_service_account.email}"
}

# Buckets permission
resource "google_project_iam_member" "allow_bucket_access" {
  project = var.project_id
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.gke_service_account.email}"
}

# Base cluster
resource "google_container_cluster" "primary" {
  name     = "general-purpose-gke-cluster"
  location = "europe-north1"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

# Custom nodepool
resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "node-pool"
  location   = "europe-north1"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.gke_service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
