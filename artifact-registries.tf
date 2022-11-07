resource "google_artifact_registry_repository" "main_container_registry" {
  location      = var.google_region
  repository_id = "main-container-registry"
  description   = "Main registry for everything"
  format        = "DOCKER"
}
