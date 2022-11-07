module "zonal_private_gke_cluster" {
  source = "./zonal_private_gke_cluster"

  cluster_name   = "primary"
  max_node_count = 4

  network_id = google_compute_network.default.id
  subnet_id  = google_compute_subnetwork.default.id

  google_project = var.google_project
  google_zone    = var.google_zone

  depends_on = [
    google_compute_network.default,
    google_compute_subnetwork.default,
    google_artifact_registry_repository.main_container_registry
  ]
}
