resource "google_sql_database_instance" "this" {
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region

  settings {
    tier = var.tier

    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      private_network = var.private_network
      authorized_networks = var.authorized_networks
    }

    backup_configuration {
      enabled = var.backup_enabled
    }
  }

  deletion_protection = var.deletion_protection
}

resource "google_sql_database" "default" {
  name     = var.database_name
  instance = google_sql_database_instance.this.name
}

resource "google_sql_user" "default" {
  name     = var.db_user
  instance = google_sql_database_instance.this.name
  password = var.db_password
}
