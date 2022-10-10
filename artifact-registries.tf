
resource "google_artifact_registry_repository" "main_container_registry" {
  location      = "europe-north1"
  repository_id = "main-container-registry"
  description   = "tryout repo"
  format        = "DOCKER"
}
