provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"
}

module "cloud_sql" {
  source            = "../../"
  instance_name     = "cloudiehub-sql"
  database_version  = "POSTGRES_14"
  region            = "us-central1"
  tier              = "db-f1-micro"
  database_name     = "appdb"
  db_user           = "admin"
  db_password       = "StrongPass123!"
  ipv4_enabled      = true
  authorized_networks = [
    {
      name  = "home"
      value = "0.0.0.0/0"
    }
  ]
}

output "instance_connection_name" {
  value = module.cloud_sql.instance_connection_name
}
