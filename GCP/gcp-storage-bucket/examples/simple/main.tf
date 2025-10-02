provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"
}

module "gcs_bucket" {
  source                     = "../../"
  bucket_name                = "cloudiehub-demo-bucket"
  location                   = "US"
  storage_class              = "STANDARD"
  force_destroy              = true
  versioning                 = true
  uniform_bucket_level_access = true
  labels = {
    project     = "cloudiehub"
    environment = "demo"
  }
}

output "bucket_name" {
  value = module.gcs_bucket.bucket_name
}
