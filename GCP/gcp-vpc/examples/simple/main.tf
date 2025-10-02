terraform {
  required_version = ">= 1.2.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
}

provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"
}

module "vpc" {
  source      = "../.."
  project_id  = "your-gcp-project-id"
  region      = "us-central1"
  vpc_name    = "demo-cloudiehub-vpc"
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
}

output "vpc_name" {
  value = module.vpc.vpc_name
}
