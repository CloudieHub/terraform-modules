output "instance_connection_name" {
  description = "The connection name of the Cloud SQL instance"
  value       = google_sql_database_instance.this.connection_name
}

output "instance_self_link" {
  description = "The self link of the Cloud SQL instance"
  value       = google_sql_database_instance.this.self_link
}

output "db_name" {
  description = "The default database name"
  value       = google_sql_database.default.name
}
