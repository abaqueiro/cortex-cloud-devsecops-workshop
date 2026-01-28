provider "google" {
  project = "qwiklabs-gcp-00-a7e9a423c523"
  region = "us-central1"
}

resource "random_id" "rand_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "ejemplo" {
  name = "demo-${random_id.rand_suffix.hex}"
  location = "us-central1"
  force-destroy = true

  uniform_bucket_level_access = false
  public_access_prevention = "enforced"
}

output "bucket_name" {
  value = google_storage_bucket.ejemplo.name
}
