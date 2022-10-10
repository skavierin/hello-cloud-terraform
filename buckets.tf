
resource "google_storage_bucket" "static-site" {
  name          = "test-stuff-349017_misc-storage"
  location      = "europe-north1"
  storage_class = "STANDARD"
  force_destroy = true
  
  uniform_bucket_level_access = true
}
