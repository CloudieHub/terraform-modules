# GCP Storage Bucket (CloudieHub)

This Terraform module provisions a **Google Cloud Storage (GCS) Bucket** with configurable options for storage class, versioning, access control, and labels.  
It is designed to provide secure and flexible object storage in GCP.

---

## Features

- Creates a GCS bucket in a specified location  
- Supports configurable storage classes (STANDARD, NEARLINE, COLDLINE, ARCHIVE)  
- Optional versioning for object history  
- Uniform bucket-level access for IAM policies  
- Force destroy option for automatic cleanup  
- Tagging support via labels  

---

## Resources Created

- `google_storage_bucket` – Cloud Storage bucket  

---

## Outputs

- `bucket_name` – The name of the created bucket  
- `bucket_url` – The URL of the bucket  

---

## Usage

See [examples/simple](./examples/simple/main.tf) for a root module that calls this module.
