# GCP Cloud SQL (CloudieHub)

This Terraform module provisions a **Google Cloud SQL instance** (MySQL, PostgreSQL, or SQL Server) with a database and user.  
It supports public or private networking and basic backup configuration.

---

## Features

- Creates a Cloud SQL instance with configurable tier and version  
- Supports PostgreSQL, MySQL, and SQL Server  
- Optional public IPv4 or private VPC connectivity  
- Configurable authorized networks for public access  
- Automatic database creation with user and password  
- Backup and deletion protection options  

---

## Resources Created

- `google_sql_database_instance` – Cloud SQL instance  
- `google_sql_database` – Default database  
- `google_sql_user` – Database user  

---

## Outputs

- `instance_connection_name` – Connection string for Cloud SQL  
- `instance_self_link` – Self link of the Cloud SQL instance  
- `db_name` – Name of the created database  

---

## Usage

See [examples/simple](./examples/simple/main.tf) for a root module that calls this module.
