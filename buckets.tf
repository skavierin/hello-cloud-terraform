resource "google_storage_bucket" "misc_storage" {
  name          = "${var.google_project}-misc-storage"
  location      = var.google_region
  storage_class = "STANDARD"
  force_destroy = true

  versioning {
    enabled = false
  }

  uniform_bucket_level_access = true
}
