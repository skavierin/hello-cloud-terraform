# Service account
resource "google_service_account" "gke_service_account" {
  account_id   = "service-account-gke-${var.cluster_name}"
  display_name = "Service Account for GKE cluster ${var.cluster_name}"
}

# Artifact permissions
resource "google_project_iam_member" "allow_image_pull" {
  project = var.google_project
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}

# Buckets permission
resource "google_project_iam_member" "allow_bucket_access" {
  project = var.google_project
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}
